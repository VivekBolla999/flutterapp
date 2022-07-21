import 'package:flutter/material.dart';

import './data/posts.dart';
// ignore: implementation_imports

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int valu = 0;

  bool ob = true;

  // ignore: prefer_typing_uninitialized_variables
  var v;

  // ignore: prefer_typing_uninitialized_variables
  var i;

  // String username = "vivek";
  String password = "123456";

  var fieldtext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
            Navigator.of(context).pop();
          },
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.yellow,

        title: const Text(
          'LOGIN',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        // backgroundColor: Colors.yellow,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      cursorColor: Colors.black,
                      controller: fieldtext,
                      onChanged: (text) {
                        v = text;
                      },
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: 'Enter Username',
                        labelStyle: const TextStyle(color: Colors.black54),
                        enabledBorder:
                            const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        prefixIcon: const Icon(Icons.person, color: Colors.black),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            fieldtext.clear();
                          },
                          child: const Icon(Icons.cancel_outlined, color: Colors.black),
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(
                      top: 10,
                    )),
                    TextFormField(
                      cursorColor: Colors.black,
                      obscureText: ob,
                      onChanged: (text) {
                        i = text;
                      },
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: 'Enter Password',
                        labelStyle: const TextStyle(color: Colors.black54),
                        enabledBorder:
                            const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        prefixIcon: const Icon(Icons.lock, color: Colors.black),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              ob = !ob;
                            });
                          },
                          child: Icon(ob ? Icons.visibility_off : Icons.visibility,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(
                      top: 10,
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Radio(
                            activeColor: Colors.black,
                            value: 1,
                            groupValue: valu,
                            onChanged: (value) {
                              setState(() {
                                valu = value.hashCode;
                              });
                            }),
                        const Text('Female'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            activeColor: Colors.black,
                            value: 2,
                            groupValue: valu,
                            onChanged: (value) {
                              setState(() {
                                valu = value.hashCode;
                              });
                            }),
                        const Text('Male'),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.only(
                      top: 10,
                    )),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (i == password) {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) => Posts()), (route) => false);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Invalid Password or Username Try Again"),
                            ));
                          }
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )),
              ))
        ],
      ),
    );
  }
}
