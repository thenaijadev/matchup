// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileStateIsLoading extends ProfileState {}

class ProfileStateAllSportsGotten extends ProfileState {
  final AllSportsDataModel sportsModel;
  const ProfileStateAllSportsGotten({
    required this.sportsModel,
  });
}

class ProfileStateUserSportCreated extends ProfileState {
  final CreateUserSportModel sportsModel;
  const ProfileStateUserSportCreated({
    required this.sportsModel,
  });
}

class ProfileStateError extends ProfileState {
  final ProfileError error;
  const ProfileStateError({
    required this.error,
  });
}
