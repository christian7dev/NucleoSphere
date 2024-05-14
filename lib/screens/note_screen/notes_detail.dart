import 'package:flutter/material.dart';

class NoteDetail extends StatelessWidget {
  String titles;
  String link;
  String note;
  NoteDetail(
      {super.key,
      required this.titles,
      required this.link,
      required this.note});

  @override
  Widget build(BuildContext context) {
    String convertNewLine(String content) {
      return content.replaceAll(r'\n', '\n');
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                    child: Text(
                  titles,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
              ),
              Container(
                height: 200,
                color: Colors.amber,
                child: Image.network(link),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(convertNewLine(note)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
