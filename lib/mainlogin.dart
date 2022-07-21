import 'package:flutter/material.dart';

class MainLoginButton extends StatelessWidget {
  var v;
  var text;
  MainLoginButton(this.text, this.v);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: 140,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => v));
        },
        style: ElevatedButton.styleFrom(primary: Colors.yellow),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    ));
  }
}
