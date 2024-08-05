class ActivityCreationModel {
  ActivityCreationModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  ActivityCreationModel copyWith({
    String? status,
    String? message,
    Data? data,
  }) {
    return ActivityCreationModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory ActivityCreationModel.fromJson(Map<String, dynamic> json) {
    return ActivityCreationModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };

  @override
  String toString() {
    return "$status, $message, $data, ";
  }
}

class Data {
  Data({
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
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  final String? name;
  final String? description;
  final String? type;
  final Poster? poster;
  final String? sportId;
  final String? allowedGenders;
  final String? frequency;
  final DateTime? startTime;
  final DateTime? endTime;
  final DateTime? startDate;
  final String? locationName;
  final String? address;
  final String? longLat;
  final String? participantFee;
  final String? fee;
  final String? level;
  final String? completed;
  final dynamic cancelledAt;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data copyWith({
    String? name,
    String? description,
    String? type,
    Poster? poster,
    String? sportId,
    String? allowedGenders,
    String? frequency,
    DateTime? startTime,
    DateTime? endTime,
    DateTime? startDate,
    String? locationName,
    String? address,
    String? longLat,
    String? participantFee,
    String? fee,
    String? level,
    String? completed,
    dynamic cancelledAt,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) {
    return Data(
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
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json["name"],
      description: json["description"],
      type: json["type"],
      poster: json["poster"] == null ? null : Poster.fromJson(json["poster"]),
      sportId: json["sport_id"],
      allowedGenders: json["allowed_genders"],
      frequency: json["frequency"],
      startTime: DateTime.tryParse(json["start_time"] ?? ""),
      endTime: DateTime.tryParse(json["end_time"] ?? ""),
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      locationName: json["location_name"],
      address: json["address"],
      longLat: json["long_lat"],
      participantFee: json["participant_fee"],
      fee: json["fee"],
      level: json["level"],
      completed: json["completed"],
      cancelledAt: json["cancelled_at"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "type": type,
        "poster": poster?.toJson(),
        "sport_id": sportId,
        "allowed_genders": allowedGenders,
        "frequency": frequency,
        "start_time": startTime?.toIso8601String(),
        "end_time": endTime?.toIso8601String(),
        "start_date":
            "${startDate?.year.toString().padLeft(4, '0')}-${startDate?.month.toString().padLeft(2, '0')}-${startDate?.day.toString().padLeft(2, '0')}",
        "location_name": locationName,
        "address": address,
        "long_lat": longLat,
        "participant_fee": participantFee,
        "fee": fee,
        "level": level,
        "completed": completed,
        "cancelled_at": cancelledAt,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };

  @override
  String toString() {
    return "$name, $description, $type, $poster, $sportId, $allowedGenders, $frequency, $startTime, $endTime, $startDate, $locationName, $address, $longLat, $participantFee, $fee, $level, $completed, $cancelledAt, $updatedAt, $createdAt, $id, ";
  }
}

class Poster {
  Poster({required this.json});
  final Map<String, dynamic> json;

  factory Poster.fromJson(Map<String, dynamic> json) {
    return Poster(json: json);
  }

  Map<String, dynamic> toJson() => {};

  @override
  String toString() {
    return "";
  }
}
