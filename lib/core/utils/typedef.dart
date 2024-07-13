import 'package:dartz/dartz.dart';
import 'package:matchup/features/auth/data/models/auth_error.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/auth/data/models/updated_user_model.dart';

typedef EitherAuthUserOrAuthError = Either<AuthError, AuthUser>;
typedef EitherTrueOrAuthError = Either<AuthError, bool>;
typedef EitherUpdatedUserModelOrAuthError = Either<AuthError, UpdatedUserModel>;


// typedef EitherFutureTrueOrAuthError = Future<Either<AuthError, bool>>;

// typedef FutureEitherAuthUserOrAuthError
//     = Future<Either<AuthError, AuthUserModel>>;

// typedef FutureEitherLocalAuthUserOrAuthError
//     = Future<Either<AuthError, AuthUserModel>>;
