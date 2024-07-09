import 'package:matchup/core/utils/typedef.dart';
import 'package:matchup/features/auth/data/providers/auth_provider.dart';

class AuthRepository {
  final AuthProvider provider;
  AuthRepository({
    required this.provider,
  });

  Future<EitherAuthUserOrAuthError> registerUser(
      {required String userName,
      required String email,
      required String phoneCode,
      required String phoneNumber,
      required String passwordConfirmation,
      required String password,
      required String country,
      required String dateOfBirth,
      required String gender}) async {
    return await provider.registerUser(
        userName: userName,
        email: email,
        phoneCode: phoneCode,
        phoneNumber: phoneNumber,
        passwordConfirmation: passwordConfirmation,
        password: password,
        country: country,
        dateOfBirth: dateOfBirth,
        gender: gender);
  }
}
