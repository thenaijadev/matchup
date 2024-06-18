import 'package:flutter/material.dart';
import 'package:matchup/core/constants/app_colors.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(
          seconds: 5,
        ),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding_one.png'),
            fit: BoxFit.cover,
          ),
        ),
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
                    fontFamily: "splash", fontSize: 60, color: Colors.white),
              ),
              const Text(
                "Play Games",
                style: TextStyle(
                    fontFamily: "splash", fontSize: 60, color: Colors.white),
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
                      backgroundColor: Theme.of(context).colorScheme.background,
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
              const Center(
                child: TextWidget(
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
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidget(
            text: "Get Started",
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(
            height: 5,
          ),
          TextWidget(
            text:
                "Register to get started using matchup to connect and play games.",
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(
            height: 50,
          ),
          PrimaryButton(
              label: "Create Account", onPressed: () {}, isEnabled: true),
          const SizedBox(
            height: 30,
          ),
          PrimaryButton(
              isOutlined: true,
              label: "Login",
              onPressed: () {},
              isEnabled: true)
        ],
      ),
    );
  }
}
