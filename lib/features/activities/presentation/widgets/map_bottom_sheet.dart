import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class MapScreenBottomSheet extends StatelessWidget {
  const MapScreenBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = View.of(context).platformDispatcher.platformBrightness;
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
            text: "Regissay games.",
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(
            height: 50,
          ),
          PrimaryButton(
              label: "Create Account",
              onPressed: () {
                Navigator.pushNamed(context, Routes.createAccount);
              },
              isEnabled: true),
          const SizedBox(
            height: 30,
          ),
          PrimaryButton(
              isOutlined: true,
              label: "Login",
              onPressed: () {
                Navigator.pushNamed(context, Routes.login);
              },
              isEnabled: true)
        ],
      ),
    );
  }
}
