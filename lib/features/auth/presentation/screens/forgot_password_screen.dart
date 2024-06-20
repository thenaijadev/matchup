import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: Transform.translate(
          offset: const Offset(15, 0),
          child: Transform.scale(
            scale: 0.7,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: const Color(0xff282828), width: 2),
                ),
                child: Image.asset(
                  "assets/images/arrow_back_dark.png",
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: TextWidget(
          text: "Forgot Password",
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: TextWidget(
                  textAlign: TextAlign.center,
                  color: Theme.of(context).colorScheme.secondary,
                  text:
                      "Enter your email address or phone number to send the OTP code"),
            ),
            InputFieldWidget(
                hintSize: 12,
                hintColor: Theme.of(context).colorScheme.inversePrimary,
                hintText: "Email Address or Phone Number",
                enabledBorderRadius: 10,
                onChanged: (val) {}),
            const SizedBox(
              height: 30,
            ),
            const Spacer(),
            PrimaryButton(
                label: "Submit",
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.otpScreen);
                },
                isEnabled: true)
          ],
        ),
      ),
    );
  }
}
