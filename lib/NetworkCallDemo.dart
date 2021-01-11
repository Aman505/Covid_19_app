import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:covid19app/TotalRecord.dart';
import 'package:covid19app/state_tally_response.dart';
import 'package:flutter/foundation.dart';

class NetworkCallDemo {
  final JsonDecoder _decoder = new JsonDecoder();

  Future<TotalRecord> fetchTotalRecord() async {
    final response = await get('https://api.covidindiatracker.com/total.json');
    if (response.statusCode == 200) {
      return TotalRecord.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load total records");
    }
  }

  Future<List<StateData>> fetchTotalRecordList() async {
    final response =
        await get('https://api.covidindiatracker.com/state_data.json');
    if (response.statusCode == 200) {
      return compute(parseStateData, response.body);
    } else {
      throw Exception("Failed to load total records");
    }
  }

  Future<dynamic> getColleges() {
    return http.get(
        'https://api.rootnet.in/covid19-in/hospitals/medical-colleges',
        headers: {
          'Accept': 'application/json',
        }).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception('Error while fetching data');
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> getNotifications() {
    return http
        .get('https://api.rootnet.in/covid19-in/notifications', headers: {
      'Accept': 'application/json',
    }).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception('Error while fetching data');
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> getContacts() {
    return http.get('https://api.rootnet.in/covid19-in/contacts', headers: {
      'Accept': 'application/json',
    }).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception('Error while fetching data');
      }
      return _decoder.convert(res);
    });
  }
}

List<StateData> parseStateData(String response) {
  final parsedData = json.decode(response).cast<Map<String, dynamic>>();
  return parsedData.map<StateData>((json) => StateData.fromJson(json)).toList();
}
