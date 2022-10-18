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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: const Text('Temperatura do Ar'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(
                                    Icons.device_thermostat,
                                    color: Colors.deepOrange,
                                    size: 30.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    '${this.data["airSensor"][0]["value"].toString()}°C',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: const Text('Umidade do Ar'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(
                                    Icons.water_drop,
                                    color: Colors.blue,
                                    size: 30.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    '${this.data["humiditySensor"][0]["value"].toString()}%',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: const Text('Luminosidade'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(
                                    Icons.light_mode,
                                    color: Colors.yellow[800],
                                    size: 30.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    '${(double.parse(this.data["lightSensor"][0]["value"].toString()) * 100).toString()}%',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: const Text('Umidade do solo'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(
                                    Icons.opacity,
                                    color: Colors.brown,
                                    size: 30.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    '${this.data["soilMoistureSensor"][0]["value"].toString()}%',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
