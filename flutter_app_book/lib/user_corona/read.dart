import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'update.dart';

class ReadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReadState();
  }
}

class _ReadState extends State<ReadPage> {
  String Area, Current_situation, Your_staus;
  String PCR_result;
  getArea(area) {
    this.Area = area;
  }

  getSituation(situation) {
    this.Current_situation = situation;
  }

  getStatus(status) {
    this.Your_staus = status;
  }

  getPCR(pcr) {
    this.PCR_result = pcr;
  }

  readData() {
    // print("reading");
    DocumentReference documentReference =
        Firestore.instance.collection("User_status").document(Area);
    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data["Area"]);
      print(datasnapshot.data["Current_situation"]);
      print(datasnapshot.data["Your_staus"]);
      print(datasnapshot.data["PCR_result"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User status"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Expanded(
                      child: Text("Area"),
                    ),
                    Expanded(
                      child: Text("Current situation"),
                    ),
                    Expanded(
                      child: Text(" Your status"),
                    ),
                    Expanded(
                      child: Text("Pcr test result"),
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                  stream:
                      Firestore.instance.collection("User_status").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot =
                                snapshot.data.documents[index];
                            return Row(children: <Widget>[
                              Expanded(
                                child: Text(documentSnapshot["Area"]),
                              ),
                              Expanded(
                                child:
                                    Text(documentSnapshot["Current_situation"]),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["Your_staus"]),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["PCR_result"]),
                              ),
                               
                            ]);
                          });
                    } else {
                      return Align(
                        alignment: FractionalOffset.bottomCenter,
                        //child: CircularProgressIndicators(),
                      );
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      // readData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePage()),
                      );
                    },
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Text("Go to Update"),
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ));
  }

}