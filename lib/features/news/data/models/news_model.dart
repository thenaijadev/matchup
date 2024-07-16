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

class NewsItem {
  NewsItem({
    required this.id,
    required this.title,
    required this.slug,
    required this.poster,
    required this.content,
    required this.synopsis,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? title;
  final String? slug;
  final String? poster;
  final String? content;
  final String? synopsis;
  final dynamic createdAt;
  final dynamic updatedAt;

  NewsItem copyWith({
    int? id,
    String? title,
    String? slug,
    String? poster,
    String? content,
    String? synopsis,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    return NewsItem(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      poster: poster ?? this.poster,
      content: content ?? this.content,
      synopsis: synopsis ?? this.synopsis,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json["id"],
      title: json["title"],
      slug: json["slug"],
      poster: json["poster"],
      content: json["content"],
      synopsis: json["synopsis"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "poster": poster,
        "content": content,
        "synopsis": synopsis,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  @override
  String toString() {
    return "$id, $title, $slug, $poster, $content, $synopsis, $createdAt, $updatedAt, ";
  }
}
