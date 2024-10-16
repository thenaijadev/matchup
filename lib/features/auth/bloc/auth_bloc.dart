import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:matchup/features/auth/data/models/auth_error.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/auth/data/models/otp_requested.dart';
import 'package:matchup/features/auth/data/models/otp_verification_email.dart';
import 'package:matchup/features/auth/data/models/password_reset_model.dart';
import 'package:matchup/features/auth/data/models/updated_user_model.dart';
import 'package:matchup/features/auth/data/models/user_data.dart';
import 'package:matchup/features/auth/data/repositories/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepo;
  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<AuthEventRegisterUser>((event, emit) async {
      emit(AuthStateIsLoading());
      final response = await authRepo.registerUser(
          userName: event.userData.fullName ?? "",
          email: event.userData.email ?? "",
          phoneCode: event.userData.countryCode ?? "",
          phoneNumber: event.userData.phoneNumber ?? "",
          passwordConfirmation: event.userData.confirmPassword ?? "",
          password: event.userData.password ?? "",
          country: event.userData.location ?? "Nigeria",
          dateOfBirth: event.userData.dateOfBirth ?? "",
          gender: event.userData.gender ?? "Male");

      response.fold((l) => emit(AuthStateError(error: l)), (r) {
        emit(
          AuthStateUserIsRegistered(userData: event.userData, user: r),
        );
      });
    });

    on<AuthEventLoginUser>((event, emit) async {
      emit(AuthStateIsLoading());
      final response = await authRepo.login(
        email: event.userData.email!,
        password: event.userData.password!,
      );

      response.fold((l) => emit(AuthStateError(error: l)), (r) {
        emit(
          AuthStateIsLoggedIn(userData: event.userData, user: r),
        );
      });
    });

    on<AuthEventUpdateProfile>((event, emit) async {
      emit(AuthStateIsLoading());
      final response = await authRepo.updateProfile(
          authToken: event.authToken,
          dateOfBirth: event.userData.dateOfBirth ?? "",
          location: event.userData.location ?? "",
          gender: event.userData.gender ?? "",
          profileImage: event.userData.profileImage!);

      response.fold((l) => emit(AuthStateErrorFileUploadError(error: l)), (r) {
        emit(
          AuthStateUserProfileUpdated(updatedUser: r),
        );
      });
    });

    on<AuthEventRequestOtp>((event, emit) async {
      emit(AuthStateIsLoading());
      final response = await authRepo.requestOtp(email: event.email);

      response.fold((l) => emit(AuthStateError(error: l)), (r) {
        emit(
          AuthStateOtpRequestedSuccessfully(otpRequestModel: r),
        );
      });
    });

    on<AuthEventVerifyOtp>((event, emit) async {
      emit(AuthStateIsLoading());
      final response =
          await authRepo.verifyOtp(email: event.email, otp: event.otp);

      response.fold((l) => emit(AuthStateError(error: l)), (r) {
        emit(
          AuthStateOtpVerificationSuccessfully(otpVerificationModel: r),
        );
      });
    });

    on<AuthEventChangePassord>((event, emit) async {
      emit(AuthStateIsLoading());
      final response = await authRepo.changePassword(
          token: event.token,
          password: event.password,
          confirmPassword: event.confirmPassword);

      response.fold((l) => emit(AuthStateError(error: l)), (r) {
        emit(
          AuthStatePasswordChanged(resetModel: r),
        );
      });
    });

    on<AuthEventSendFCM>((event, emit) async {
      final fcm = "";
      // await FirebaseMessaging.instance.getToken();

      final response = await authRepo.sendFcm(fcm: fcm ?? "");

      response.fold((l) => emit(AuthStateError(error: l)), (r) {
        emit(
          AuthStateFcmSent(response: r),
        );
      });
    });
  }
}
