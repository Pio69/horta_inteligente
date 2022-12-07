import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:horta_inteligente/pages/users-list.page.dart';
import 'package:http/http.dart' as http;

import 'chart.page.dart';

import 'package:http_pro/http.dart' as https;
import 'package:http_pro/response.dart';

class UserForm extends StatefulWidget {
  final String id;
  const UserForm({Key? key, required this.id}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data;

    if (widget.id != null && widget.id != "") {
      Future<void> getUserApi() async {
        final response = await http.get(Uri.parse(
            'https://smartgarden.onlosant.com/users/list?id=${widget.id}'));

        if (response.statusCode == 200) {
          data = jsonDecode(response.body);
          login.text = data['email'];
          password.text = data['email'];
          name.text = data['firstName'];
        } else {}
      }

      getUserApi();
    }

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Center(
            child: Container(
              padding: EdgeInsets.only(top: 60, left: 40, right: 40),
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    width: 128,
                    height: 128,
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 40.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    controller: login,
                    decoration: InputDecoration(
                      labelText: "Digite o e-mail",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira o email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // autofocus: true,
                    obscureText: true,
                    enableSuggestions: false,
                    controller: password,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: "Digite a senha",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira a senha';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // autofocus: true,
                    controller: name,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: "Digite o nome",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira o nome';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    child: Text(
                      ((widget.id != null && widget.id != "")
                          ? "Editar"
                          : "Cadastrar"),
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF1A1A27),
                    ),
                    onPressed: () async {
                      //Future<String?> res = _apiCall("user@example.com", "12345678");
                      if (widget.id != null && widget.id != "") {
                        _apiCallEdit(
                            widget.id, login.text, password.text, name.text);
                      } else {
                        _apiCallSave(login.text, password.text, name.text);
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UsersList(),
                        ),
                      );
                    },
                  ), //this.data["airSensor"][0]["value"].toString()}°C',
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<String?> _apiCallSave(String email, String password, String name) async {
  Response res = await https.get(
    "https://smartgarden.onlosant.com/users/save?email=${email}&password=${password}&name=${name}",
  );
  if (res.statusCode == 200 || res.statusCode == 302) {
    return res.headers["set-cookie"];
  } else {
    return null;
  }
}

Future<String?> _apiCallEdit(
    String id, String email, String password, String name) async {
  Response res = await https.get(
    "https://smartgarden.onlosant.com/users/edit?id=${id}&email=${email}&password=${password}&name=${name}",
  );
  if (res.statusCode == 200 || res.statusCode == 302) {
    return res.headers["set-cookie"];
  } else {
    return null;
  }
}
