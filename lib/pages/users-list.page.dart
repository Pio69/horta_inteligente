import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:horta_inteligente/pages/userform.page.dart';
import 'package:http/http.dart' as http;

import 'package:http_pro/http.dart' as https;

import 'package:http_pro/response.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  var data;
  Future<void> getUserApi() async {
    final response = await http
        .get(Uri.parse('https://smartgarden.onlosant.com/users/list'));

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
                              Column(
                                children: [
                                  TextButton(
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UserForm(
                                            id: data[index]['id'],
                                          ),
                                        ),
                                      )
                                    },
                                    child: ListTile(
                                      title: ListTile(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color: Colors.grey,
                                              size: 40.0,
                                            ),
                                            Text(
                                              (data[index]['firstName']
                                                      .toString() +
                                                  (data[index].containsKey(
                                                          'lastName')
                                                      ? data[index]['lastName']
                                                          .toString()
                                                      : "")),
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.6)),
                                            ),
                                            TextButton(
                                              onPressed: () => {
                                                _apiCallDelete(
                                                    data[index]['id']),
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        UsersList(),
                                                  ),
                                                ),
                                              },
                                              child: Icon(
                                                Icons.person_remove,
                                                color: Colors.red,
                                                size: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserForm(
                id: "",
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<String?> _apiCallDelete(String id) async {
  Response res = await https.get(
    "https://smartgarden.onlosant.com/users/delete?id=${id}",
  );
  if (res.statusCode == 200 || res.statusCode == 302) {
    return res.headers["set-cookie"];
  } else {
    return null;
  }
}
