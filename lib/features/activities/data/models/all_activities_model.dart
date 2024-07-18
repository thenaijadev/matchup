import 'package:matchup/features/activities/data/models/activities_model.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';

class AllActivitiesModel {
  AllActivitiesModel({
    required this.status,
    required this.message,
    required this.activities,
    required this.user,
  });

  final String? status;
  final String? message;
  final List<Activities> activities;
  final User? user;

  AllActivitiesModel copyWith({
    String? status,
    String? message,
    List<Activities>? data,
    User? user,
  }) {
    return AllActivitiesModel(
      status: status ?? this.status,
      message: message ?? this.message,
      activities: data ?? activities,
      user: user ?? this.user,
    );
  }

  factory AllActivitiesModel.fromJson(Map<String, dynamic> json) {
    return AllActivitiesModel(
      status: json["status"],
      message: json["message"],
      activities: json["data"] == null
          ? []
          : List<Activities>.from(
              json["data"]!.map((x) => Activities.fromJson(x))),
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": activities.map((x) => x.toJson()).toList(),
        "user": user?.toJson(),
      };

  @override
  String toString() {
    return "$status, $message, $activities, $user, ";
  }
}
