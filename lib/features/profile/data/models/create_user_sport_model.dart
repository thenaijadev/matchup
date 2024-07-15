class CreateUserSportModel {
  CreateUserSportModel({
    required this.status,
    required this.message,
    required this.data,
    required this.user,
  });

  final String? status;
  final String? message;
  final List<Datum> data;
  final int? user;

  CreateUserSportModel copyWith({
    String? status,
    String? message,
    List<Datum>? data,
    int? user,
  }) {
    return CreateUserSportModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      user: user ?? this.user,
    );
  }

  factory CreateUserSportModel.fromJson(Map<String, dynamic> json) {
    return CreateUserSportModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      user: json["user"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.map((x) => x.toJson()).toList(),
        "user": user,
      };

  @override
  String toString() {
    return "$status, $message, $data, $user, ";
  }
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.sportId,
    required this.skillLevel,
    required this.experienceLevel,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? userId;
  final int? sportId;
  final String? skillLevel;
  final String? experienceLevel;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum copyWith({
    int? id,
    int? userId,
    int? sportId,
    String? skillLevel,
    String? experienceLevel,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Datum(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      sportId: sportId ?? this.sportId,
      skillLevel: skillLevel ?? this.skillLevel,
      experienceLevel: experienceLevel ?? this.experienceLevel,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      userId: json["user_id"],
      sportId: json["sport_id"],
      skillLevel: json["skill_level"],
      experienceLevel: json["experience_level"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "sport_id": sportId,
        "skill_level": skillLevel,
        "experience_level": experienceLevel,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return "$id, $userId, $sportId, $skillLevel, $experienceLevel, $createdAt, $updatedAt, ";
  }
}
