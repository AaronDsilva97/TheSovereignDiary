import '../models/wallpaper.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<WallPaper>> getWallpaper() async {
  String url =
      'https://api.unsplash.com/photos/?client_id=uE9ejPJqeThLODySIj42yXiXGoz-S2WCXwubK8kgrjQ';
  final response = await http.get(url, headers: {"Accept": "application/json"});
  print(response.statusCode);
  if (response.statusCode == 200) {
    var list = json.decode(response.body) as List;
    return list.map((e) => WallPaper.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load post');
  }
}
