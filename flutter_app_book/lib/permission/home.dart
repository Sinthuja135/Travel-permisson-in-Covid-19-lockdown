import 'package:flutter/material.dart';
import 'package:flutter_app_book/permission/Listpage.dart';
import 'package:flutter_app_book/permission/permission.dart';
import 'package:flutter_app_book/splashScreen/consult.dart';
import 'package:flutter_app_book/splashScreen/info_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../splashScreen/cons.dart';
import '../user_corona/Status.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<HomePage> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page passengers"),
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(children: <Widget>[
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: <Widget>[
      //         RaisedButton(
      //           onPressed: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => UploadPage()));
      //           },
      //           color: Colors.blue,
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(16)),
      //           child: Text("Request permission"),
      //           textColor: Colors.white,
      //         ),
      //         RaisedButton(
      //           onPressed: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => ListPage()));
      //           },
      //           color: Colors.green,
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(16)),
      //           child: Text("Permission details"),
      //           textColor: Colors.white,
      //         ),
      //         RaisedButton(
      //           onPressed: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => Consult()));
      //           },
      //           color: Colors.green,
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(16)),
      //           child: Text("Call"),
      //           textColor: Colors.white,
      //         ),
      //         RaisedButton(
      //           onPressed: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => InfoScreen()));

      //           },
      //           color: Colors.green,
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(16)),
      //           child: Text("Precautions"),
      //           textColor: Colors.white,
      //         ),
      //         RaisedButton(
      //           onPressed: () {
      //             const url = 'https://hpb.health.gov.lk/covid19-dashboard/';
      //             customLaunch(url);
      //           },
      //           color: Colors.green,
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(16)),
      //           child: Text("News update"),
      //           textColor: Colors.white,
      //         ),
      //       ],
      //     ),
      //   ]),
      // )

      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              spreadRadius: 1.0,
              offset: Offset(
                4.0,
                4.0,
              ),
            )
          ],
        ),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UploadPage()));
                      },
                      child: Text('Add Permission', style: kTitleTextstyle),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListPage()));
                      },
                      child: Text('Permission detail', style: kTitleTextstyle),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Consult()));
                      },
                      child: Text('Call', style: kTitleTextstyle),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoScreen()));
                      },
                      child: Text('Precautions', style: kTitleTextstyle),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                   
                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        const url =
                            'https://hpb.health.gov.lk/covid19-dashboard/';
                        customLaunch(url);
                      },
                      child: Text('News update', style: kTitleTextstyle),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    
                         RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StatusPage()));
                      },
                      child: Text('Add your corona status', style: kTitleTextstyle),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
