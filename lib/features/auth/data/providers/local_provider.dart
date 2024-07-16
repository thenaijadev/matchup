import 'dart:convert';

import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  LocalDataSource._internal(
      {required this.sharedPreferences, this.cachedUser = 'CACHED_AUTHUSER'});

  static final LocalDataSource _instance = LocalDataSource._internal(
      sharedPreferences: Future.value(SharedPreferences.getInstance()));

  factory LocalDataSource() {
    return _instance;
  }

  final Future<SharedPreferences> sharedPreferences;
  final String cachedUser;

  Future<AuthUser?> getUser() async {
    final preferences = await sharedPreferences;
    final jsonString = preferences.getString(cachedUser);
    try {
      if (jsonString != null) {
        final userModel =
            await Future.value(AuthUser.fromJson(json.decode(jsonString)));
        logger.d(userModel);
        return userModel;
      }
    } finally {}
    return null;
  }

  Future<bool> saveUser(AuthUser user) async {
    final preferences = await sharedPreferences;

    final isSaved = await preferences.setString(
      cachedUser,
      json.encode(
        user.toJson(),
      ),
    );

    return isSaved;
  }

  // // You can also make deleteUser a static method if it doesn't rely on instance variables
  // static Future<EitherFutureTrueOrAuthError> deleteUser() async {
  //   try {
  //     final preferences = await SharedPreferences.getInstance();
  //     bool isDeleted = await preferences.remove(LocalDataSource().cachedUser);
  //     return right(isDeleted);
  //   } catch (e) {
  //     return left(AuthError(
  //         errorType: AuthErrorType.localUserDeleteError,
  //         message: "There has been an error deleting the user locally"));
  //   }
  // }
}
