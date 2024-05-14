import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jotech/screens/discussions_screen/discussion_detail.dart';

class DiscussionScreen extends StatefulWidget {
  const DiscussionScreen({super.key});

  @override
  State<DiscussionScreen> createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _topiccontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("forums")
            .orderBy('time')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text("Topics"),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Create Topic'),
                              content: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'topic',
                                      ),
                                      controller: _topiccontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "REQUIRED";
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      FirebaseFirestore.instance
                                          .collection("forums")
                                          .doc()
                                          .set({
                                        "topic": _topiccontroller.value.text,
                                        "time": DateTime.now(),
                                      }).then((value) {
                                        _topiccontroller.clear();
                                        Navigator.of(context).pop();
                                      });
                                    }
                                  },
                                  child: const Text('Comment'),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      _topiccontroller.clear();
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel"))
                              ],
                            );
                          });
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            body: ListView.builder(
                itemCount: snapshot.data!.size,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DiscussionDetail(
                                      id: snapshot.data!.docs[index].id,
                                      topic: snapshot.data!.docs[index]
                                          .data()['topic'],
                                    )));
                      },
                      child: Container(
                        height: 70,
                        color: Color.fromARGB(255, 223, 221, 221),
                        child: Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data!.docs[index].data()['topic'],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
