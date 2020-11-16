import 'package:flutter/material.dart';
import './result.dart';
import './questionario.dart';

void main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      "question": "What's your favorite color?",
      "answer": [
        {'text': 'Black', 'ponto': 10},
        {'text': 'Red', 'ponto': 7},
        {'text': 'Green', 'ponto': 3},
        {'text': 'Blue', 'ponto': 6},
      ],
    },
    {
      "question": "What's your favorite animal?",
      "answer": [
        {'text': 'Bird', 'ponto': 2},
        {'text': 'Dog', 'ponto': 10},
        {'text': 'Cat', 'ponto': 8},
        {'text': 'Snake', 'ponto': 0},
      ],
    },
    {
      "question": "What's your favorite country?",
      "answer": [
        { 'text': 'Germany', 'ponto': 9 },
        { 'text': 'Brazil', 'ponto': 10 },
        { 'text': 'Spain', 'ponto': 7 },
        { 'text': 'EUA', 'ponto': 0 },
      ],
    }
  ];

  bool get hasSelectedQuestion {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _pergunta(int pontuacao) {
    if (hasSelectedQuestion) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
          centerTitle: true,
        ),
        body: hasSelectedQuestion
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _pergunta,
              )
            : Result(_pontuacaoTotal, _reiniciarQuestionario),
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
