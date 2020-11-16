import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int pontuacao;
  final void  Function() reiniciarQuestionario;

  Result(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 20) {
      return 'You dont know me';
    } else {
      return 'You know me';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        FlatButton(
          onPressed: reiniciarQuestionario, 
          child: Text('Restart?', style: TextStyle(fontSize: 18)),
          textColor: Colors.blue,
        )
      ],
    );
  }
}
