import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflixapp/model/main_movies/moviess/moviess.dart';

import 'package:netflixapp/model/pages/pages.dart';

class SearchFunction {
  static ValueNotifier<List<Moviess>> searchData = ValueNotifier([]);
  static Future<void> searchResult(String quary) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=a93998d3bc177e5b1982febb0c60a4e9&query=$quary'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        searchData.value.clear();
        searchData.value.addAll(pages.results! as List<Moviess>);
        searchData.notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
