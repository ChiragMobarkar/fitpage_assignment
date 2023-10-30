import 'dart:convert';

import 'package:fitpage_assignment/domain/rule.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static final ApiClient singleton = ApiClient._internal();
  factory ApiClient() {
    return singleton;
  }

  ApiClient._internal();

  Future<List<Rule>> fetchData(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      final rules = jsonList.map((json) => Rule.fromJson(json)).toList();
      return rules;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
