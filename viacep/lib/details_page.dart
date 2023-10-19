import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cep_model.dart';

class DetailsPage extends StatelessWidget {
  final CEP cepElement;

  DetailsPage(this.cepElement);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Details Page'),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'CEP: ${cepElement.cep}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Endereço: ${cepElement.logradouro}, ${cepElement.complemento}, ${cepElement.uf}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Posted on: ${DateTime.now().toString()}', // Replace with actual post date
                    style: const TextStyle(fontSize: 12, color: CupertinoColors.systemGrey),
                  ),
                  const Divider(),
                  const Text(
                    'Blog Post Content:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Here goes your blog post content. You can display your blog text here, and you can format it as you like.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
