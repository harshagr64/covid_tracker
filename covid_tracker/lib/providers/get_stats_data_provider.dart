import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "dart:io";

class GetStatsDataProvider with ChangeNotifier {
  Future<List<dynamic>> fetchData() async {

    final response = await http.get(
        "https://api.rootnet.in/covid19-in/unofficial/covid19india.org/statewise");

    final extractedData = json.decode(response.body);
//    print(extractedData);
    final List<dynamic> statsData = extractedData['data']['statewise'];
    return statsData;
//    print(statsData);
  }
}
