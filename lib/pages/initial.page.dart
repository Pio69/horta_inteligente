import 'dart:async';

import 'package:flutter/material.dart';
import 'package:horta_inteligente/pages/login.page.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Image.asset("assets/images/LogoWhite.png")),
        backgroundColor: Color(0xFF1A1A27));
  }
}
