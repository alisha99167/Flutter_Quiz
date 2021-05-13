import 'package:flutter/material.dart';
import 'package:quiz/model/question.dart';

//import 'package:quiz/util/hexcolor.dart';
class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionBank = 0;
  List questionBank = [
    Question.name(
        "2 presidents of India so far were elected unopposed? ", true),
    Question.name(
        "In India, the head of the State and the head of the government are different people.",
        true),
    Question.name("There are no restrictions on the right to freedom.", false),
    Question.name(
        "In India, there are no areas in which the states can make their own laws.",
        false),
    Question.name(
        "The Fundamental Duties can be enforced in a court of law.", false),
    Question.name(
        "A Directive Principle can be enforced when it becomes a law.", true),
    Question.name(
        "India is obliged to obey the UN in its internal affairs", false),
    Question.name(" 1960 is related to Berubari Case?", true),
    Question.name(
        "social equality=Equal opportunities for all sections of the societies",
        true),
    Question.name(
        "The language of Preamble of the Indian constitution is taken from the constitution of Australia",
        true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      "images/images.png",
                      width: 250,
                      height: 180,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        questionBank[_currentQuestionBank].questionText,
                        style: TextStyle(fontSize: 16.9, color: Colors.white70),
                      ),
                    )),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                      onPressed: () => _prevQuestion(),
                      color: Colors.blueGrey.shade900,
                      child: Icon(Icons.arrow_back, color: Colors.white)),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "FALSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                      onPressed: () => _nextQuestion(),
                      color: Colors.blueGrey.shade900,
                      child: Icon(Icons.arrow_forward, color: Colors.white))
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionBank].isCorrect) {
      final snackBar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(microseconds: 800),
          content: Text("Correct"));
      Scaffold.of(context).showSnackBar(snackBar);
      setState(() {
        _currentQuestionBank++;
      });
      _updateQuestion();
    } else {
      final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(milliseconds: 500),
          content: Text("Incorrect"));
      Scaffold.of(context).showSnackBar(snackBar);
      debugPrint("Incorrect");
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {

      _currentQuestionBank = (_currentQuestionBank + 1) % questionBank.length;
    });
  }
_prevQuestion(){
    setState(() {
      _currentQuestionBank = (_currentQuestionBank - 1) % questionBank.length;

    });
}
  _nextQuestion() {
    _updateQuestion();
  }
}
