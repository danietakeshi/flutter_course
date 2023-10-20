import 'package:flutter/material.dart';

import 'contatos_model.dart';

class ContactDetailsPage extends StatelessWidget {
  
  final Results contatoElement;

  ContactDetailsPage(this.contatoElement);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage('${contatoElement.photoPath}'), // or AssetImage for local images
              ),
            ),
          ),
          ListTile(
            title: const Text('Name'),
            subtitle: Text('${contatoElement.nome}'),
          ),
          ListTile(
            title: const Text('Telephone Number'),
            subtitle: Text('${contatoElement.telefone}'),
          ),
          ListTile(
            title: const Text('Email'),
            subtitle: Text('${contatoElement.email}'),
          ),
        ],
      ),
    );
  }
}
