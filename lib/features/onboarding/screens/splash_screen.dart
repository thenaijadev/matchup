import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/config/dark_mode/presentation/bloc/dark_mode_bloc.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(
        context,
        Routes.onboardingScreen,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = View.of(context).platformDispatcher.platformBrightness;
    return BlocBuilder<DarkModeBloc, DarkModeState>(
      builder: (context, state) {
        return state is DarkModeCurrentState
            ? AnimatedContainer(
                duration: const Duration(seconds: 2),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: brightness == Brightness.dark
                      ? AppColors.splashBackgroundDark
                      : AppColors.appBackgroundLight,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/splash_background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    brightness == Brightness.dark
                        ? Image.asset(
                            "assets/images/splash_dark.png",
                            width: 100,
                          )
                        : Image.asset(
                            "assets/images/splash_light.png",
                            width: 100,
                          )
                  ],
                )),
              )
            : const SizedBox();
      },
    );
  }
}
