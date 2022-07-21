import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  String name;
  int gen;
  Home(this.name, this.gen, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: gen == 1 ? Colors.pinkAccent : Colors.lightBlue,
          elevation: 0,
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //     onPressed: () {
          //       // Navigator.pushAndRemoveUntil(context,
          //       //     MaterialPageRoute(builder: (context) => const Welcome()), (route) => false);
          //       Navigator.of(context).pop();
          //     },
          //     icon: const Icon(
          //       Icons.arrow_back,
          //       color: Colors.black,
          //     )),
        ),
        backgroundColor: gen == 1 ? Colors.pinkAccent : Colors.lightBlue,
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                gen == 1 ? Icons.woman : Icons.man,
                size: 50,
              ),
              Text(
                'Hey $name',
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text('Welcome to my App',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ],
          )),
        ),
      ),
    );
  }
}
