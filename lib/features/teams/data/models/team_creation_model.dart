class TeamCreationModel {
  TeamCreationModel({
    required this.status,
    required this.team,
    required this.message,
    required this.user,
  });

  final String? status;
  final Team? team;
  final String? message;
  final User? user;

  TeamCreationModel copyWith({
    String? status,
    Team? team,
    String? message,
    User? user,
  }) {
    return TeamCreationModel(
      status: status ?? this.status,
      team: team ?? this.team,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }

  factory TeamCreationModel.fromJson(Map<String, dynamic> json) {
    return TeamCreationModel(
      status: json["status"],
      team: json["team"] == null ? null : Team.fromJson(json["team"]),
      message: json["message"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "team": team?.toJson(),
        "message": message,
        "user": user?.toJson(),
      };

  @override
  String toString() {
    return "$status, $team, $message, $user, ";
  }
}

class Team {
  Team({
    required this.userId,
    required this.name,
    required this.slogan,
    required this.numberOfPlayers,
    required this.badge,
    required this.members,
    required this.fee,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  final int? userId;
  final String? name;
  final String? slogan;
  final String? numberOfPlayers;
  final String? badge;
  final dynamic members;
  final dynamic fee;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Team copyWith({
    int? userId,
    String? name,
    String? slogan,
    String? numberOfPlayers,
    String? badge,
    dynamic members,
    dynamic fee,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) {
    return Team(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      slogan: slogan ?? this.slogan,
      numberOfPlayers: numberOfPlayers ?? this.numberOfPlayers,
      badge: badge ?? this.badge,
      members: members ?? this.members,
      fee: fee ?? this.fee,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      userId: json["user_id"],
      name: json["name"],
      slogan: json["slogan"],
      numberOfPlayers: json["number_of_players"],
      badge: json["badge"],
      members: json["members"],
      fee: json["fee"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "slogan": slogan,
        "number_of_players": numberOfPlayers,
        "badge": badge,
        "members": members,
        "fee": fee,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };

  @override
  String toString() {
    return "$userId, $name, $slogan, $numberOfPlayers, $badge, $members, $fee, $updatedAt, $createdAt, $id, ";
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

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phoneCode,
    String? phoneNumber,
    dynamic location,
    dynamic dateOfBirth,
    dynamic gender,
    dynamic profileImage,
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
      };

  @override
  String toString() {
    return "$id, $name, $email, $phoneCode, $phoneNumber, $location, $dateOfBirth, $gender, $profileImage, $displayMode, $kycStatus, $fbProfile, $youtubeChannel, $instagramHandle, $xHandle, $introVideo, $status, $emailVerifiedAt, $createdAt, $updatedAt, ";
  }
}
