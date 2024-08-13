class OtpVerificationModel {
  OtpVerificationModel({
    required this.status,
    required this.message,
    required this.token,
  });

  final String? status;
  final String? message;
  final String? token;

  OtpVerificationModel copyWith({
    String? status,
    String? message,
    String? token,
  }) {
    return OtpVerificationModel(
      status: status ?? this.status,
      message: message ?? this.message,
      token: token ?? this.token,
    );
  }

  factory OtpVerificationModel.fromJson(Map<String, dynamic> json) {
    return OtpVerificationModel(
      status: json["status"],
      message: json["message"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
      };

  @override
  String toString() {
    return "$status, $message, $token, ";
  }
}
