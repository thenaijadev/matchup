class AllSportsDataModel {
  AllSportsDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final String? status;
  final String? message;
  final List<Sport> data;

  AllSportsDataModel copyWith({
    String? status,
    String? message,
    List<Sport>? data,
  }) {
    return AllSportsDataModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory AllSportsDataModel.fromJson(Map<String, dynamic> json) {
    return AllSportsDataModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<Sport>.from(json["data"]!.map((x) => Sport.fromJson(x))),
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

class Sport {
  Sport(
      {required this.id,
      required this.name,
      required this.image,
      required this.createdAt,
      required this.updatedAt,
      this.skillLevel,
      this.experienceLevel});

  final int? id;
  final String? name;
  final String? image;
  final dynamic createdAt;
  final dynamic updatedAt;
  final String? skillLevel;
  final String? experienceLevel;

  Sport copyWith({
    int? id,
    String? name,
    String? image,
    dynamic createdAt,
    dynamic updatedAt,
    String? skillLevel,
    String? experienceLevel,
  }) {
    return Sport(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      skillLevel: skillLevel ?? this.skillLevel,
      experienceLevel: experienceLevel ?? this.experienceLevel,
    );
  }

  factory Sport.fromJson(Map<String, dynamic> json) {
    return Sport(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      skillLevel: json["skill_level"],
      experienceLevel: json["experience_level"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "skill_level": skillLevel,
        "experience_level": experienceLevel,
      };

  @override
  String toString() {
    return "$id, $name, $image, $createdAt, $updatedAt, $skillLevel, $experienceLevel";
  }
}
