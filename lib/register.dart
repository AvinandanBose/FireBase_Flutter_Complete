import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Input Page'),
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
              _auth.createUserWithEmailAndPassword(email: email!, password: password!);
            },child: Text(
              'SUBMIT'
            ),
            ),

          ],
      ),
    );
  }
}
