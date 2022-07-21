import 'package:flutter/material.dart';
import 'package:loginapp/mainlogin.dart';
import 'package:loginapp/welcome.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri lunk = Uri.parse('https://www.haptik.ai/');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            alignment: Alignment.center,
            // padding: const EdgeInsets.fromLTRB(92, 30, 75, 80),
            // child: Image.asset('assets/images/circle.png',
            //     fit: BoxFit.contain, width: 200, height: 400),
            child: const CircleAvatar(
              backgroundColor: Colors.black,
              // foregroundColor: Colors.black,
              radius: 90,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
              ),

              // backgroundImage: NetworkImage(
              //     'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            ),
          ),
          const SizedBox(height: 200),
          Column(
            children: [
              const Text(
                // text: TextSpan(
                //     style: TextStyle(fontSize: 33, fontWeight: FontWeight.w900),
                //     children: [
                //       TextSpan(text: 'GROW\n'),
                //       TextSpan(text: 'YOUR BUSSINESS\n'),
                //       TextSpan(
                //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                //           text: 'We will help you to grow your bussiness using online\n'),
                //       TextSpan(
                //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                //           text: 'services!!')
                //     ]),

                'GROW',
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.w900),
              ),
              const Text('YOUR BUSSINESS',
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.w900)),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'We will help you to grow your bussiness using online',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Text(
                'services!!',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    height: 40,
                    child: MainLoginButton('LOGIN', const Welcome()),
                    // child: ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //         context, MaterialPageRoute(builder: (context) => const Welcome()));
                    //   },
                    //   style: ElevatedButton.styleFrom(primary: Colors.yellow),
                    //   child: const Text(
                    //     'LOGIN',
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    // ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(width: 140, height: 40, child: MainLoginButton('SIGNUP', null)
                      // ElevatedButton(
                      //     onPressed: () {},
                      //     style: ElevatedButton.styleFrom(primary: Colors.yellow),
                      //     child: const Text('SIGNUP', style: TextStyle(color: Colors.black))),
                      ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                child: const Text(
                  'HOW WE WORK?',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                onTap: () async {
                  if (!await launchUrl(lunk)) {
                    throw 'Could not launch $lunk';
                  }
                },
              )
            ],
          )
        ],

        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
