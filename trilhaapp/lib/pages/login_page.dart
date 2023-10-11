import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const SizedBox(height: 100,),
            Container(
              margin: const EdgeInsets.only(top: 50),
              width: 150,
              height: 150,
              //color: Colors.amber,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 8,
                    child: Image.network("https://hermes.digitalinnovation.one/assets/diome/logo.png",
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            const Text ("Já tem cadastro?", style: TextStyle(fontWeight: FontWeight.w900),),
            const Text ("Faça seu login and make the change"),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              //color: Colors.green,
              height: 30,
              alignment: Alignment.center,
              child: Row(
                children: const [
                  Expanded( flex: 1, child: Text("Informe seu email:")),
                  Expanded( flex: 3, child: Text("Email")),
                ],
              ),
              ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              //color: Colors.green,
              height: 30,
              alignment: Alignment.center,
              child: Row(
                children: const [
                  Expanded( flex: 1, child: Text("Informe a Senha:")),
                  Expanded( flex: 3, child: Text("Senha")),
                ],
              ),
              ),
            Expanded(child: Container(),),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: 
                SizedBox(
                  width: double.infinity,
                  child: TextButton(onPressed: () {}, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent)
                  ),
                  child: Text("ENTRAR")),
                )
                ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: const Text("Cadastro"),
              ),
              const SizedBox(height: 80,),
          ]),
        ),
      ),
    );
  }
}