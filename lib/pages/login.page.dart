import 'reset-password.page.dart';
import 'home.page.dart';
import 'signup.page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 60, left: 40, right: 40),
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("assets/images/Logo.png"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                // autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Digite o e-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                // autofocus: true,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Digite a senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                style: TextStyle(fontSize: 14),
              ),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    "Esqueceu a senha?",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Color(0xFF1A1A27)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordPage(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: TextButton(
                  child: Text(
                    'Entrar',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF1A1A27),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
