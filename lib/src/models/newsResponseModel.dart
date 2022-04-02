// To parse this JSON data, do
//
//     final newsApiResonse = newsApiResonseFromJson(jsonString);
import 'dart:convert';

import 'package:intl/intl.dart';

class NewsApiResonse {

  List<NewsData> news;

  NewsApiResonse({
    this.news,
  });

  factory NewsApiResonse.fromRawJson(String str) =>
      NewsApiResonse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsApiResonse.fromJson(Map<String, dynamic> json) => NewsApiResonse(

        news: json["news"] == null
            ? null
            : List<NewsData>.from(
                json["news"].map((x) => NewsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
      "news": news == null
            ? null
            : List<dynamic>.from(news.map((x) => x.toJson())),
      };
}

class NewsData {
  String title;
  String highlights;
  String url;
  String thumbnailUrl;
  String timestamp;


  NewsData({
    this.title,
    this.highlights,
    this.thumbnailUrl,
    this.url,
    this.timestamp,
  });

  factory NewsData.fromRawJson(String str) => NewsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        title: json["title"] == null ? null : json["title"],
        highlights: json["highlights"] == null ? null : json["highlights"],
        url: json["url"] == null ? null : json["url"],
        thumbnailUrl: json["thumbnail_url"] == null ? null : json["thumbnail_url"],
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
       "title": title == null ? null : title,
        "highlights": highlights == null ? null : highlights,
        "url": url == null ? null : url,
        "urlToImage": thumbnailUrl == null ? null : thumbnailUrl,

       "timestamp": timestamp == null ? null : timestamp,
      };
  String getTime() {
    var formatter = new DateFormat('dd MMMM yyyy h:m');
    String formatted = formatter.format(DateTime.parse(timestamp));
    return formatted;
  }

  String getDateOnly() {
    var formatter = new DateFormat('dd MMMM yyyy');
    String formatted = formatter.format(DateTime.parse(timestamp));
    return formatted;
  }
}

class Source {
  String id;
  String name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": name == null ? null : name,
      };
}
