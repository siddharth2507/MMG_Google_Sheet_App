import 'dart:convert';

import 'package:http/http.dart' as http;

class MonumentModel {
  /* final int? id;
  final String? name;
  final String? surname;
  final String? bio;
  final String? email;

  MonumentModel({
    this.id,
    this.name,
    this.surname,
    this.bio,
    this.email,
  });

  factory MonumentModel.fromJson(Map<String, dynamic> json) {
    return MonumentModel(
      id: json['Id'],
      name: json['Name'],
      surname: json['Surname'],
      bio: json['Bio'],
      email: json['Email'],
    );
  }*/

  final String? category;
  final String? name;
  final int? number;
  final String? company;

  MonumentModel({
    this.category,
    this.name,
    this.number,
    this.company,
  });

  factory MonumentModel.fromJson(Map<String, dynamic> json) {
    return MonumentModel(
      category: json['category'],
      name: json['name'],
      number: json['number'],
      company: json['company'],
    );
  }

  static List<MonumentModel> decodeMonument(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    print('parsed: $parsed ');
    return parsed
        .map<MonumentModel>((json) => MonumentModel.fromJson(json))
        .toList();
  }

  static Future<List<MonumentModel>> fetchMonument() async {
    var url = Uri.parse(
        // 'https://script.google.com/macros/s/AKfycbzMQGxpBP2B6C7uHEGLTVZtylHFjDABuRIQixRMaFRRO6-4C-MOCjxRAsjp3yyHjhpl/exec');
        'https://script.google.com/macros/s/AKfycbyOxoO6G7u9-OgkAgwytAeGV0u0z9EwF1XvkRsw8dbLRCDPyX44z1_NQ4h9-tUlEkbPHg/exec');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('response: ${response.body}');
      return decodeMonument(response.body);
    } else {
      throw Exception('Unable to fetch data from the REST API');
    }
  }
}
