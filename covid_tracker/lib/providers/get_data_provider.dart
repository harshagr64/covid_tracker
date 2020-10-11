import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import "dart:io";

class GetDataProvider with ChangeNotifier {
  final Map<String, Object> _getData = {
    'totalCases': 0,
    'totalDeaths': 0,
    'recovered': 0,
    'activeCases': 0,
  };

  final Map<String, Object> _todaysData = {
    'totalCases': 0,
    'totalDeaths': 0,
    'recovered': 0
  };

  Map<String, Object> get getData {
    return _getData;
  }

  Map<String, Object> get todaysData {
    return _todaysData;
  }

  Future<void> fetchData() async {
    final response =
        await http.get("https://corona.lmao.ninja/v3/covid-19/countries");
    final List<dynamic> extractedData = json.decode(response.body);
//    print(extractedData);
    final Map<String, Object> indiaData =
        extractedData.firstWhere((element) => element['country'] == 'India');

//    print(indiaData);

    _getData['totalCases'] = indiaData['cases'];
    _getData['totalDeaths'] = indiaData['deaths'];
    _getData['recovered'] = indiaData['recovered'];
    _getData['activeCases'] = indiaData['active'];

    _todaysData['totalCases'] = indiaData['todayCases'];
    _todaysData['recovered'] = indiaData['todayRecovered'];
    _todaysData['totalDeaths'] = indiaData['todayDeaths'];
    notifyListeners();
    return;
//    print(json.decode(coronaData.body));
  }
}
