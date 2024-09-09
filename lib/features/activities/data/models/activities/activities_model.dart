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
    required this.longitude,
    required this.latitude,
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
  final String? longitude;
  final String? latitude;
  final String? participantFee;
  final String? fee;
  final String? level;
  final int? completed;
  final dynamic cancelledAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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
      longitude: json["longitude"],
      latitude: json["latitude"],
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
        "longitude": longitude,
        "latitude": latitude,
        "participant_fee": participantFee,
        "fee": fee,
        "level": level,
        "completed": completed,
        "cancelled_at": cancelledAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
