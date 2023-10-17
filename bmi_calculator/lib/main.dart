
import 'package:bmi_calculator/imc_sqlite_model.dart';
import 'package:bmi_calculator/user_config_model.dart';
import 'package:bmi_calculator/user_config_repository.dart';
import 'package:bmi_calculator/sqlitedatabase.dart' as sql;

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


import 'configuration_page.dart';
import 'imc_sqlite_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory = 'D:/';

  Hive.init(documentsDirectory);

  Hive.registerAdapter(DadosUsuarioModelAdapter());

  sql.SQLiteDataBase().iniciarBancoDeDados();

  runApp(const BMICalculatorApp());

  
}


class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  List<BMIData> bmiDataList = [];

  MedidaIMCSQLiteRepository imcRepository = MedidaIMCSQLiteRepository();
  var _tarefas = const <IMCSQLiteModel>[];

  TextEditingController nameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  void _calculateBMI() {
    double? height = double.tryParse(heightController.text);
    double? weight = double.tryParse(weightController.text);
    String? name = nameController.text;

    if (height != null && weight != null) {
      double bmi = weight / (height * height);
      String bmiDesc = descriptionIMC(bmi);
      BMIData data = BMIData(name, height, weight, bmi, bmiDesc);
      IMCSQLiteModel medida = IMCSQLiteModel(100, name, height, weight, bmi, bmiDesc);

      setState(() {
        imcRepository.salvar(medida);
        bmiDataList.add(data);
        weightController.clear();
        carregarDados();
        obterMedidas();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
    obterMedidas();
  }

  void obterMedidas() async {
    _tarefas = await imcRepository.obterDados();
    setState(() {});
  }

  salvarSQLite(BMIData lista) {
    
  }

  String descriptionIMC(double bmi) {
  if (bmi < 16) {
    return "Magreza grave";
  } else if (bmi >= 16 && bmi < 17) {
    return "Magreza moderada";
  } else if (bmi >= 17 && bmi < 18.5) {
    return "Magreza leve";
  } else if (bmi >= 18.5 && bmi < 25) {
    return "Saudável";
  } else if (bmi >= 25 && bmi < 30) {
    return "Sobrepeso";
  } else if (bmi >= 30 && bmi < 35) {
    return "Obesidade Grau I";
  } else if (bmi >= 35 && bmi < 40) {
    return "Obesidade Grau II (severa)";
  } else if (bmi >= 40) {
    return "Obesidade Grau III (mórbida)";
  } else {
    return "";
  }
}

carregarDados() async {
    var dadosUsuarioRepository = await DadosUsuarioRepository.carregar();
    var dadosUsuario = dadosUsuarioRepository.obterDados();
    nameController.text = dadosUsuario.nome ?? "";
    heightController.text = dadosUsuario.altura == null
        ? ""
        : dadosUsuario.altura.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  keyboardType: TextInputType.name,
                ),
                TextField(
                  controller: heightController,
                  decoration: const InputDecoration(labelText: 'Height (m)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: weightController,
                  decoration: const InputDecoration(labelText: 'Weight (kg)'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _calculateBMI,
                  child: const Text('Calculate BMI'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                var tarefa = _tarefas[index];
                return ListTile(
                  title: Text('Name: ${tarefa.nome} | Height: ${tarefa.altura} m, Weight: ${tarefa.peso} kg'),
                  subtitle: Text('BMI: ${tarefa.imc.toStringAsFixed(2)} - ${tarefa.imcDescricao}'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Use Navigator to navigate to the 'configuration_page.dart' when the button is pressed.
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ConfigurationPage(),
            ),
          ).then((value) => setState(() {
            carregarDados();
          },));
        },
        child: Icon(Icons.settings),
      ),
    );
  }
}

class BMIData {
  final double height;
  final double weight;
  final double bmi;
  final String bmiDesc;
  final String name;

  BMIData(this.name, this.height, this.weight, this.bmi, this.bmiDesc);
}