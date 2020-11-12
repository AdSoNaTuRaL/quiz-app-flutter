import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizAppState extends State<QuizApp> {
  int perguntaSelecionada = 0;

  void pergunta() {
    setState(() => {
      perguntaSelecionada++
    });
    print(perguntaSelecionada);
  }
  
  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      "What's your favorite color?",
      "What's your favorite animal?",
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text(perguntas[perguntaSelecionada]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: pergunta,
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: pergunta,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: pergunta,
            ),
          ],
        ),
      ),
    );
  }
}
class QuizApp extends StatefulWidget {
  @override
  QuizAppState createState() {
    return QuizAppState();
  }

}