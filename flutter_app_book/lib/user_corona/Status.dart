import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'read.dart';


class StatusPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<StatusPage> {
  String Current_situation ;


 final databaseReference = Firestore.instance;
static const List<String> area1  = const  ['Ampara', 'Negombo',
 'Colombo', 'Jaffna','Batticalo','Trinco','Killinochi','Badulla','Vavuniya',
 'Mannar','Mullaitheevu', 'Pollanaruva','Anurathapura', 'Kurunagala','Kaluthara',
 'Galle','Kandy','Nuweraliya','Matara','Puttalam','Gampaha','Ampanthoda'];
 String Area = area1[0];

 static const List<String> Status  = const ['In Quarantine','Normal','House quarantine','Going to work','Work from home','live in work place'];
 String Your_staus = Status[0];

 static const List<String> test  = const ['Never tested','Now positive','Now negative','Tested as foreign return',];
 String PCR_result = test[0];
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

  createData() {
    //print("created");
    DocumentReference documentReference =
        Firestore.instance.collection("User_status").document(Area);
    Map<String, dynamic> students = {
      "Area": Area,
      "Current_situation": Current_situation,
      "Your_staus": Your_staus,
      "PCR_result": PCR_result
    };
    documentReference.setData(students).whenComplete(() {
      print("$Area created");
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Corona status"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
             new DropdownButton(
          value: Area,
          onChanged: (string) => setState(() => Area = string),
          items: area1.map((string) {
            return new DropdownMenuItem(
              child: new Text(string),
              value: string,
            );
          }).toList(),
        ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Current situation",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String situation) {
                      getSituation(situation);
                    }),
              ),
              new DropdownButton(
          value: Your_staus,
          onChanged: (string) => setState(() => Your_staus = string),
          items: Status.map((string) {
            return new DropdownMenuItem(
              child: new Text(string),
              value: string,
            );
          }).toList(),
        ),
              new DropdownButton(
          value: PCR_result,
          onChanged: (string) => setState(() => PCR_result = string),
          items: test.map((string) {
            return new DropdownMenuItem(
              child: new Text(string),
              value: string,
            );
          }).toList(),
        ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      createData();
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Text("Create"),
                    textColor: Colors.white,
                  ),
                  RaisedButton(
                    onPressed: () {
                      // readData();
                      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReadPage()),
            );
                    },
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Text("Read"),
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
