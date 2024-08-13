class OtpRequestModel {
  OtpRequestModel({
    required this.email,
  });

  final String? email;

  OtpRequestModel copyWith({
    String? email,
  }) {
    return OtpRequestModel(
      email: email ?? this.email,
    );
  }

  factory OtpRequestModel.fromJson(Map<String, dynamic> json) {
    return OtpRequestModel(
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
      };

  @override
  String toString() {
    return "$email, ";
  }
}
