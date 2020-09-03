import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class Database {

    static Future<Query> queryInfo() async {
        String accountKey = await _getAccountKey();

        return FirebaseDatabase.instance
            .reference()
            .child("accounts")
            .child(accountKey)
            .child("info")
            .orderByChild("humedad");
    }
}

Future<String> _getAccountKey() async {
    return '12345678';
}