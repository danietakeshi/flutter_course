import 'package:flutter/material.dart';
import 'package:viacep/cep_model.dart';
import 'dart:convert';

import 'package:viacep/cep_repository.dart';
import 'package:viacep/viacep_model.dart';
import 'package:viacep/viacep_repository.dart';

import 'details_page.dart';

class ApiCallPage extends StatefulWidget {
  const ApiCallPage({super.key});

  @override
  _ApiCallPageState createState() => _ApiCallPageState();
}

class _ApiCallPageState extends State<ApiCallPage> {
  final TextEditingController _textFieldController = TextEditingController();

  var _cep = CEPModel([]);
  var _viacep = ViaCEPModel();
  
  get itemBuilder => null;

  @override
  void initState() {
    super.initState();
    getCEP();
  }

  void getCEP() async {
    _cep = await CEPRepository().get();
    setState(() {
      
    });
  }

  void getVIACEP(String cep) async {
    _viacep = await ViaCEPRepository().get(cep.replaceAll("-", ""));
    await CEPRepository().post(_viacep);
    setState(() {
      getCEP();
    });
  }

  bool isValuePresent(List<CEP> dictionary, String targetValue) {
  for (var key in dictionary) {
    if (key.cep == targetValue) {
      return true;
    }
  }
  return false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Call Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(labelText: 'Enter API URL'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                if (isValuePresent(_cep.cep, _textFieldController.text.toString())) {
                  print("CEP já listado!");
                } else if (_textFieldController.text.isNotEmpty) {
                  getVIACEP(_textFieldController.text.toString());
                  _textFieldController.clear();
                }
                setState(() {
                  getCEP();
                });
              },
              child: const Text('Make API Call'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
            child: ListView.builder(
              itemCount: _cep.cep.length,
              itemBuilder: (context, index) {
                var cepElement = _cep.cep[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(cepElement), // Pass data to the details page
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text('CEP: ${cepElement.cep}'),
                    subtitle: Text('Endereço: ${cepElement.logradouro}, ${cepElement.complemento}, ${cepElement.uf}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await CEPRepository().delete(cepElement.objectId);
                        setState(() {
                          _cep.cep.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          ],
        ),
      ),
    );
  }
}
