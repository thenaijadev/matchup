import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/constants/app_colors.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/onboarding/widgets/bottom_screen_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int imgIndex = 0;
  int page = 0;
  final PageController _pageController = PageController();
  @override
  void initState() {
    setState(() {
      Timer.periodic(const Duration(seconds: 5), (timer) {
        page = (page + 1) % 3;

        _pageController.animateToPage(page,
            duration: const Duration(milliseconds: 1000), curve: Curves.linear);
      });
    });

    super.initState();
  }

  List<String> image = [
    'assets/images/onboarding_one.png',
    'assets/images/onboarding_image_2.png',
    'assets/images/onboarding_image_3.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              controller: _pageController,
              children: List.generate(
                  image.length,
                  (index) => Transform.scale(
                      scale: 1.1, child: Image.asset(image[index])))),
          AnimatedContainer(
            duration: const Duration(
              seconds: 5,
            ),
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Spacer(),
                  const Spacer(),
                  const Spacer(),
                  const Spacer(),
                  const Text(
                    "Connect",
                    style: TextStyle(
                        fontFamily: "splash",
                        fontSize: 60,
                        color: Colors.white),
                  ),
                  const Text(
                    "Play Games",
                    style: TextStyle(
                        fontFamily: "splash",
                        fontSize: 60,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Discover Talents.",
                    style: TextStyle(
                        fontFamily: "splash",
                        fontSize: 60,
                        color: AppColors.primary),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    label: "Get started",
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          scrollControlDisabledMaxHeightRatio: (1 / 2.5),
                          showDragHandle: true,
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          context: context,
                          builder: ((context) {
                            return const BottomSheetWidget();
                          }));
                    },
                    isEnabled: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextWidget(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.login);
                      },
                      text: "I already have an account",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
