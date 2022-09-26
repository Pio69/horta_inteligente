import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: SizedBox(
            width: 100,
            child: Image.asset(
                "C:/Users/Pio/Workspace/Flutter/Projetos/horta_inteligente/lib/assets/Logo.png"),
          ),
        ),
      ),
    );
  }
}
