import 'package:matchup/features/news/data/models/news_item.dart';

class NewsModel {
  NewsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final String? status;
  final String? message;
  final List<NewsItem> data;

  NewsModel copyWith({
    String? status,
    String? message,
    List<NewsItem>? data,
  }) {
    return NewsModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<NewsItem>.from(json["data"]!.map((x) => NewsItem.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$status, $message, $data, ";
  }
}
