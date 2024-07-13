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
