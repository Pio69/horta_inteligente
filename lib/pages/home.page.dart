import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http_pro/http.dart' as http;
import 'package:http_pro/response.dart';

Future<Map<String?, dynamic>>? dados = null;
String? airSensor = "";
String? humiditySensor = "";
String? soilMoistureSensor = "";
String? lightSensor = "";

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dados = _apiCall();
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
      body: Container(
        child: ListView(
          children: <Widget>[
            Text(
              "Temperatura do ar: ${airSensor}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Umidade do ar: ${humiditySensor}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Umidade do solo: ${soilMoistureSensor}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Luminosidade do ambiente: ${lightSensor}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Map<String?, dynamic>> _apiCall() async {
  Response res = await http.get(
    "https://smartgarden.onlosant.com/device/get/data",
  );
  if (res.statusCode == 200 || res.statusCode == 302) {
    Map<String?, dynamic> decodeJson = json.decode(res.body);
    airSensor = "${decodeJson["timeSeries"]["airSensor"][0]["value"]}";
    humiditySensor =
        "${decodeJson["timeSeries"]["humiditySensor"][0]["value"]}";
    soilMoistureSensor =
        "${decodeJson["timeSeries"]["soilMoistureSensor"][0]["value"]}";
    lightSensor = "${decodeJson["timeSeries"]["lightSensor"][0]["value"]}";
    return decodeJson;
  } else {
    return {};
  }
}
