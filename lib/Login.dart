import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Next.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('LogIn Page'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 24.0,
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
            textAlign: TextAlign.center,
            onChanged: (value) {
              email = value;
            },
          ),
          const SizedBox(
            height: 24.0,
          ),
          TextField(
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
            textAlign: TextAlign.center,
            onChanged: (value) {
              password = value;
            },
          ),
          const SizedBox(
            height: 24.0,
          ),
          RaisedButton(onPressed: (){
            final user = _auth.signInWithEmailAndPassword(email: email!, password: password!);
            if(user!=null){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
              NextPage()
              ));
            }
          },child: Text(
              'LOG IN'
          ),
          ),

        ],
      ),
    );
  }
}
