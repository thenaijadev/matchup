import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/error_screen.dart';
import 'package:matchup/features/activities/presentation/screens/activities_list._screen.dart';
import 'package:matchup/features/activities/presentation/screens/activity_description_screen.dart';
import 'package:matchup/features/activities/presentation/screens/create_new_activity_screen.dart';
import 'package:matchup/features/auth/presentation/screens/create_account_screen.dart';
import 'package:matchup/features/auth/presentation/screens/date_of_birth_screen.dart';
import 'package:matchup/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:matchup/features/auth/presentation/screens/gender_screen.dart';
import 'package:matchup/features/auth/presentation/screens/location_search_screen.dart';
import 'package:matchup/features/auth/presentation/screens/login_screen.dart';
import 'package:matchup/features/auth/presentation/screens/new_password_screen.dart';
import 'package:matchup/features/auth/presentation/screens/otp_screen.dart';
import 'package:matchup/features/auth/presentation/screens/profile_image_choice.dart';
import 'package:matchup/features/chat/presentation/screens/chat_screen.dart';
import 'package:matchup/features/get_directions/presentation/screens/get_directions_screen.dart';
import 'package:matchup/features/home/presentation/screens/home_screen.dart';
import 'package:matchup/features/onboarding/screens/onboarding_screen.dart';
import 'package:matchup/features/onboarding/screens/splash_screen.dart';
import 'package:matchup/features/profile/presentation/screens/choose_sport_level_screen.dart';
import 'package:matchup/features/profile/presentation/screens/sport_choice_screen.dart';
import 'package:matchup/features/teams/presentation/screens/add_team_members_screen.dart';
import 'package:matchup/features/teams/presentation/screens/create_team_screen.dart';
import 'package:matchup/features/teams/presentation/screens/my_team_screen.dart';
import 'package:matchup/features/teams/presentation/screens/pay_to_join_team.dart';

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
        return MaterialPageRoute(
          builder: (_) => const DateOfBirthScreen(),
        );
      case Routes.genderChoice:
        return MaterialPageRoute(
          builder: (_) => const GenderChoiceScreen(),
        );
      case Routes.locationSearch:
        return MaterialPageRoute(
          builder: (_) => const LocationSearchScreen(),
        );
      case Routes.addProfileImage:
        return MaterialPageRoute(
          builder: (_) => const ProfileImageChoiceScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );

      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => const OTPScreen(),
        );
      case Routes.newPassword:
        return MaterialPageRoute(
          builder: (_) => const NewPasswordScreen(),
        );

      case Routes.sportChoice:
        return MaterialPageRoute(
          builder: (_) => const SportChoiceScreen(),
        );

      case Routes.chooseSportLevel:
        List<Map<String, String>> selectedItems =
            routeSettings.arguments as List<Map<String, String>>;
        return MaterialPageRoute(
          builder: (_) => ChooseSportLevelScreen(
            sports: selectedItems,
          ),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.chat:
        return MaterialPageRoute(
          builder: (_) => const ChatScreen(),
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

      case Routes.getDirections:
        return MaterialPageRoute(
          builder: (_) => const GetDirectionScreen(),
        );

      case Routes.createTeam:
        return MaterialPageRoute(
          builder: (_) => const CreateTeamScreen(),
        );
      case Routes.addTeamMembers:
        return MaterialPageRoute(
          builder: (_) => const AddTeamMembersScreen(),
        );
      case Routes.payToJoinTeam:
        return MaterialPageRoute(
          builder: (_) => const PayToJoinTeam(),
        );

      case Routes.myTeam:
        return MaterialPageRoute(
          builder: (_) => const MyTeamScreen(),
        );
      // case Routes.setLocation:
      //   return MaterialPageRoute(
      //     builder: (_) => const SetLoactionScreen(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
