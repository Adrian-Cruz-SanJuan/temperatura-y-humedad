import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remedial_20/temperatura.dart';
import 'package:remedial_20/humedad.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:remedial_20/model/message.dart';
import 'package:remedial_20/widget/messaging_widget.dart';
import 'saleshomepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperatura y humedad',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Temperatura y humedad'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final databaseReference = FirebaseDatabase.instance.reference();

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  "Temperatura",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 25,
                     fontWeight: FontWeight.bold),
                   ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Temperatura()));
                }),
              ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 50,
              width: 300,
              child: RaisedButton(
                color: Colors.deepPurple,
                elevation: 3,
                child: Text(
                  "Humedad",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Humedad()));
                  }),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 50,
              width: 300,
              child: RaisedButton(
                color: Colors.deepPurple,
                elevation: 3,
                child: Text(
                  "Historial",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                   onPressed: (){
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => Historial())); //MessagingWidget()
                  }
                  ),
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
  void getData() {
    databaseReference.once().then((DataSnapshot snapshot) {
      var hola = snapshot.value;
      print('$hola');
    });
  }
}
