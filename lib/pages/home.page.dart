import 'package:flutter/material.dart';

import 'package:http_pro/http.dart' as http;
import 'package:http_pro/response.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _apiCall();
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
      body: Text(""),
    );
  }
}

Future<String?> _apiCall() async {
  Response res = await http.get(
    "https://smartgarden.onlosant.com/device/get/data",
  );
  if (res.statusCode == 200 || res.statusCode == 302) {
    return res.body;
  } else {
    return null;
  }
}
