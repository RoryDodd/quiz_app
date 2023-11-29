import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/pages/question_page.dart';


void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: buildColumnBody(),
      ),
    );
  }

  Column buildColumnBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
        child:  Text(
          'Test Your Android Knowledge!!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: "PlayPenBold",
          ),
          textAlign: TextAlign.center,
        ),
        ),

        const SizedBox(height: 30),

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
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                ),
              ),
              child: const Text(
                'START QUIZ',
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
         child: ElevatedButton(
            onPressed: (){SystemNavigator.pop();},
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.deepOrange),
            foregroundColor: MaterialStatePropertyAll(Colors.black),
            elevation: MaterialStatePropertyAll(15),
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                )
            ),
          ),
           child: const Text('EXIT',
             style: TextStyle(
               fontFamily: "PlayPenBold",
               fontSize: 20,
             ),
           ),
        ),
         ),
      ],
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

