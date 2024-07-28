class AllUsersModel {
  AllUsersModel({
    required this.status,
    required this.message,
    required this.users,
  });

  final String? status;
  final String? message;
  final List<User> users;

  AllUsersModel copyWith({
    String? status,
    String? message,
    List<User>? users,
  }) {
    return AllUsersModel(
      status: status ?? this.status,
      message: message ?? this.message,
      users: users ?? this.users,
    );
  }

  factory AllUsersModel.fromJson(Map<String, dynamic> json) {
    return AllUsersModel(
      status: json["status"],
      message: json["message"],
      users: json["users"] == null
          ? []
          : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "users": users.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$status, $message, $users, ";
  }
}

class User {
  User({
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
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phoneCode;
  final String? phoneNumber;
  final String? location;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? profileImage;
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

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phoneCode,
    String? phoneNumber,
    String? location,
    DateTime? dateOfBirth,
    String? gender,
    String? profileImage,
    String? displayMode,
    String? kycStatus,
    dynamic fbProfile,
    dynamic youtubeChannel,
    dynamic instagramHandle,
    dynamic xHandle,
    dynamic introVideo,
    String? status,
    dynamic emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneCode: phoneCode ?? this.phoneCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      profileImage: profileImage ?? this.profileImage,
      displayMode: displayMode ?? this.displayMode,
      kycStatus: kycStatus ?? this.kycStatus,
      fbProfile: fbProfile ?? this.fbProfile,
      youtubeChannel: youtubeChannel ?? this.youtubeChannel,
      instagramHandle: instagramHandle ?? this.instagramHandle,
      xHandle: xHandle ?? this.xHandle,
      introVideo: introVideo ?? this.introVideo,
      status: status ?? this.status,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phoneCode: json["phone_code"],
      phoneNumber: json["phone_number"],
      location: json["location"],
      dateOfBirth: DateTime.tryParse(json["date_of_birth"] ?? ""),
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
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_code": phoneCode,
        "phone_number": phoneNumber,
        "location": location,
        "date_of_birth":
            "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
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
      };

  @override
  String toString() {
    return "$id, $name, $email, $phoneCode, $phoneNumber, $location, $dateOfBirth, $gender, $profileImage, $displayMode, $kycStatus, $fbProfile, $youtubeChannel, $instagramHandle, $xHandle, $introVideo, $status, $emailVerifiedAt, $createdAt, $updatedAt, ";
  }
}
