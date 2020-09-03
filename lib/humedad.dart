import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Humedad extends StatefulWidget{
    @override
    _HumedadState createState() => _HumedadState();
}

class _HumedadState extends State<Humedad>{

    @override
    void initState() {
        // TODO: implement initState
        super.initState();
    }

    static const datos = 47.0;
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
}