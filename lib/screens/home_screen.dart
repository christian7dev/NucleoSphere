import 'package:flutter/material.dart';
import 'package:jotech/screens/discussions_screen/discussion_home.dart';
import 'package:jotech/screens/note_screen/notes_home.dart';
import 'package:jotech/screens/quiz/quiz_home.dart';
import 'package:jotech/screens/researchs/research_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                          height: 150,
                          width: 200,
                          child: Image.asset(
                            "assets/atom.gif",
                            fit: BoxFit.fill,
                          )),
                      Text(
                        "NucleoSphere",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NotesHome()));
                          },
                          child: SizedBox(
                            height: 130,
                            width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset('assets/main.jpg',
                                      fit: BoxFit.fill),
                                ),
                                const Text(
                                  "NOTES",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DiscussionScreen()));
                            },
                            child: SizedBox(
                              height: 130,
                              width: 150,
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset('assets/discussion.webp',
                                        fit: BoxFit.fill),
                                  ),
                                  const Text(
                                    "Discussions",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ])
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResearchHome()));
                          },
                          child: Container(
                            height: 130,
                            width: 100,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset('assets/research.webp',
                                      fit: BoxFit.fill),
                                ),
                                const Text(
                                  "Researchs",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizHome()));
                          },
                          child: Container(
                            height: 130,
                            width: 100,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset('assets/quiz_logo.jpg',
                                      fit: BoxFit.fill),
                                ),
                                const Text(
                                  "Quiz",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
