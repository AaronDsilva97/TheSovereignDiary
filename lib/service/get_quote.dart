import '../models/quotes.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<Quotes>> getQuotes() async {
  String url = 'https://type.fit/api/quotes';
  final response = await http.get(url, headers: {"Accept": "application/json"});
  print(response.statusCode);
  if (response.statusCode == 200) {
    var list = json.decode(response.body) as List;
    return list.map((e) => Quotes.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load post');
  }
}
