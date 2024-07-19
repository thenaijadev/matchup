class SingleActivityByIdModel {
  SingleActivityByIdModel({
    required this.status,
    required this.message,
    required this.data,
    required this.user,
  });

  final String? status;
  final String? message;
  final Data? data;
  final User? user;

  SingleActivityByIdModel copyWith({
    String? status,
    String? message,
    Data? data,
    User? user,
  }) {
    return SingleActivityByIdModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      user: user ?? this.user,
    );
  }

  factory SingleActivityByIdModel.fromJson(Map<String, dynamic> json) {
    return SingleActivityByIdModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "user": user?.toJson(),
      };

  @override
  String toString() {
    return "$status, $message, $data, $user, ";
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.poster,
    required this.sportId,
    required this.allowedGenders,
    required this.frequency,
    required this.startTime,
    required this.endTime,
    required this.startDate,
    required this.locationName,
    required this.address,
    required this.longLat,
    required this.participantFee,
    required this.fee,
    required this.level,
    required this.completed,
    required this.cancelledAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? type;
  final String? poster;
  final int? sportId;
  final String? allowedGenders;
  final String? frequency;
  final DateTime? startTime;
  final DateTime? endTime;
  final DateTime? startDate;
  final String? locationName;
  final String? address;
  final LongLat? longLat;
  final String? participantFee;
  final String? fee;
  final String? level;
  final int? completed;
  final dynamic cancelledAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data copyWith({
    int? id,
    String? name,
    String? description,
    String? type,
    String? poster,
    int? sportId,
    String? allowedGenders,
    String? frequency,
    DateTime? startTime,
    DateTime? endTime,
    DateTime? startDate,
    String? locationName,
    String? address,
    LongLat? longLat,
    String? participantFee,
    String? fee,
    String? level,
    int? completed,
    dynamic cancelledAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Data(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      poster: poster ?? this.poster,
      sportId: sportId ?? this.sportId,
      allowedGenders: allowedGenders ?? this.allowedGenders,
      frequency: frequency ?? this.frequency,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      startDate: startDate ?? this.startDate,
      locationName: locationName ?? this.locationName,
      address: address ?? this.address,
      longLat: longLat ?? this.longLat,
      participantFee: participantFee ?? this.participantFee,
      fee: fee ?? this.fee,
      level: level ?? this.level,
      completed: completed ?? this.completed,
      cancelledAt: cancelledAt ?? this.cancelledAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      type: json["type"],
      poster: json["poster"],
      sportId: json["sport_id"],
      allowedGenders: json["allowed_genders"],
      frequency: json["frequency"],
      startTime: DateTime.tryParse(json["start_time"] ?? ""),
      endTime: DateTime.tryParse(json["end_time"] ?? ""),
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      locationName: json["location_name"],
      address: json["address"],
      longLat:
          json["long_lat"] == null ? null : LongLat.fromJson(json["long_lat"]),
      participantFee: json["participant_fee"],
      fee: json["fee"],
      level: json["level"],
      completed: json["completed"],
      cancelledAt: json["cancelled_at"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
        "poster": poster,
        "sport_id": sportId,
        "allowed_genders": allowedGenders,
        "frequency": frequency,
        "start_time": startTime?.toIso8601String(),
        "end_time": endTime?.toIso8601String(),
        "start_date":
            "${startDate?.year.toString().padLeft(4, '0')}-${startDate?.month.toString().padLeft(2, '0')}-${startDate?.day.toString().padLeft(2, '0')}",
        "location_name": locationName,
        "address": address,
        "long_lat": longLat?.toJson(),
        "participant_fee": participantFee,
        "fee": fee,
        "level": level,
        "completed": completed,
        "cancelled_at": cancelledAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return "$id, $name, $description, $type, $poster, $sportId, $allowedGenders, $frequency, $startTime, $endTime, $startDate, $locationName, $address, $longLat, $participantFee, $fee, $level, $completed, $cancelledAt, $createdAt, $updatedAt, ";
  }
}

class LongLat {
  LongLat({
    required this.longitude,
    required this.latitude,
  });

  final double? longitude;
  final double? latitude;

  LongLat copyWith({
    double? longitude,
    double? latitude,
  }) {
    return LongLat(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  factory LongLat.fromJson(Map<String, dynamic> json) {
    return LongLat(
      longitude: json["longitude"],
      latitude: json["latitude"],
    );
  }

  Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
      };

  @override
  String toString() {
    return "$longitude, $latitude, ";
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
