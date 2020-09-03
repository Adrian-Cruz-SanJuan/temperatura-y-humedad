import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:remedial_20/sales.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Historial extends StatefulWidget {
    @override
    _History createState() {
        return _History();
    }
}

class _History extends State<Historial> {
    List<charts.Series<Sales, String>> _seriesBarData;
    List<Sales> mydata;
    _generateData(mydata) {
        _seriesBarData = List<charts.Series<Sales, String>>();
        _seriesBarData.add(
            charts.Series(
                domainFn: (Sales sales, _) => sales.hume.toString(),
                measureFn: (Sales sales, _) => sales.temp,
                colorFn: (Sales sales, _) =>
                    charts.ColorUtil.fromDartColor(Color(int.parse(sales.colorVal))),
                id: 'Sales',
                data: mydata,
                labelAccessorFn: (Sales row, _) => "${row.temp}",
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text('Historial')),
            body: _buildBody(context),
        );
    }

    Widget _buildBody(BuildContext context) {
        return StreamBuilder<QuerySnapshot>(
            // ignore: deprecated_member_use
            stream: Firestore.instance.collection('remedial_2').snapshots(),
            builder: (context, snapshot) {
                if (!snapshot.hasData) {
                    return LinearProgressIndicator();
                } else {
                    // ignore: missing_return
                    print("Hola");
                }
            },
        );
    }

    Widget _buildChart(BuildContext context, List<Sales> saledata) {
        mydata = saledata;
        _generateData(mydata);
        return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
                child: Center(
                    child: Column(
                        children: <Widget>[
                            Text(
                                'Conteo de temperatura',
                                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                height: 10.0,
                            ),
                            Expanded(
                                child: charts.BarChart(_seriesBarData,
                                    animate: true,
                                    animationDuration: Duration(seconds:5),
                                    behaviors: [
                                        new charts.DatumLegend(
                                            entryTextStyle: charts.TextStyleSpec(
                                                color: charts.MaterialPalette.purple.shadeDefault,
                                                fontFamily: 'Georgia',
                                                fontSize: 18),
                                        )
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}