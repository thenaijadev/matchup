import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/error_screen.dart';
import 'package:matchup/features/auth/presentation/screens/create_account_screen.dart';
import 'package:matchup/features/auth/presentation/screens/date_of_birth_screen.dart';
import 'package:matchup/features/auth/presentation/screens/gender_screen.dart';
import 'package:matchup/features/auth/presentation/screens/location_search_screen.dart';
import 'package:matchup/features/auth/presentation/screens/profile_image_choice.dart';
import 'package:matchup/features/onboarding/screens/onboarding_screen.dart';
import 'package:matchup/features/onboarding/screens/splash_screen.dart';

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
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
