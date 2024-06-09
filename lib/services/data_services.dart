import 'dart:convert';
import 'package:flutter/services.dart';

class DataServices {
  Future<List<dynamic>> getUsers() async {
    var info = await rootBundle.loadString("json/data.json");
    List<dynamic> list = jsonDecode(info);
    return list.map((e) => e).toList();
  }
}
