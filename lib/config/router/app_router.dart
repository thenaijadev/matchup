import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/error_screen.dart';
import 'package:matchup/features/auth/presentation/screens/create_account_screen.dart';
import 'package:matchup/features/auth/presentation/screens/date_of_birth_screen.dart';
import 'package:matchup/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:matchup/features/auth/presentation/screens/gender_screen.dart';
import 'package:matchup/features/auth/presentation/screens/location_search_screen.dart';
import 'package:matchup/features/auth/presentation/screens/login_screen.dart';
import 'package:matchup/features/auth/presentation/screens/new_password_screen.dart';
import 'package:matchup/features/auth/presentation/screens/otp_screen.dart';
import 'package:matchup/features/auth/presentation/screens/profile_image_choice.dart';
import 'package:matchup/features/onboarding/screens/onboarding_screen.dart';
import 'package:matchup/features/onboarding/screens/splash_screen.dart';
import 'package:matchup/features/profile/presentation/screens/choose_sport_level_screen.dart';
import 'package:matchup/features/profile/presentation/screens/sport_choice_screen.dart';

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
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
