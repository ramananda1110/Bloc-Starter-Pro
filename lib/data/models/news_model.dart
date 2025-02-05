import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  String status;
  int totalResults;
  List<NewsData> results;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.results,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"] ?? "",
        totalResults: json["totalResults"] ?? 0,
        results: (json["results"] as List<dynamic>?)
                ?.map((x) => NewsData.fromJson(x))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": results.map((x) => x.toJson()).toList(),
      };
}

class NewsData {
  String? articleId;
  String? title;
  String? link;
  String? description;
  String? content;
  String? pubDate;
  String? imageUrl;
  String? sourceId;
  int? sourcePriority;
  String? sourceName;
  String? sourceUrl;
  String? sourceIcon;
  String? language;
  String? aiTag;
  String? sentiment;
  String? sentimentStats;
  String? aiRegion;
  String? aiOrg;

  NewsData({
    this.articleId,
    this.title,
    this.link,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
    this.sourceId,
    this.sourcePriority,
    this.sourceName,
    this.sourceUrl,
    this.sourceIcon,
    this.language,
    this.aiTag,
    this.sentiment,
    this.sentimentStats,
    this.aiRegion,
    this.aiOrg,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        articleId: json["article_id"] as String?,
        title: json["title"] as String?,
        link: json["link"] as String?,
        description: json["description"] as String?,
        content: json["content"] as String?,
        pubDate: json["pubDateTZ"] as String?,
        imageUrl: json["image_url"] as String?,
        sourceId: json["source_id"] as String?,
        sourcePriority: json["source_priority"] as int?,
        sourceName: json["source_name"] as String?,
        sourceUrl: json["source_url"] as String?,
        sourceIcon: json["source_icon"] as String?,
        language: json["language"] as String?,
        aiTag: json["ai_tag"] as String?,
        sentiment: json["sentiment"] as String?,
        sentimentStats: json["sentiment_stats"] as String?,
        aiRegion: json["ai_region"] as String?,
        aiOrg: json["ai_org"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "article_id": articleId,
        "title": title,
        "link": link,
        "description": description,
        "content": content,
        "pubDate": pubDate,
        "image_url": imageUrl,
        "source_id": sourceId,
        "source_priority": sourcePriority,
        "source_name": sourceName,
        "source_url": sourceUrl,
        "source_icon": sourceIcon,
        "language": language,
        "ai_tag": aiTag,
        "sentiment": sentiment,
        "sentiment_stats": sentimentStats,
        "ai_region": aiRegion,
        "ai_org": aiOrg,
      };
}
