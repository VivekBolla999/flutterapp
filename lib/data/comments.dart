import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Comments extends StatefulWidget {
  int ide;
  String title;
  String body;
  Comments(this.ide, this.title, this.body, {Key? key}) : super(key: key);
  @override
  CommentsState createState() => CommentsState();
}

class Users2 {
  int id;
  String name, email, body;
  Users2(this.id, this.name, this.email, this.body);
}

class CommentsState extends State<Comments> {
  Future getUserData() async {
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'comments'));
    var jsondata = jsonDecode(response.body);
    List<Users2> posts = [];
    for (var u in jsondata) {
      Users2 post = Users2(u["id"], u["name"], u["email"], u["body"]);
      posts.add(post);
    }
    print(posts.length);
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: const Text('Comments Of Posts'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(4),
          child: Center(
              child: Card(
            child: FutureBuilder<dynamic>(
                future: getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text('loading....'),
                    );
                  } else {
                    return Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Title: ${widget.title}",
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text("Body: ${widget.body}",
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 40,
                            ),
                            const Text("Comments",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 40,
                            ),
                            Text("Name: ${snapshot.data[widget.ide].name}",
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 40,
                            ),
                            Text("Email: ${snapshot.data[widget.ide].email}",
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 40,
                            ),
                            Text("Body: ${snapshot.data[widget.ide].body}",
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ));
                  }
                }),
          )),
        ));
  }
}
