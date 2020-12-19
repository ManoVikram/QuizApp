import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/quiz.dart';
import '../widgets/titleQuestion.dart';
import '../widgets/answers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;

  void initState() {
    super.initState();
    _isLoading = true;
    _fetchQuestions();
  }

  Future<void> _fetchQuestions() async {
    await Provider.of<Quiz>(context, listen: false).fetchQuestions();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<QuizData> questions =
        Provider.of<Quiz>(context, listen: false).questions;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz",
          style: TextStyle(
            color: Colors.black,
          ),
          textScaleFactor: 1.5,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : (questions != null
              ? RefreshIndicator(
                  onRefresh: _fetchQuestions,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemBuilder: (contxt, index) => Card(
                        elevation: 0.0,
                        child: ExpansionTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            child: Text(
                              questions[index].type.startsWith("m") ? "M" : "B",
                            ),
                          ),
                          title: TitleQuestion(
                            question: questions[index],
                          ),
                          children: questions[index]
                              .choice
                              .map(
                                (data) => Answers(
                                  answer: data,
                                  correctAnswer: questions[index].correctAnswer,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      itemCount: questions.length,
                    ),
                  ),
                )
              : Center(
                  child: Column(
                    children: [
                      Text("ERROR: TRY AGAIN"),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        onPressed: _fetchQuestions,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 7,
                        child: Text("Press me to REFRESH!"),
                      ),
                    ],
                  ),
                )),
    );
  }
}
