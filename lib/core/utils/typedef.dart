import 'package:dartz/dartz.dart';
import 'package:matchup/features/activities/data/models/activities/activities_created_model.dart';
import 'package:matchup/features/activities/data/models/activities/activities_error.dart';
import 'package:matchup/features/activities/data/models/activities/all_activities_model.dart';
import 'package:matchup/features/activities/data/models/activities/single_activity_model.dart';
import 'package:matchup/features/activities/data/models/reviews/review_post_model.dart';
import 'package:matchup/features/activities/data/models/reviews/reviews_error.dart';
import 'package:matchup/features/activities/data/models/reviews/reviews_model.dart';
import 'package:matchup/features/auth/data/models/auth_error.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/auth/data/models/otp_requested.dart';
import 'package:matchup/features/auth/data/models/otp_verification_email.dart';
import 'package:matchup/features/auth/data/models/password_reset_model.dart';
import 'package:matchup/features/auth/data/models/updated_user_model.dart';
import 'package:matchup/features/chat/data/models/chat_model.dart';
import 'package:matchup/features/chat/data/models/message_error.dart';
import 'package:matchup/features/chat/data/models/participant_error.dart';
import 'package:matchup/features/chat/data/models/participants_model.dart';
import 'package:matchup/features/chat/data/models/send_chat_model.dart';
import 'package:matchup/features/news/data/models/news_error.dart';
import 'package:matchup/features/news/data/models/news_model.dart';
import 'package:matchup/features/news/data/models/sport_news_model.dart';
import 'package:matchup/features/profile/data/models/all_sports_model.dart';
import 'package:matchup/features/profile/data/models/all_users_model.dart';
import 'package:matchup/features/profile/data/models/create_user_sport_model.dart';
import 'package:matchup/features/profile/data/models/profile_error_model.dart';
import 'package:matchup/features/profile/data/models/user_profile_model.dart';
import 'package:matchup/features/quiz/data/models/quiz_error.dart';
import 'package:matchup/features/quiz/data/models/quiz_model.dart';
import 'package:matchup/features/teams/data/models/team_creation_model.dart';
import 'package:matchup/features/teams/data/models/team_error.dart';

typedef EitherAuthUserOrAuthError = Either<AuthError, AuthUser>;
typedef EitherTrueOrAuthError = Either<AuthError, bool>;
typedef EitherUpdatedUserModelOrAuthError = Either<AuthError, UpdatedUserModel>;
typedef EitherAllSportsDataModelOrProfileError
    = Either<ProfileError, AllSportsDataModel>;
typedef EitherCreateUserSportModelOrProfileError
    = Either<ProfileError, CreateUserSportModel>;

typedef EitherUserOrProfileError = Either<ProfileError, UserProfileModel>;
typedef EitherTeamCreationModelOrTeamError
    = Either<TeamError, TeamCreationModel>;

typedef EitherAllUsersOrProfileError = Either<ProfileError, AllUsersModel>;

typedef EitherNewsModelOrNewsError = Either<NewsError, NewsModel>;

typedef EitherSportNewsModelOrNewsError = Either<NewsError, SportsNewsModel>;

typedef EitherAllActivitiesModelOrActivitiesError
    = Either<ActivitiesError, AllActivitiesModel>;

typedef EitherMapOrActivitiesError
    = Either<ActivitiesError, Map<String, dynamic>>;

typedef EitherSingleActivityByIdModelOrActivitiesError
    = Either<ActivitiesError, SingleActivityByIdModel>;
typedef EitherActivitiesCreatedModelOrActivitiesError
    = Either<ActivitiesError, ActivityCreationModel>;
typedef EitherReviewsErrorOrReviewsModel = Either<ReviewsError, ReviewsModel>;
typedef EitherReviewsErrorOrReviewPostModel
    = Either<ReviewsError, ReviewPostModel>;

typedef EitherAuthErrorOrOtpRequestedModel = Either<AuthError, OtpRequestModel>;
typedef EitherAuthErrorOrOtpVerificationModel
    = Either<AuthError, OtpVerificationModel>;

typedef EitherAuthErrorOrPasswordReset = Either<AuthError, PasswordResetModel>;
typedef EitherAuthErrorOrMap = Either<AuthError, Map<String, dynamic>>;
typedef EitherChatErrorOrChatModel = Either<ChatError, ChatModel>;
typedef EitherChatErrorOrSentChatModel = Either<ChatError, SentChatModel>;

typedef EitherQuizErrorOrQuizModel = Either<QuizError, QuizModel>;
typedef EitherParticipantErrorOrParticipantModel
    = Either<ParticipantError, ParticipantsModel>;










// typedef EitherFutureTrueOrAuthError = Future<Either<AuthError, bool>>;

// typedef FutureEitherAuthUserOrAuthError
//     = Future<Either<AuthError, AuthUserModel>>;

// typedef FutureEitherLocalAuthUserOrAuthError
//     = Future<Either<AuthError, AuthUserModel>>;
