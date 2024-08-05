class ActivityCreationFormModel {
  ActivityCreationFormModel({
    this.name,
    this.description,
    this.sportId,
    this.allowedGenders,
    this.frequency,
    this.startTime,
    this.endTime,
    this.startDate,
    this.locationName,
    this.address,
    this.longLat,
    this.participantFee,
    this.fee,
    this.level,
    this.completed,
    this.cancelledAt,
    this.type,
  });

  final String? name;
  final String? description;
  final int? sportId;
  final String? allowedGenders;
  final String? frequency;
  final DateTime? startTime;
  final DateTime? endTime;
  final DateTime? startDate;
  final String? locationName;
  final String? address;
  final String? longLat;
  final int? participantFee;
  final int? fee;
  final String? level;
  final int? completed;
  final dynamic cancelledAt;
  final String? type;

  ActivityCreationFormModel copyWith({
    String? name,
    String? description,
    int? sportId,
    String? allowedGenders,
    String? frequency,
    DateTime? startTime,
    DateTime? endTime,
    DateTime? startDate,
    String? locationName,
    String? address,
    String? longLat,
    int? participantFee,
    int? fee,
    String? level,
    int? completed,
    dynamic cancelledAt,
    String? type,
  }) {
    return ActivityCreationFormModel(
      name: name ?? this.name,
      description: description ?? this.description,
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
      type: type ?? this.type,
    );
  }

  factory ActivityCreationFormModel.fromJson(Map<String, dynamic> json) {
    return ActivityCreationFormModel(
      name: json["name"],
      description: json["description"],
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
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
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
        "type": type,
      };

  @override
  String toString() {
    return "$name, $description, $sportId, $allowedGenders, $frequency, $startTime, $endTime, $startDate, $locationName, $address, $longLat, $participantFee, $fee, $level, $completed, $cancelledAt, $type, ";
  }
}
