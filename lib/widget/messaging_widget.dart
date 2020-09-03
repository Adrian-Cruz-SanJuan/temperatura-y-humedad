import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:remedial_20/model/message.dart';

class MessagingWidget extends StatefulWidget {
    @override
    _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    final List<Message> messages = [];

    @override
    void initState() {
        super.initState();
        _firebaseMessaging.configure(
            onMessage: (Map<String, dynamic> message) async {
                print("onMessage: $message");
            },
            onLaunch: (Map<String, dynamic> message) async {
                print("onLaunch: $message");
            },
            onResume: (Map<String, dynamic> message) async {
                print("onResume: $message");
            },
        );
        _firebaseMessaging.requestNotificationPermissions(
            const IosNotificationSettings(sound: true, badge: true, alert: true));
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Notifications"),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Container(
                            height: 50,
                            width: 300,
                            child: RaisedButton(
                                color: Colors.deepPurple,
                                elevation: 3,
                                child: Text(
                                    "ola k ase",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                ),

                            ),
                        ),
                        SizedBox(
                            height: 80,
                        ),
                    ]),
            ),
        );
    }}