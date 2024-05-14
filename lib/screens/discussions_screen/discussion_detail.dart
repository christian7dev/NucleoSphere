import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiscussionDetail extends StatefulWidget {
  String topic;
  String id;
  DiscussionDetail({super.key, required this.id, required this.topic});

  @override
  State<DiscussionDetail> createState() => _DiscussionDetailState();
}

class _DiscussionDetailState extends State<DiscussionDetail> {
  final _formKey = GlobalKey<FormState>();
  final _commentcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("forums")
            .doc(widget.id)
            .collection("comments")
            .orderBy("time")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Comment'),
                              content: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Comment',
                                      ),
                                      controller: _commentcontroller,
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
                                          .doc(widget.id)
                                          .collection("comments")
                                          .doc()
                                          .set({
                                        "comment":
                                            _commentcontroller.value.text,
                                        "time": DateTime.now(),
                                      }).then((value) {
                                        _commentcontroller.clear();
                                        Navigator.of(context).pop();
                                      });
                                    }
                                  },
                                  child: const Text('Comment'),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      _commentcontroller.clear();
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel"))
                              ],
                            );
                          });
                    },
                    icon: Icon(Icons.message))
              ],
            ),
            body: Column(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Text(
                          widget.topic,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Comments",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: ListView.builder(
                        itemCount: snapshot.data!.size,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              constraints: BoxConstraints(minHeight: 70),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 182, 181, 181)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(snapshot.data!.docs[index]
                                    .data()['comment']),
                              ),
                            ),
                          );
                        })),
              ],
            ),
          );
        });
  }
}
