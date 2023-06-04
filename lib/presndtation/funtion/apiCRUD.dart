// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflixapp/core/string.dart';
import 'package:netflixapp/model/main_movies/moviess/moviess.dart';
import 'package:netflixapp/model/pages/pages.dart';

class HomeFuntion {
  static List<Moviess> trending = [];
  static List<Moviess> nowPlay = [];
  static List<Moviess> commingsoon = [];
  static List<Moviess> TtopRatedUrl = [];
  static String imges = '';

  static Future<void> getTrending() async {
    try {
      final response = await http.get(
        Uri.parse(trendingUrl),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        imges = pages.results![5].posterPath!;

        trending.addAll(pages.results! as List<Moviess>);
      }

      // ignore: empty_catches
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> getnow_playing() async {
    try {
      final response = await http.get(
        Uri.parse(nowPlayingUrl),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        nowPlay.addAll(pages.results! as List<Moviess>);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> getComingSoon() async {
    try {
      final response = await http.get(
        Uri.parse(comingSoonUrl),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        commingsoon.addAll(pages.results! as List<Moviess>);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> gettopRatedUrl() async {
    try {
      final response = await http.get(Uri.parse(topRatedUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        TtopRatedUrl.addAll(pages.results! as List<Moviess>);
      }
    } catch (e) {
      print('finat the error');
    }
  }
}
