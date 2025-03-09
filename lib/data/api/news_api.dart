import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app/data/models/article.dart';
import 'dart:convert';

import '../../core/constants/constant.dart';

Future<List<Article>> fetchNews(bool isHeadline) async {
  final String baseUrl =isHeadline ? "https://newsapi.org/v2/top-headlines?country=us&apiKey=" : "https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=";
  final Uri url = Uri.parse("$baseUrl$apiKey");

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> articlesJson = json['articles'];

      return articlesJson.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  } catch (e) {
    log("Exception: $e");
    throw Exception('Exception: $e');
  }
}
