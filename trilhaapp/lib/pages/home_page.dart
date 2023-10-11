import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/service/gerador_numero_aleatorio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var numeroGerado = 0;
  var quantidadeCliques = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu App", 
        style: GoogleFonts.roboto(),
        ),),
      body: Container(
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: Colors.green,
                width: double.infinity,
                child: const Text(
                  "Ações do Usuário",
                  //style: GoogleFonts.acme(),
                ),
              ),
            ),
            Text(
              "Quantidade de Cliques: $quantidadeCliques",
              //style: GoogleFonts.acme(),
            ),
            Text(
              "Número Gerado $numeroGerado",
              //style: GoogleFonts.acme(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blue,
                    child: const Text(
                    "Nome:",
                    //style: GoogleFonts.acme(),
                                ),
                  ),
                ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.amber,
                  child: const Text(
                    "Daniel takeshi",
                    //style: GoogleFonts.acme(),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.red,
                  child: const Text(
                    "20",
                    //style: GoogleFonts.acme(),
                  ),
                ),
              ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_box),
        onPressed: () {
          setState(() {
            quantidadeCliques = quantidadeCliques + 1;
            numeroGerado = GeradorNumeroAleatorioService.gerarNumeroAleatorio(1000);
            debugPrint(numeroGerado.toString());
          });
        }),
    );
  }
}