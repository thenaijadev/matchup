// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/snackbar.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/auth/bloc/auth_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    super.key,
    required this.email,
  });
  final String email;
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
                  border: Border.all(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      width: 2),
                ),
                child: Image.asset(
                  "assets/images/arrow_back_dark.png",
                  color: Theme.of(context).colorScheme.inversePrimary,
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
                  text: "We sent an OTP code via email to ${widget.email}"),
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
                    backgroundColor: Theme.of(context).colorScheme.background,
                    borderColor: Theme.of(context).colorScheme.inverseSurface,
                    enabledBorderColor:
                        Theme.of(context).colorScheme.inverseSurface,
                    focusBorderColor:
                        Theme.of(context).colorScheme.inverseSurface,
                  ),
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 76,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
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
                Opacity(
                  opacity: canResendCode ? 1 : 0.5,
                  child: TextWidget(
                    onTap: () {
                      if (canResendCode) {
                        context
                            .read<AuthBloc>()
                            .add(AuthEventRequestOtp(email: widget.email));
                        resetTimer();
                        startTimer();
                      }
                    },
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    text: "Send Again",
                  ),
                ),
              ],
            ),
            const Spacer(),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateError) {
                  InfoSnackBar.showErrorSnackBar(
                      context, state.error.errorMessage);
                }

                if (state is AuthStateOtpVerificationSuccessfully) {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.newPassword,
                    arguments: state.otpVerificationModel.token,
                  );
                }
              },
              builder: (context, state) {
                return state is AuthStateIsLoading
                    ? const LoadingWidget()
                    : PrimaryButton(
                        label: "Submit",
                        onPressed: () {
                          context.read<AuthBloc>().add(AuthEventVerifyOtp(
                              otp: otp, email: widget.email));
                        },
                        isEnabled: true);
              },
            )
          ],
        ),
      ),
    );
  }
}
