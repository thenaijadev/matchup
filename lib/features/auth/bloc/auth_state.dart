// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthStateIsLoading extends AuthState {}

class AuthStateError extends AuthState {
  final AuthError error;
  const AuthStateError({
    required this.error,
  });
}

class AuthStateUserIsRegistered extends AuthState {
  final AuthUser user;
  final UserData userData;
  const AuthStateUserIsRegistered({
    required this.userData,
    required this.user,
  });
}

class AuthStateIsLoggedIn extends AuthState {
  final AuthUser user;
  final UserData userData;
  const AuthStateIsLoggedIn({
    required this.userData,
    required this.user,
  });
}

class AuthStateUserProfileUpdated extends AuthState {
  final UpdatedUserModel updatedUser;
  const AuthStateUserProfileUpdated({
    required this.updatedUser,
  });
}

class AuthStateOtpRequestedSuccessfully extends AuthState {
  final OtpRequestModel otpRequestModel;
  const AuthStateOtpRequestedSuccessfully({
    required this.otpRequestModel,
  });
}

class AuthStateOtpVerificationSuccessfully extends AuthState {
  final OtpVerificationModel otpVerificationModel;
  const AuthStateOtpVerificationSuccessfully({
    required this.otpVerificationModel,
  });
}

class AuthStatePasswordChanged extends AuthState {
  final PasswordResetModel resetModel;
  const AuthStatePasswordChanged({
    required this.resetModel,
  });
}

class AuthStateFcmSent extends AuthState {
  final Map<String, dynamic> response;
  const AuthStateFcmSent({
    required this.response,
  });
}
