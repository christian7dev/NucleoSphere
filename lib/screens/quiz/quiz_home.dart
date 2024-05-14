import 'package:flutter/material.dart';
import 'package:jotech/screens/quiz/quiz.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Text(
                  "QUIZ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 30),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //button

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quiz()));
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 10,
                      )
                    ],
                    gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.black, Colors.red]),
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                  child: Text(
                    "START",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
    ;
  }
}
