import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loginapp/data/comments.dart';

class Posts extends StatefulWidget {
  @override
  PostsState createState() => PostsState();
}

class Users {
  int id;
  String title, body;
  Users(this.id, this.title, this.body);
}

class PostsState extends State<Posts> {
  Future getUserData() async {
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'posts'));
    var jsondata = jsonDecode(response.body);
    List<Users> posts = [];
    for (var u in jsondata) {
      Users post = Users(u["id"], u["title"], u["body"]);
      posts.add(post);
    }

    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
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
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return Column(children: [
                          ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://nurserynisarga.in/wp-content/uploads/2019/10/Red-Rose.jpg'),
                              radius: 25,
                            ),
                            title: Text(
                              snapshot.data[i].title,
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            subtitle: Text(
                              snapshot.data[i].body,
                              style: const TextStyle(fontSize: 17, overflow: TextOverflow.ellipsis),
                            ),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Comments(snapshot.data[i].id,
                                          snapshot.data[i].title, snapshot.data[i].body)));
                            },
                            dense: true,
                            selected: false,
                            enabled: true,
                            hoverColor: Colors.black12,
                          ),
                          const Divider(
                            color: Colors.black54,
                          )
                        ]);
                      },
                    );
                  }
                }),
          )),
        ));
  }
}
