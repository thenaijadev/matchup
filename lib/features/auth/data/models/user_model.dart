// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthUser {
  AuthUser({
    required this.status,
    required this.token,
  });

  final String? status;
  final String? token;

  AuthUser copyWith({
    String? status,
    String? token,
  }) {
    return AuthUser(
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      status: json["status"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
      };

  @override
  String toString() {
    return "$status, $token, ";
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'token': token,
    };
  }

  factory AuthUser.fromMap(Map<String, dynamic> map) {
    return AuthUser(
      status: map['status'] != null ? map['status'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }
}
