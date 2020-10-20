import 'package:http/http.dart';
import 'dart:convert';
import 'package:covid19app/TotalRecord.dart';
import 'package:covid19app/StateData.dart';
import 'package:flutter/foundation.dart';
class NetworkCallDemo {
  Future<TotalRecord> fetchTotalRecord() async {
    final response = await get('https://api.covidindiatracker.com/total.json');
    if (response.statusCode == 200) {
      return TotalRecord.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load total records");
    }
  }
  Future<List<StateData>> fetchTotalRecordList() async {
    final response = await get('https://api.covidindiatracker.com/state_data.json');
    if (response.statusCode == 200) {
      return compute(parseStateData, response.body);
    } else {
      throw Exception("Failed to load total records");
    }
  }
}
List<StateData> parseStateData(String response) {
  final parsedData = json.decode(response).cast<Map<String, dynamic>>();
  return parsedData
      .map<StateData>((json) => StateData.fromJson(json))
      .toList();
}