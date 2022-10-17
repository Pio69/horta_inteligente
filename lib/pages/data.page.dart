import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  var data;
  Future<void> getUserApi() async {
    final response = await http
        .get(Uri.parse('https://smartgarden.onlosant.com/device/get/data'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString())["timeSeries"];
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Leonardo Pio'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading');
                } else {
                  return Card(
                    child: Column(
                      children: [
                        ReusbaleRow(
                          title: 'Temperatura do Ar',
                          value: this.data["airSensor"][0]["value"].toString(),
                        ),
                        ReusbaleRow(
                          title: 'Umidade do Ar',
                          value: this
                              .data["humiditySensor"][0]["value"]
                              .toString(),
                        ),
                        ReusbaleRow(
                          title: 'Luminosidade',
                          value:
                              this.data["lightSensor"][0]["value"].toString(),
                        ),
                        ReusbaleRow(
                          title: 'Umidade do solo',
                          value: this
                              .data["soilMoistureSensor"][0]["value"]
                              .toString(),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class ReusbaleRow extends StatelessWidget {
  String title, value;
  ReusbaleRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
