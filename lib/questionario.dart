import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
  });

  bool get hasSelectedQuestion {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasSelectedQuestion 
      ? perguntas[perguntaSelecionada]['answer'] 
      : null;

    return  Column(
      children: [
        Question(perguntas[perguntaSelecionada]['question']),
        ...answers
            .map((answer) => Answer(answer['text'], () => responder(answer['ponto'])))
            .toList(),
      ],
    );
  }
}