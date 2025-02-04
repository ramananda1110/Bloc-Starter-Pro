// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  String status;
  int totalResults;
  List<News> results;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.results,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        results: List<News>.from(json["results"].map((x) => News.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class News {
  String id;
  String name;
  String url;
  String icon;
  int priority;
  String description;
  List<String> category;
  DateTime lastFetch;

  News({
    required this.id,
    required this.name,
    required this.url,
    required this.icon,
    required this.priority,
    required this.description,
    required this.category,
    required this.lastFetch,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        icon: json["icon"],
        priority: json["priority"],
        description: json["description"],
        category: List<String>.from(json["category"].map((x) => x)),
        lastFetch: DateTime.parse(json["last_fetch"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "icon": icon,
        "priority": priority,
        "description": description,
        "category": List<dynamic>.from(category.map((x) => x)),
        "last_fetch": lastFetch.toIso8601String(),
      };
}
