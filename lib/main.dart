import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  int _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      "question": "What's your favorite color?",
      "answer": ['Black', 'Red', 'Green', 'Blue'],
    },
    {
      "question": "What's your favorite animal?",
      "answer": ['Bird', 'Dog', 'Cat', 'Snake'],
    },
    {
      "question": "What's your favorite country?",
      "answer": ['Germany', 'Brazil', 'Spain', 'EUA'],
    }
  ];

  void _pergunta() {
    if (hasSelectedQuestion) {
      setState(() => {_perguntaSelecionada++});
    }
  }

  bool get hasSelectedQuestion {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers =
        hasSelectedQuestion ? _perguntas[_perguntaSelecionada]['answer'] : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
          centerTitle: true,
        ),
        body: hasSelectedQuestion
            ? Column(
                children: [
                  Question(_perguntas[_perguntaSelecionada]['question']),
                  ...answers
                      .map((answer) => Answer(answer, _pergunta))
                      .toList(),
                ],
              )
            : Center(
                child: Text(
                  'Congrats!',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
