import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matchup/features/auth/data/models/auth_error.dart';
import 'package:matchup/features/auth/data/models/user_data.dart';
import 'package:matchup/features/auth/data/models/user_model.dart';
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
          email: event.userData.email,
          phoneCode: event.userData.countryCode ?? "",
          phoneNumber: event.userData.phoneNumber ?? "",
          passwordConfirmation: event.userData.confirmPassword ?? "",
          password: event.userData.password,
          country: event.userData.country ?? "Nigeria",
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
        email: event.userData.email,
        password: event.userData.password,
      );

      response.fold((l) => emit(AuthStateError(error: l)), (r) {
        emit(
          AuthStateIsLoggedIn(userData: event.userData, user: r),
        );
      });
    });
  }
}
