class Sales {
    final double temp;
    final double hume;
    final String colorVal;
    Sales(this.temp,this.hume,this.colorVal);

    Sales.fromMap(Map<String, dynamic> map)
        : assert(map['temperatura'] != null),
            assert(map['humedad'] != null),
            assert(map['colorVal'] != null),
            temp = map['temperatura'],
            colorVal = map['colorVal'],
            hume = map['humedad'];

    @override
    String toString() => "Record<$temp:$hume:$colorVal>";

}