class ParticipantsModel {
  ParticipantsModel({
    required this.status,
    required this.message,
    required this.data,
    required this.user,
  });

  final String? status;
  final String? message;
  final List<Participants> data;
  final Participants? user;

  factory ParticipantsModel.fromJson(Map<String, dynamic> json) {
    return ParticipantsModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<Participants>.from(
              json["data"]!.map((x) => Participants.fromJson(x))),
      user: json["user"] == null ? null : Participants.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.map((x) => x.toJson()).toList(),
        "user": user?.toJson(),
      };
}

class Participants {
  Participants({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneCode,
    required this.phoneNumber,
    required this.location,
    required this.dateOfBirth,
    required this.gender,
    required this.profileImage,
    required this.displayMode,
    required this.kycStatus,
    required this.fbProfile,
    required this.youtubeChannel,
    required this.instagramHandle,
    required this.xHandle,
    required this.introVideo,
    required this.status,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.fcmDeviceToken,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phoneCode;
  final String? phoneNumber;
  final dynamic location;
  final dynamic dateOfBirth;
  final dynamic gender;
  final dynamic profileImage;
  final String? displayMode;
  final String? kycStatus;
  final dynamic fbProfile;
  final dynamic youtubeChannel;
  final dynamic instagramHandle;
  final dynamic xHandle;
  final dynamic introVideo;
  final String? status;
  final dynamic emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic fcmDeviceToken;

  factory Participants.fromJson(Map<String, dynamic> json) {
    return Participants(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phoneCode: json["phone_code"],
      phoneNumber: json["phone_number"],
      location: json["location"],
      dateOfBirth: json["date_of_birth"],
      gender: json["gender"],
      profileImage: json["profile_image"],
      displayMode: json["display_mode"],
      kycStatus: json["kyc_status"],
      fbProfile: json["fb_profile"],
      youtubeChannel: json["youtube_channel"],
      instagramHandle: json["instagram_handle"],
      xHandle: json["x_handle"],
      introVideo: json["intro_video"],
      status: json["status"],
      emailVerifiedAt: json["email_verified_at"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      fcmDeviceToken: json["fcm_device_token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_code": phoneCode,
        "phone_number": phoneNumber,
        "location": location,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "profile_image": profileImage,
        "display_mode": displayMode,
        "kyc_status": kycStatus,
        "fb_profile": fbProfile,
        "youtube_channel": youtubeChannel,
        "instagram_handle": instagramHandle,
        "x_handle": xHandle,
        "intro_video": introVideo,
        "status": status,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "fcm_device_token": fcmDeviceToken,
      };
}
