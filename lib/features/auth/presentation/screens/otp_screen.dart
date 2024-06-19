import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool canResendCode = false;
  String otp = '';

  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 60);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();

    setState(() {
      myDuration = const Duration(seconds: 60);
      canResendCode = false;
    });
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        canResendCode = true;
        stopTimer();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();

    super.initState();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
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
          text: "Otp Code",
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: TextWidget(
                  textAlign: TextAlign.center,
                  color: Theme.of(context).colorScheme.secondary,
                  text: "We sent an OTP code via email to iamrapha3l@mail.com"),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: OTPTextField(
                  obscureText: true,
                  spaceBetween: MediaQuery.of(context).size.width * .01,
                  otpFieldStyle: OtpFieldStyle(
                    borderColor: const Color(0xff282828),
                    enabledBorderColor: const Color(0xff282828),
                    focusBorderColor: const Color(0xff282828),
                  ),
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 76,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textFieldAlignment: MainAxisAlignment.spaceEvenly,
                  fieldStyle: FieldStyle.box,
                  onChanged: (val) {
                    otp = val;
                    debugPrint(val);
                    setState(() {});
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: "Wait For ${seconds}s",
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  width: 5,
                ),
                TextWidget(
                  onTap: () {
                    if (canResendCode) {
                      resetTimer();
                      startTimer();
                    }
                  },
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  text: "Send Again",
                ),
              ],
            ),
            const Spacer(),
            PrimaryButton(
                label: "Submit",
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.newPassword);
                },
                isEnabled: true)
          ],
        ),
      ),
    );
  }
}