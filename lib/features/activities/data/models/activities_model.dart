class Activities {
  Activities({
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
  final dynamic longLat;
  final String? participantFee;
  final String? fee;
  final String? level;
  final int? completed;
  final dynamic cancelledAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Activities copyWith({
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
    dynamic longLat,
    String? participantFee,
    String? fee,
    String? level,
    int? completed,
    dynamic cancelledAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Activities(
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

  factory Activities.fromJson(Map<String, dynamic> json) {
    return Activities(
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
      longLat: json["long_lat"],
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
        "long_lat": longLat,
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
