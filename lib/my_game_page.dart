// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class MyGame extends StatefulWidget {
  const MyGame({Key? key}) : super(key: key);

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  List<List<String>> grade = List.generate(3, (_) => List.filled(3, ''));

  String jogadorAtual = 'X';
  String textoInformativo = 'Vamos começar?';
  bool jogoIniciado = false;
  int jogadas = 0;

  int placarX = 0;
  int placarO = 0;
  int empates = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Jogo da Velha",
              style: TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

    
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'X: $placarX   |   O: $placarO   |   Empates: $empates',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          
          AbsorbPointer(
            absorbing: !jogoIniciado,
            child: Column(
              children: List.generate(3, (linha) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (coluna) {
                    return myButton(linha: linha, coluna: coluna);
                  }),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),

          // ℹ️ Informações
          Text(
            textoInformativo,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!jogoIniciado) btInicio(),
              const SizedBox(width: 20),
              btResetar(), 
            ],
          ),
        ],
      ),
    );
  }

  Widget myButton({required int linha, required int coluna}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AbsorbPointer(
        absorbing: grade[linha][coluna] != '',
        child: ElevatedButton(
          onPressed: () => setState(() => clique(linha: linha, coluna: coluna)),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(100, 100),
            backgroundColor: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(color: Colors.black26),
            ),
          ),
          child: Text(
            grade[linha][coluna],
            style: const TextStyle(
              fontSize: 50,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget btInicio() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          jogoIniciado = true;
          jogadas = 0;
          jogadorAtual = 'X';
          grade = List.generate(3, (_) => List.filled(3, ''));
          textoInformativo = '$jogadorAtual é sua vez.';
        });
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(240, 50),
        backgroundColor: Colors.amber,
      ),
      child: Text(
        jogadas > 0 ? "Jogar Novamente" : "Bora Jogar!",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  Widget btResetar() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          placarX = 0;
          placarO = 0;
          empates = 0;
          jogadas = 0;
          grade = List.generate(3, (_) => List.filled(3, ''));
          jogadorAtual = 'X';
          textoInformativo = 'Vamos começar?';
          jogoIniciado = false;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        fixedSize: const Size(130, 50),
      ),
      child: const Text(
        "Resetar Jogo",
        style: TextStyle(fontSize: 16, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  void clique({required int linha, required int coluna}) {
    grade[linha][coluna] = jogadorAtual;
    jogadas++;

    if (verificaVencedor(jogadorAtual)) {
      textoInformativo = '$jogadorAtual venceu!';
      jogoIniciado = false;

      if (jogadorAtual == 'X') {
        placarX++;
      } else {
        placarO++;
      }
    } else if (jogadas == 9) {
      textoInformativo = 'Empate!';
      jogoIniciado = false;
      empates++;
    } else {
      jogadorAtual = jogadorAtual == 'X' ? 'O' : 'X';
      textoInformativo = '$jogadorAtual é sua vez.';
    }
  }

  bool verificaVencedor(String jogador) {
    for (int i = 0; i < 3; i++) {
      if (grade[i].every((cel) => cel == jogador)) return true;
      if (grade.every((linha) => linha[i] == jogador)) return true;
    }

    if (grade[0][0] == jogador &&
        grade[1][1] == jogador &&
        grade[2][2] == jogador) return true;

    if (grade[0][2] == jogador &&
        grade[1][1] == jogador &&
        grade[2][0] == jogador) return true;

    return false;
  }
}
