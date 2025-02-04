import 'package:bloc_starter_pro/data/models/news_model.dart';
import 'package:bloc_starter_pro/data/providers/api_service.dart';

class NewsRepository {
  Future<List<News>> fetchNews(String url) async {
    final response = await ApiService.get(url);
    return response.map<News>((json) => News.fromJson(json)).toList();
  }
}
