import 'dart:convert';
import 'dart:io';
import 'package:medicatn/core/models/drug.dart';
import 'package:http/http.dart' as http;

class ApiService{

  var client = http.Client();

  Future<List<Drug>> fetchDrugs() async {
    final response = await client.get(Uri.parse('https://60b3f6374ecdc1001748009b.mockapi.io/api/drug'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      List<dynamic> result = jsonDecode(response.body);
      List<Drug> drugs = result
          .map(
            (dynamic item) => Drug.fromJson(item),
      )
          .toList();

      return drugs;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}