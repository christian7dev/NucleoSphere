import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResearchHome extends StatelessWidget {
  const ResearchHome({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("researchs").snapshots(),
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
              title: Text("Researchs"),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: snapshot.data!.size,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      launchUrl(Uri.parse(
                          snapshot.data!.docs[index].data()["filelink"]));
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 10, left: 10),
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 151, 49, 49),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0, 0),
                                    blurRadius: 5)
                              ]),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(Icons.book),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  (snapshot.data!.docs[index].data()["title"]),
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ));
              },
            ),
          );
        });
  }
}
