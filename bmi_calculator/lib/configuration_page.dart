import 'package:bmi_calculator/user_config_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:bmi_calculator/user_config_repository.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  var dadosUsuarioModel = DadosUsuarioModel.vazio();
  late DadosUsuarioRepository dadosUsuarioRepository;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  late Box storage;
  int height = 0;
  String name = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }


  carregarDados() async {
    dadosUsuarioRepository = await DadosUsuarioRepository.carregar();
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
        title: const Text('User Configuration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) async {
                setState(() {
                dadosUsuarioModel.nome = value.toString();
                });
              },
            ),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(labelText: 'Height (m)'),
              keyboardType: TextInputType.number,
              onChanged: (value) async {
                setState(() {
                  dadosUsuarioModel.altura = double.tryParse(value);
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                dadosUsuarioModel.nome = nameController.text;
                dadosUsuarioModel.altura = double.tryParse(heightController.text);
                dadosUsuarioRepository.salvar(dadosUsuarioModel);
                Navigator.of(context).pop(); // Return to the previous screen
                setState(() {
                });
              },
              child: const Text('Save Configuration'),
            ),
          ],
        ),
      ),
    );
  }
}
