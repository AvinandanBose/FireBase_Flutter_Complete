import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Next.dart';

class LogIn extends StatefulWidget {
  static const String id = 'login_screen';
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static const String sharedPrefferenceUserLoggedInKey = "ISLOGGEDIN";
  String? email;
  String? password;
  GlobalKey<FormState> LogInKey = GlobalKey<FormState>();

  Future<dynamic> saveUserLoggedInSharedPreference(bool isUserLoggedIn)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences.setMockInitialValues({sharedPrefferenceUserLoggedInKey: isUserLoggedIn});
    return await prefs.setBool(sharedPrefferenceUserLoggedInKey, isUserLoggedIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('LogIn Page'),
        centerTitle: true,
      ),
      body: Form(
        key: LogInKey,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 24.0,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Please Enter Your Registered Email",
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
                hintText: "Please Enter Your Registered Password.",
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
                saveUserLoggedInSharedPreference(true);
               Navigator.pushNamed(context, NextPage.id);
              }
            },child: Text(
                'LOG IN'
            ),
            ),

          ],
        ),
      ),
    );
  }
}
