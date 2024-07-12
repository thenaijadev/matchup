class AuthUser {
  AuthUser({
    required this.status,
    required this.message,
    required this.token,
    required this.user,
  });

  final String? status;
  final String? message;
  final String? token;
  final User? user;

  AuthUser copyWith({
    String? status,
    String? message,
    String? token,
    User? user,
  }) {
    return AuthUser(
      status: status ?? this.status,
      message: message ?? this.message,
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      status: json["status"],
      message: json["message"],
      token: json["token"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "user": user?.toJson(),
      };

  @override
  String toString() {
    return "$status, $message, $token, $user, ";
  }
}

class User {
  User({
    required this.name,
    required this.email,
    required this.phoneCode,
    required this.phoneNumber,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  final String? name;
  final String? email;
  final String? phoneCode;
  final String? phoneNumber;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  User copyWith({
    String? name,
    String? email,
    String? phoneCode,
    String? phoneNumber,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneCode: phoneCode ?? this.phoneCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      email: json["email"],
      phoneCode: json["phone_code"],
      phoneNumber: json["phone_number"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_code": phoneCode,
        "phone_number": phoneNumber,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };

  @override
  String toString() {
    return "$name, $email, $phoneCode, $phoneNumber, $updatedAt, $createdAt, $id, ";
  }
}
