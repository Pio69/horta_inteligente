import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({Key? key}) : super(key: key);

  @override
  _ExampleFourState createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;
  Future<void> getUserApi() async {
    final response = await http
        .get(Uri.parse('https://smartgarden.onlosant.com/events/get'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Eventos'),
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
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              ReusbaleRow(
                                title: 'Nivel',
                                value: data[index]['level'].toString(),
                              ),
                              ReusbaleRow(
                                title: 'Descrição',
                                value: data[index]['message'].toString(),
                              ),
                              ReusbaleRow(
                                title: 'status',
                                value: data[index]['status'].toString(),
                              ),
                            ],
                          ),
                        );
                      });
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
    if (value == "warning") {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
                padding: EdgeInsets.all(5),
                child: Text(title)),
            Container(
              constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.error,
                color: Colors.yellow,
                size: 30.0,
              ),
            ),
          ],
        ),
      );
    }

    if (value == "new") {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
                padding: EdgeInsets.all(5),
                child: Text(title)),
            Container(
              constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.auto_awesome,
                color: Colors.blue,
                size: 30.0,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
              padding: EdgeInsets.all(5),
              child: Text(title)),
          Container(
              constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
              padding: EdgeInsets.all(5),
              child: Text(value)),
        ],
      ),
    );
  }
}
