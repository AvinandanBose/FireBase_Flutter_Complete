import 'package:flutter/material.dart';
class NextPage extends StatefulWidget {
  static const String id = 'Next_screen';
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
    );
  }
}
