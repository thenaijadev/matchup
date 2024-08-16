// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthEventRegisterUser extends AuthEvent {
  final UserData userData;
  const AuthEventRegisterUser({
    required this.userData,
  });
}

class AuthEventLoginUser extends AuthEvent {
  final UserData userData;
  const AuthEventLoginUser({
    required this.userData,
  });
}

class AuthEventUpdateProfile extends AuthEvent {
  final UserData userData;
  final String authToken;
  const AuthEventUpdateProfile(
      {required this.userData, required this.authToken});
}

class AuthEventRequestOtp extends AuthEvent {
  final String email;
  const AuthEventRequestOtp({
    required this.email,
  });
}

class AuthEventVerifyOtp extends AuthEvent {
  final String email;
  final String otp;
  const AuthEventVerifyOtp({
    required this.otp,
    required this.email,
  });
}

class AuthEventChangePassord extends AuthEvent {
  final String confirmPassword;
  final String password;
  final String token;
  const AuthEventChangePassord({
    required this.token,
    required this.confirmPassword,
    required this.password,
  });
}
