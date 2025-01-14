import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/error_screen.dart';
import 'package:matchup/features/activities/data/models/activities/activities_model.dart';
import 'package:matchup/features/activities/presentation/screens/activities_list_screen.dart';
import 'package:matchup/features/activities/presentation/screens/activity_description_screen.dart';
import 'package:matchup/features/activities/presentation/screens/create_new_activity_screen.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/auth/data/models/user_data.dart';
import 'package:matchup/features/auth/presentation/screens/create_account_screen.dart';
import 'package:matchup/features/auth/presentation/screens/date_of_birth_screen.dart';
import 'package:matchup/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:matchup/features/auth/presentation/screens/gender_screen.dart';
import 'package:matchup/features/auth/presentation/screens/location_search_screen.dart';
import 'package:matchup/features/auth/presentation/screens/login_screen.dart';
import 'package:matchup/features/auth/presentation/screens/new_password_screen.dart';
import 'package:matchup/features/auth/presentation/screens/otp_screen.dart';
import 'package:matchup/features/auth/presentation/screens/profile_image_choice.dart';
import 'package:matchup/features/chat/data/models/participants_model.dart';
import 'package:matchup/features/chat/presentation/screens/chat_screen.dart';
import 'package:matchup/features/friend_request_invitation/invitation_list_screen.dart';
import 'package:matchup/features/get_directions/presentation/screens/get_directions_screen.dart';
import 'package:matchup/features/home/presentation/screens/home_screen.dart';
import 'package:matchup/features/location/presetation/screens/create_location.dart';
import 'package:matchup/features/location/presetation/screens/edit_location_screen.dart';
import 'package:matchup/features/location/presetation/screens/location_screen.dart';
import 'package:matchup/features/onboarding/screens/onboarding_screen.dart';
import 'package:matchup/features/onboarding/screens/splash_screen.dart';
import 'package:matchup/features/privacy/privacy_screen.dart';
import 'package:matchup/features/profile/data/models/data_transfer_model.dart';
import 'package:matchup/features/profile/presentation/screens/choose_sport_level_screen.dart';
import 'package:matchup/features/profile/presentation/screens/sport_choice_screen.dart';
import 'package:matchup/features/quiz/presentation/screens/quiz_screen.dart';
import 'package:matchup/features/security/presentation/account_security_screen.dart';
import 'package:matchup/features/security/presentation/passcode_lock_screen.dart';
import 'package:matchup/features/sports/presentation/screens/sports_screen.dart';
import 'package:matchup/features/teams/data/models/team_creation_model.dart';
import 'package:matchup/features/teams/presentation/screens/add_team_members_screen.dart';
import 'package:matchup/features/teams/presentation/screens/create_team_screen.dart';
import 'package:matchup/features/teams/presentation/screens/my_team_screen.dart';
import 'package:matchup/features/teams/presentation/screens/pay_to_join_team.dart';
import 'package:matchup/features/teams/presentation/screens/team_list_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.createAccount:
        return MaterialPageRoute(
          builder: (_) => const CreateAccountScreen(),
        );
      case Routes.dateOfBirth:
        AuthUser user = routeSettings.arguments as AuthUser;
        return MaterialPageRoute(
          builder: (_) => DateOfBirthScreen(user: user),
        );
      case Routes.genderChoice:
        List data = routeSettings.arguments as List;

        return MaterialPageRoute(
          builder: (_) => GenderChoiceScreen(
            data: data,
          ),
        );
      case Routes.locationSearch:
        UserData user = routeSettings.arguments as UserData;

        return MaterialPageRoute(
          builder: (_) => LocationSearchScreen(
            user: user,
          ),
        );
      case Routes.addProfileImage:
        UserData user = routeSettings.arguments as UserData;

        return MaterialPageRoute(
          builder: (_) => ProfileImageChoiceScreen(
            user: user,
          ),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordScreen(
            settings: routeSettings,
          ),
        );

      case Routes.otpScreen:
        String email = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => OTPScreen(
            email: email,
          ),
        );
      case Routes.newPassword:
        String token = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => NewPasswordScreen(token: token),
        );

      case Routes.sportChoice:
        UserData user = routeSettings.arguments as UserData;
        return MaterialPageRoute(
          builder: (_) => SportChoiceScreen(user: user),
        );

      case Routes.chooseSportLevel:
        DataTransferModel data = routeSettings.arguments as DataTransferModel;
        return MaterialPageRoute(
          builder: (_) => ChooseSportLevelScreen(
            data: data,
          ),
        );

      case Routes.home:
        AuthUser user = routeSettings.arguments as AuthUser;

        return MaterialPageRoute(
          builder: (_) => HomeScreen(user: user),
        );

      case Routes.chat:
        final Participants participant =
            routeSettings.arguments as Participants;
        return MaterialPageRoute(
          builder: (_) => ChatScreen(participants: participant),
        );
      case Routes.createActivity:
        return MaterialPageRoute(
          builder: (_) => const CreateNewActivityScreen(),
        );
      case Routes.activityDescripiton:
        return MaterialPageRoute(
          builder: (_) => const ActivityDescripitonScreen(),
        );
      case Routes.activities:
        return MaterialPageRoute(
          builder: (_) => const ActivitiesListScreen(),
        );

      case Routes.quiz:
        return MaterialPageRoute(
          builder: (_) => const QuizScreen(),
        );
      case Routes.getDirections:
        Activities activity = routeSettings.arguments as Activities;
        return MaterialPageRoute(
          builder: (_) => GetDirectionScreen(
            activity: activity,
          ),
        );

      case Routes.createTeam:
        return MaterialPageRoute(
          builder: (_) => const CreateTeamScreen(),
        );
      case Routes.addTeamMembers:
        var details = routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => AddTeamMembersScreen(
            details: details,
          ),
        );
      case Routes.payToJoinTeam:
        var details = routeSettings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (_) => PayToJoinTeam(
            details: details,
          ),
        );

      case Routes.myTeam:
        TeamCreationModel team = routeSettings.arguments as TeamCreationModel;
        return MaterialPageRoute(
          builder: (_) => MyTeamScreen(
            teamModel: team,
          ),
        );

      case Routes.location:
        return MaterialPageRoute(
          builder: (_) => const LocationScreen(),
        );

      case Routes.editLocation:
        return MaterialPageRoute(
          builder: (_) => const EditLocationScreen(),
        );
      case Routes.createLocation:
        return MaterialPageRoute(
          builder: (_) => const CreateLocationScreen(),
        );

      case Routes.mySports:
        return MaterialPageRoute(
          builder: (_) => const MySportsListScreen(),
        );

      case Routes.teamList:
        return MaterialPageRoute(
          builder: (_) => const TeamListScreen(),
        );

      case Routes.security:
        return MaterialPageRoute(
          builder: (_) => const AccountSecurityScreen(),
        );

      case Routes.pinLock:
        return MaterialPageRoute(
          builder: (_) => const PasscodeLockScreen(),
        );
      case Routes.privacy:
        return MaterialPageRoute(
          builder: (_) => const PrivacyScreen(),
        );
      case Routes.invititionListScreen:
        return MaterialPageRoute(
          builder: (_) => const InvitationListScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
