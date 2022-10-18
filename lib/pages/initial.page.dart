import 'dart:async';

import 'package:flutter/material.dart';
import 'package:horta_inteligente/pages/login.page.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Column(children: <Widget>[
            SizedBox(
              height: 210,
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: SizedBox(
                width: 228,
                height: 228,
                child: Image.asset("assets/images/LogoWhite.png"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Text(
              "DESENVOLVIDO POR",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 9),
            ),
            Text(
              "EQUIPE ROCKET",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ])),
          backgroundColor: Color(0xFF1A1A27)),
    );
  }
}
