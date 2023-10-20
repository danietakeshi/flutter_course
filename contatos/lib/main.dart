import 'package:contatos/contatos_model.dart';
import 'package:contatos/contatos_repository.dart';
import 'package:flutter/material.dart';

import 'add_contact_page.dart';
import 'details_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _contatos = ContatosModel();
  final TextEditingController _textFieldController = TextEditingController();

  void getContatos() async {
    _contatos = await ContatosRepository().get();
    setState(() {
      
    });
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    getContatos();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Call Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddContactPage(),
                ),
              );
              setState(() {
                      getContatos();
                    });
              },
              child: const Text('Register Contact'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
            child: ListView.builder(
              itemCount: _contatos.results?.length,
              itemBuilder: (context, index) {
                var contatoElement = _contatos.results![index];
                return GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ContactDetailsPage(contatoElement), // Pass data to the details page
                      ),
                    );
                    setState(() {
                      getContatos();
                    });
                  },
                  child: ListTile(
                    title: Text('Contato: ${contatoElement.nome}'),
                    subtitle: Text('Telefone: ${contatoElement.telefone} - Email: ${contatoElement.email}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await ContatosRepository().delete(contatoElement.objectId);
                        setState(() {
                          _contatos.results?.removeAt(index);
                          getContatos();
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
