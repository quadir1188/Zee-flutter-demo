// To parse this JSON data, do
//
//     final newsDetailsResponse = newsDetailsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

NewsDetailsResponse newsDetailsResponseFromJson(String str) => NewsDetailsResponse.fromJson(json.decode(str));

String newsDetailsResponseToJson(NewsDetailsResponse data) => json.encode(data.toJson());

class NewsDetailsResponse {
  NewsDetailsResponse({
    this.newsDetail,
    this.editorList,
    this.tags,
  });

  NewsDetail newsDetail;
  String editorList;
  List<Tag> tags;

  factory NewsDetailsResponse.fromRawJson(String str) =>
      NewsDetailsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsDetailsResponse.fromJson(Map<String, dynamic> json) => NewsDetailsResponse(
    newsDetail: NewsDetail.fromJson(json["NewsDetail"]),
    editorList: json["editorList"],
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "NewsDetail": newsDetail.toJson(),
    "editorList": editorList,
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
  };

}

class NewsDetail {
  NewsDetail({
    this.id,
    this.source,
    this.author,
    this.title,
    this.timestamp,
    this.section,
    this.slug,
    this.sectionId,
    this.content,
    this.websiteurl,
    this.thumbnailUrl,
    this.sectionUrl,
    this.url,
    this.newsType,
    this.highlights,
    this.comments,
  });

  String id;
  String source;
  String author;
  String title;
  String timestamp;
  String section;
  String slug;
  String sectionId;
  String content;
  String websiteurl;
  String thumbnailUrl;
  String sectionUrl;
  String url;
  String newsType;
  String highlights;
  String comments;

  factory NewsDetail.fromJson(Map<String, dynamic> json) => NewsDetail(
    id: json["id"],
    source: json["source"],
    author: json["author"],
    title: json["title"],
    timestamp: json["timestamp"] ,
    section: json["section"],
    slug: json["slug"],
    sectionId: json["section_id"],
    content: json["content"],
    websiteurl: json["websiteurl"],
    thumbnailUrl: json["thumbnail_url"],
    sectionUrl: json["section_url"],
    url: json["url"],
    newsType: json["news_type"],
    highlights: json["highlights"],
    comments: json["comments"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "source": source,
    "author": author,
    "title": title,
    "timestamp": timestamp == null ,
    "section": section,
    "slug": slug,
    "section_id": sectionId,
    "content": content,
    "websiteurl": websiteurl,
    "thumbnail_url": thumbnailUrl,
    "section_url": sectionUrl,
    "url": url,
    "news_type": newsType,
    "highlights": highlights,
    "comments": comments,
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

class Tag {
  Tag({
    this.title,
    this.topicId,
    this.sectionPageUrl,
  });

  String title;
  int topicId;
  String sectionPageUrl;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    title: json["title"],
    topicId: json["topicID"],
    sectionPageUrl: json["sectionPageURL"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "topicID": topicId,
    "sectionPageURL": sectionPageUrl,
  };


}
