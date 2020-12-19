import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Quiz(),
    );
  }
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

void main() => runApp(MyApp());
