import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
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
                              Card(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: (data[index]['level'].toString() ==
                                              "warning")
                                          ? Icon(
                                              Icons.error,
                                              color: Colors.deepOrange,
                                              size: 30.0,
                                            )
                                          : Icon(
                                              Icons.report,
                                              color: Colors.red,
                                              size: 30.0,
                                            ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        (data[index]['message'].toString()),
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.6)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child:
                                          (data[index]['status'].toString() ==
                                                  "new")
                                              ? Icon(
                                                  Icons.new_releases,
                                                  color: Colors.lightBlue,
                                                  size: 30.0,
                                                )
                                              : Icon(
                                                  Icons.verified,
                                                  color: Colors.grey,
                                                  size: 30.0,
                                                ),
                                    ),
                                  ],
                                ),
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
