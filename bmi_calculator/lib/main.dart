import 'package:flutter/material.dart';

void main() {
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

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  void _calculateBMI() {
    double? height = double.tryParse(heightController.text);
    double? weight = double.tryParse(weightController.text);

    if (height != null && weight != null) {
      double bmi = weight / (height * height);
      String bmiDesc = descriptionIMC(bmi);
      BMIData data = BMIData(height, weight, bmi, bmiDesc);

      setState(() {
        bmiDataList.add(data);
        heightController.clear();
        weightController.clear();
      });
    }
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
              itemCount: bmiDataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Height: ${bmiDataList[index].height} m, Weight: ${bmiDataList[index].weight} kg'),
                  subtitle: Text('BMI: ${bmiDataList[index].bmi.toStringAsFixed(2)} - ${bmiDataList[index].bmiDesc}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BMIData {
  final double height;
  final double weight;
  final double bmi;
  final String bmiDesc;

  BMIData(this.height, this.weight, this.bmi, this.bmiDesc);
}
