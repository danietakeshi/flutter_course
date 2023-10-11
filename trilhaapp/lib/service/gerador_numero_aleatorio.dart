import 'dart:math';

class GeradorNumeroAleatorioService {
  static int gerarNumeroAleatorio(int numerMaximo) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(numerMaximo);
  }
}