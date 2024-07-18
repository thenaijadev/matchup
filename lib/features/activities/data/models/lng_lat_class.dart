class LongLatClass {
  LongLatClass({
    required this.longitude,
    required this.latitude,
  });

  final double? longitude;
  final double? latitude;

  LongLatClass copyWith({
    double? longitude,
    double? latitude,
  }) {
    return LongLatClass(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  factory LongLatClass.fromJson(Map<String, dynamic> json) {
    return LongLatClass(
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
