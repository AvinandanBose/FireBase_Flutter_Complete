import 'package:firebase_app/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  static const String id = 'Register_Screen';
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static const String sharedPrefferenceUserRegKey = "ISLOGGEDIN";
  String? email;
  String? password;
  GlobalKey<FormState> RegisterKey = GlobalKey<FormState>();

  Future<dynamic> saveUserRegisterSharedPreference(bool RegisterUser)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences.setMockInitialValues({sharedPrefferenceUserRegKey: RegisterUser});
    return await prefs.setBool(sharedPrefferenceUserRegKey, RegisterUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Register Page'),
        centerTitle: true,
      ),
      body:Form(
        key: RegisterKey,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 24.0,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Please Enter Your Email",
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
                hintText: "Please Enter Your Password",
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
            RaisedButton(
              onPressed: () {
                final user = _auth.createUserWithEmailAndPassword(
                    email: email!, password: password!);
                if (user != null) {
                  saveUserRegisterSharedPreference(true);
                  Navigator.pushNamed(context, LogIn.id);
                }
              },
              child: Text('SUBMIT'),
            ),
          ],
        ),
      ),
    );
  }
}
