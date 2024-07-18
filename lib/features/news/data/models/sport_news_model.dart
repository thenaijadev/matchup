import 'package:matchup/features/news/data/models/news_item.dart';
import 'package:matchup/features/news/data/models/news_model.dart';

class SportsNewsModel {
  SportsNewsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final String? status;
  final String? message;
  final List<NewsItem> data;

  SportsNewsModel copyWith({
    String? status,
    String? message,
    List<NewsItem>? data,
  }) {
    return SportsNewsModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory SportsNewsModel.fromJson(Map<String, dynamic> json) {
    return SportsNewsModel(
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
