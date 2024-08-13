import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/validator/validator.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/snackbar.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/auth/bloc/auth_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key, required this.settings});
  final RouteSettings settings;
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool obscureText = false;
  late GlobalKey<FormFieldState> emailKey;
  @override
  void initState() {
    emailKey = GlobalKey<FormFieldState>();
    super.initState();
  }

  String email = '';
  final formKey = GlobalKey<FormState>();

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
        child: Form(
          key: formKey,
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
                  hintText: "Email Address",
                  enabledBorderRadius: 10,
                  key: emailKey,
                  validator: (val) {
                    return Validator.validateEmail(val);
                  },
                  onChanged: (val) {
                    setState(() {
                      email = val ?? "";
                      formKey.currentState?.validate();
                    });
                  }),
              const SizedBox(
                height: 30,
              ),
              const Spacer(),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthStateError) {
                    InfoSnackBar.showErrorSnackBar(
                        context, state.error.errorMessage);
                  }
                  if (state is AuthStateOtpRequestedSuccessfully &&
                      widget.settings.name == Routes.forgotPassword) {
                    Navigator.of(context)
                        .popAndPushNamed(Routes.otpScreen, arguments: email);
                  }
                },
                builder: (context, state) {
                  return state is AuthStateIsLoading
                      ? const LoadingWidget()
                      : PrimaryButton(
                          label: "Submit",
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              context
                                  .read<AuthBloc>()
                                  .add(AuthEventRequestOtp(email: email));
                            }
                          },
                          isEnabled: true);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
