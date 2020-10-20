import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final DocumentSnapshot post;
  DetailPage({this.post});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // String Status;
  //   void _onSubmit(String status) {
  //      setState(() => status = 'Submit: ${Status}');
  //    }
  //  void updateUser() {
  //  String documentID = 'NIC';

  // Firestore.instance.collection('Travel_permission').document('Status').updateData({

  //  'Status': this.Status,
  // });
  // Map<String, Object> data = new HashMap();
// data['Status'] = this.Status;

// Firestore.instance.collection('Travel_permission').document('868685').updateData(data);
// //
  //     }
  @override
  Widget build(BuildContext context) {
    var timestamp;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.post.data["NIC"]),
        ),
        body: Container(
            child: Card(
                child: ListTile(
          // leading: Image.network("PCR_report"),

          title: Text(widget.post.data["NIC"]),
          subtitle: Container(
            child: (Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(label: Text("Name")),
                      Text(widget.post.data["Name"],
                          style: TextStyle(fontSize: 20)),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(label: Text("GS Division")),
                      Text(widget.post.data["GS_division"].toString(),
                          style: TextStyle(fontSize: 20)),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(label: Text("Reason")),
                      Text(widget.post.data["Reason"],
                          maxLines: 2, style: TextStyle(fontSize: 20)),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(label: Text("Date")),
                      Text(widget.post.data["Travel_date"].toString(),
                          style: TextStyle(fontSize: 15)),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(label: Text("Report")),
                      Text(widget.post.data["PCR_report"],
                          maxLines: 5, style: TextStyle(fontSize: 25)),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(label: Text("From")),
                      Text(widget.post.data["Travelling_from"],
                          style: TextStyle(fontSize: 20)),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(label: Text("To")),
                      Text(widget.post.data["Travelling_to"],
                          style: TextStyle(fontSize: 20)),
                    ]),

                //  Text(widget.post.data["Status"],
                //      style: TextStyle(fontSize: 15)),
                //ListTileControlAffinity.leading

                //  TextFormField(
                //            decoration: InputDecoration(
                //                labelText: "Status",
                //                fillColor: Colors.blue,
                //                focusedBorder: OutlineInputBorder(
                //                    borderSide:
                //                        BorderSide(color: Colors.blue, width: 2.0))),

                //            initialValue: widget.post.data['Status'],
                //            onChanged: (status){
                //              this.Status=status;
                //            },
                //            //  (String status) {
                //            //    getStatus(status);
                //            //   // _onChanged;
                //            // }
                //            ),

                //              RaisedButton(
                //          onPressed: () {
                //             updateUser();

                //           // _onSubmit;

                //          },
                //          color: Colors.orange,
                //          shape: RoundedRectangleBorder(
                //              borderRadius: BorderRadius.circular(16)),
                //          child: Text("Accept"),
                //          textColor: Colors.white,
                //        )
              ],
            )),
          ),
        ))));
  }
}
