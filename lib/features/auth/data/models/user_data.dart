import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  final String email;
  final String fullName;
  final String password;
  final String confirmPassword;
  final String phoneNumber;
  final String countryCode;
  final String? dateOfBirth;
  final String? gender;
  final bool? showGender;
  final String? country;
  UserData({
    required this.email,
    required this.fullName,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
    required this.countryCode,
    this.dateOfBirth,
    this.gender,
    this.showGender,
    this.country,
  });

  UserData copyWith({
    String? email,
    String? fullName,
    String? password,
    String? confirmPassword,
    String? phoneNumber,
    String? countryCode,
    String? dateOfBirth,
    String? gender,
    bool? showGender,
    String? country,
  }) {
    return UserData(
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryCode: countryCode ?? this.countryCode,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      showGender: showGender ?? this.showGender,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'fullName': fullName,
      'password': password,
      'confirmPassword': confirmPassword,
      'phoneNumber': phoneNumber,
      'countryCode': countryCode,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'showGender': showGender,
      'country': country,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      email: map['email'] as String,
      fullName: map['fullName'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
      phoneNumber: map['phoneNumber'] as String,
      countryCode: map['countryCode'] as String,
      dateOfBirth:
          map['dateOfBirth'] != null ? map['dateOfBirth'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      showGender: map['showGender'] != null ? map['showGender'] as bool : null,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(email: $email, fullName: $fullName, password: $password, confirmPassword: $confirmPassword, phoneNumber: $phoneNumber, countryCode: $countryCode, dateOfBirth: $dateOfBirth, gender: $gender, showGender: $showGender, country: $country)';
  }

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.fullName == fullName &&
        other.password == password &&
        other.confirmPassword == confirmPassword &&
        other.phoneNumber == phoneNumber &&
        other.countryCode == countryCode &&
        other.dateOfBirth == dateOfBirth &&
        other.gender == gender &&
        other.showGender == showGender &&
        other.country == country;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        fullName.hashCode ^
        password.hashCode ^
        confirmPassword.hashCode ^
        phoneNumber.hashCode ^
        countryCode.hashCode ^
        dateOfBirth.hashCode ^
        gender.hashCode ^
        showGender.hashCode ^
        country.hashCode;
  }
}
