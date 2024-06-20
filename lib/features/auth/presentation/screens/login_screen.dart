import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          text: "Sign into account",
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
            InputFieldWidget(
                hintSize: 12,
                hintColor: Theme.of(context).colorScheme.inversePrimary,
                hintText: "Email Address",
                enabledBorderRadius: 10,
                onChanged: (val) {}),
            InputFieldWidget(
                hintColor: Theme.of(context).colorScheme.inversePrimary,
                hintText: "Password",
                hintSize: 12,
                obscureText: obscureText,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    size: 17,
                    obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                enabledBorderRadius: 10,
                onChanged: (val) {}),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.createAccount);
                  },
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Don't have and account?   ",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "satoshi",
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "satoshi",
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                TextWidget(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.forgotPassword);
                  },
                  text: "Forgot Password?",
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                )
              ],
            ),
            const Spacer(),
            PrimaryButton(
                label: "Sign In",
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.dateOfBirth);
                },
                isEnabled: true)
          ],
        ),
      ),
    );
  }
}
