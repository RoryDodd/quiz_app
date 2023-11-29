import 'dart:convert';
import 'package:quiz_app/pages/score_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);


  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<dynamic> quizData = [];
  int currentQuestionIndex = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    loadQuizData();
  }

  Future<void> loadQuizData() async {
    try {
      final String jsonString = await rootBundle.loadString('lib/assets/questions_answers.json');
      setState(() {
        quizData = json.decode(jsonString);
      });
    } catch (error) {
      print("Error loading JSON data: $error");
    }
  }


  @override
  Widget build(BuildContext context) {
    if (quizData.isEmpty || currentQuestionIndex >= quizData.length) {
      return ScorePage(score);
    }

    final question = quizData[currentQuestionIndex]['question'];
    final options = quizData[currentQuestionIndex]['options'];

    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontFamily: "PlayPenBold",
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Column(
            children: options.map<Widget>((option) {
              return ElevatedButton(
                onPressed: () {
                  handleAnswer(option);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(15),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                ),
                child: Text(
                    option,
                    style:const TextStyle(
                      fontFamily: "PlayPenBold",
                      fontSize: 15,
                    )),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void handleAnswer(String selectedAnswer) {
    final correctAnswer = quizData[currentQuestionIndex]['correctAnswer'];

    if (selectedAnswer == correctAnswer) {
      score++;
    }

    // Move to the next question
    setState(() {
      currentQuestionIndex++;
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      title: Center(
        child: SizedBox(
          width: 150.0,
          child: Image.asset('lib/assets/logo.png'),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: QuestionPage(),
  ));
}
