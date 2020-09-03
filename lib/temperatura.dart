import'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:remedial_20/database.dart';
import 'package:remedial_20/sales.dart';

class Temperatura extends StatefulWidget {

    @override
    _TemperaturaState createState() => _TemperaturaState();
}

class _TemperaturaState extends State<Temperatura>{

    final databaseReference = FirebaseDatabase.instance.reference();

    @override
    void initState() {
        // TODO: implement initState
        super.initState();
    }

    static const datos = 27.3;
    static const porcentaje = datos * 0.01;

    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
                title: Text("Humedad"),
                centerTitle: true,
            ),
            body: Center(
                child: CircularPercentIndicator(
                    //foregroundPainter: CircleProgress(animation.value),
                    animation: true,
                    //animationDuration: Duration(int milliseconds: 1000),
                    radius: 300.0,
                    percent: porcentaje,
                    lineWidth: 10.0,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.deepPurple,
                    center: Text("${porcentaje * 100}°"),
                ),
            )
        );

    }
    void getData() {
        databaseReference.once().then((DataSnapshot snapshot) {
            var hola = snapshot.value['temperatura'](0);
            print('$hola');
        });
    }
}