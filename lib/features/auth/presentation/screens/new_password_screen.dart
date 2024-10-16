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

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key, required this.token});
  final String token;
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool obscureText = false;
  final formKey = GlobalKey<FormState>();
  late GlobalKey<FormFieldState> passwordKey;
  late GlobalKey<FormFieldState> confirmPasswordKey;

  @override
  void initState() {
    passwordKey = GlobalKey<FormFieldState>();
    confirmPasswordKey = GlobalKey<FormFieldState>();

    super.initState();
  }

  String password = "";
  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
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
                    text: "Enter your new password to update your password"),
              ),
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
                      formKey.currentState?.validate();
                    });
                  }),
              InputFieldWidget(
                  validator: (val) {
                    return Validator.validateConfirmPassword(
                        firstPassword: password ?? "", value: val);
                  },
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
                  hintColor: Theme.of(context).colorScheme.inversePrimary,
                  hintText: "Confirm Password",
                  hintSize: 12,
                  enabledBorderRadius: 10,
                  onChanged: (val) {
                    confirmPassword = val!;
                    formKey.currentState?.validate();
                  }),
              const SizedBox(
                height: 30,
              ),
              const Spacer(),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthStatePasswordChanged) {
                    Navigator.pushNamed(context, Routes.login);
                  }

                  if (state is AuthStateError) {
                    InfoSnackBar.showErrorSnackBar(
                        context, state.error.errorMessage);
                  }
                },
                builder: (context, state) {
                  return state is AuthStateIsLoading
                      ? const LoadingWidget()
                      : PrimaryButton(
                          label: "Submit",
                          onPressed: () {
                            final formIsValid =
                                formKey.currentState?.validate();
                            if (formIsValid ?? false) {
                              context.read<AuthBloc>().add(
                                  AuthEventChangePassord(
                                      token: widget.token,
                                      confirmPassword: confirmPassword,
                                      password: password));
                            }
                            // Navigator.of(context).pushNamed(Routes.login);
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
