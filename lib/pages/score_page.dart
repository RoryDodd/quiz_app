import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/pages/question_page.dart';

class ScorePage extends StatelessWidget {
  final int score;

  const ScorePage(this.score, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Center buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('You Got: $score Out of 10 Correct',
          style: const TextStyle(
            fontFamily: "playPenBold",
            fontSize: 20,
          )),

          const SizedBox(height: 100),

          SizedBox(
            width: 200,
            height: 70,
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuestionPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(15),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
                child: const Text(
                  'PLAY AGAIN',
                  style: TextStyle(
                    fontFamily: "PlayPenBold",
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: 200,
            height: 70,
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(15),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
                child: const Text(
                  'EXIT',
                  style: TextStyle(
                    fontFamily: "PlayPenBold",
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
