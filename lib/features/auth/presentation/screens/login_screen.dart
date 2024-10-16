import 'dart:convert';

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
import 'package:matchup/features/auth/data/models/user_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = false;
  String email = '';

  String password = '';
  late GlobalKey<FormFieldState> passwordKey;
  late GlobalKey<FormFieldState> emailKey;

  @override
  void initState() {
    passwordKey = GlobalKey<FormFieldState>();
    emailKey = GlobalKey<FormFieldState>();

    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        // leading: Transform.translate(
        //   offset: const Offset(15, 0),
        //   child: Transform.scale(
        //     scale: 0.7,
        //     child: GestureDetector(
        //       onTap: () => Navigator.pop(context),
        //       child: Container(
        //         padding: const EdgeInsets.all(15),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(100),
        //           border: Border.all(
        //               color: Theme.of(context).colorScheme.inverseSurface,
        //               width: 2),
        //         ),
        //         child: Image.asset(
        //           "assets/images/arrow_back_dark.png",
        //           color: Theme.of(context).colorScheme.inversePrimary,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
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
        child: Form(
          key: formKey,
          child: Column(
            children: [
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
                    });
                  }),
              InputFieldWidget(
                  hintColor: Theme.of(context).colorScheme.inversePrimary,
                  hintText: "Password",
                  hintSize: 12,
                  obscureText: obscureText,
                  key: passwordKey,
                  validator: (val) {
                    return Validator.validatePassword(val);
                  },
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
                  onChanged: (val) {
                    setState(() {
                      password = val ?? "";
                    });
                  }),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.createAccount);
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
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthStateError) {
                    InfoSnackBar.showErrorSnackBar(context,
                        jsonDecode(state.error.errorMessage)["message"]);
                    // logger.e(jsonDecode(state.error.errorMessage)["message"]);
                  }
                  if (state is AuthStateIsLoggedIn) {
                    Navigator.of(context).popAndPushNamed(
                      Routes.home,
                      arguments: state.user,
                    );
                  }
                },
                builder: (context, state) {
                  return state is AuthStateIsLoading
                      ? const LoadingWidget()
                      : PrimaryButton(
                          label: "Sign In",
                          onPressed: () {
                            final user =
                                UserData(email: email, password: password);
                            final bool formIsValid =
                                formKey.currentState?.validate() ?? false;
                            if (formIsValid) {
                              context
                                  .read<AuthBloc>()
                                  .add(AuthEventLoginUser(userData: user));
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
