// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileEventUpdateProfile extends ProfileEvent {}

class ProfileEventGetSports extends ProfileEvent {
  final String authToken;
  const ProfileEventGetSports({
    required this.authToken,
  });
}

class ProfileEventCreateUserSport extends ProfileEvent {
  final String authToken;
  final List<Map<String, dynamic>> sports;
  const ProfileEventCreateUserSport({
    required this.sports,
    required this.authToken,
  });
}

class ProfileEventGetUser extends ProfileEvent {
  final String authToken;
  const ProfileEventGetUser({
    required this.authToken,
  });
}
