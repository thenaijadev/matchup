import 'package:dartz/dartz.dart';
import 'package:matchup/features/auth/data/models/auth_error.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/auth/data/models/updated_user_model.dart';
import 'package:matchup/features/news/data/models/news_error.dart';
import 'package:matchup/features/news/data/models/news_model.dart';
import 'package:matchup/features/news/data/models/sport_news_model.dart';
import 'package:matchup/features/profile/data/models/all_sports_model.dart';
import 'package:matchup/features/profile/data/models/create_user_sport_model.dart';
import 'package:matchup/features/profile/data/models/profile_error_model.dart';
import 'package:matchup/features/profile/data/models/user_profile_model.dart';

typedef EitherAuthUserOrAuthError = Either<AuthError, AuthUser>;
typedef EitherTrueOrAuthError = Either<AuthError, bool>;
typedef EitherUpdatedUserModelOrAuthError = Either<AuthError, UpdatedUserModel>;
typedef EitherAllSportsDataModelOrProfileError
    = Either<ProfileError, AllSportsDataModel>;
typedef EitherCreateUserSportModelOrProfileError
    = Either<ProfileError, CreateUserSportModel>;

typedef EitherUserOrProfileError = Either<ProfileError, UserProfileModel>;
typedef EitherNewsModelOrNewsError = Either<NewsError, NewsModel>;
typedef EitherSportNewsModelOrNewsError = Either<NewsError, SportsNewsModel>;


// typedef EitherFutureTrueOrAuthError = Future<Either<AuthError, bool>>;

// typedef FutureEitherAuthUserOrAuthError
//     = Future<Either<AuthError, AuthUserModel>>;

// typedef FutureEitherLocalAuthUserOrAuthError
//     = Future<Either<AuthError, AuthUserModel>>;
