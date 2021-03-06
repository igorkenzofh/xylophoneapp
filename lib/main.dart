import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(
    XylophoneApp()); // Essa flecha se chama fat arrow e é usada quando a função tem 1 linha
// =>x é igual a {return x}

// Função para tocar diferentes sons
class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    // input vai dentro dos parenteses date type, name
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  // Função para trocar cor e som
  Expanded buildKey({int soundNumber, Color color}) {
    // Color é um data type
    return Expanded(
      child: FlatButton(
        onPressed: () {
          final player = AudioCache();
          player.play('note$soundNumber.wav');
        },
        color: color, //Não confundir com Color, é color, minusculo
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  // Primeiro feito na raça
                  child: FlatButton(
                    onPressed: () {
                      final player = AudioCache();
                      player.play('note1.wav');
                    },
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  // Segundo com função simples
                  child: FlatButton(
                    onPressed: () {
                      playSound(2);
                    },
                    color: Colors.orange,
                  ),
                ),
                buildKey(soundNumber: 3, color: Colors.yellow),
                buildKey(soundNumber: 4, color: Colors.green),
                buildKey(soundNumber: 5, color: Colors.teal),
                buildKey(soundNumber: 6, color: Colors.blue),
                buildKey(soundNumber: 7, color: Colors.purple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
