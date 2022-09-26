import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1A27),
        title: Center(
          child: SizedBox(
            width: 150,
            child: Text('Leonardo Pio'),
          ),
        ),
      ),
    );
  }
}
