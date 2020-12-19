import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/quiz.dart';
import './screens/homeScreen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (contxt) => Quiz(),
      child: MaterialApp(
        title: "Quiz App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: QuizApp(),
      ),
    );
  }
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}

void main() => runApp(MyApp());
