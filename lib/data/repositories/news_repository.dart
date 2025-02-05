import 'dart:developer';

import 'package:bloc_starter_pro/data/models/news_model.dart';
import 'package:bloc_starter_pro/data/providers/api_service.dart';

class NewsRepository {
  Future<List<NewsData>> fetchNews(String url) async {
    try {
      final response = await ApiService.get(url);

      // Parse the response using the NewsModel
      final newsModel = NewsModel.fromJson(response);

      // Return the parsed list of news
      return newsModel.results;
    } catch (e) {
      log("Error fetching news: $e");
      throw Exception('Failed to fetch news data');
    }
  }
}
