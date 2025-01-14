import 'package:country_picker/country_picker.dart';
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
import 'package:matchup/features/auth/presentation/widgets/change_country.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool obscureText = false;
  String? countryFlag = "🇳🇬";
  String? countryCode = "234";

  String? fullName = '';
  String? email = '';
  String? phoneNumber = '';
  String? password = '';
  String? confirmPassword = "";
  bool acceptTerms = false;
  UserData? user;
  bool formIsValid = false;

  late GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();
  late GlobalKey<FormFieldState> confirmPasswordKey;
  late GlobalKey<FormFieldState> emailKey;
  late GlobalKey<FormFieldState> phoneNumKey;
  late GlobalKey<FormFieldState> fullNameKey;

  @override
  void initState() {
    emailKey = GlobalKey<FormFieldState>();
    confirmPasswordKey = GlobalKey<FormFieldState>();
    phoneNumKey = GlobalKey<FormFieldState>();
    fullNameKey = GlobalKey<FormFieldState>();

    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          text: "Set up your account",
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20),
                    child: TextWidget(
                        textAlign: TextAlign.center,
                        color: Theme.of(context).colorScheme.secondary,
                        text:
                            "Please complete all information to create your account on matchup."),
                  ),
                  InputFieldWidget(
                      hintColor: Theme.of(context).colorScheme.inversePrimary,
                      hintText: "Full Name",
                      hintSize: 12,
                      key: fullNameKey,
                      validator: (val) {
                        return Validator.validateText(val, "Full name");
                      },
                      enabledBorderRadius: 10,
                      onChanged: (val) {
                        setState(() {
                          fullName = val;
                        });
                      }),
                  InputFieldWidget(
                      hintSize: 12,
                      hintColor: Theme.of(context).colorScheme.inversePrimary,
                      hintText: "Email Address",
                      key: emailKey,
                      enabledBorderRadius: 10,
                      validator: (val) {
                        return Validator.validateEmail(
                          val,
                        );
                      },
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      }),
                  InputFieldWidget(
                    enabledBorderRadius: 10,
                    key: phoneNumKey,
                    validator: (val) {
                      return Validator.validatePhoneNumber(
                        val ?? "",
                      );
                    },
                    hintColor: Theme.of(context).colorScheme.inversePrimary,
                    initialValue: "",
                    prefixicon: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                changeCountry(context, (Country country) {
                                  setState(() {
                                    countryFlag = country.flagEmoji;
                                    countryCode = country.phoneCode;
                                  });
                                });
                              },
                              child: Row(
                                children: [
                                  TextWidget(
                                    text: '$countryFlag',
                                    fontSize: 20,
                                  ),
                                  TextWidget(
                                    text: '  +$countryCode',
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                ],
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          Transform.scale(
                            scale: 0.4,
                            child: Image.asset("assets/images/line_vert.png",
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    hintText: "",
                    keyboardType: TextInputType.number,
                    hintSize: 20,
                    onChanged: (val) {
                      setState(() {
                        setState(() {
                          phoneNumber = val;
                        });
                      });
                    },
                  ),
                  InputFieldWidget(
                      hintColor: Theme.of(context).colorScheme.inversePrimary,
                      hintText: "Password",
                      obscureText: obscureText,
                      hintSize: 12,
                      key: passwordKey,
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
                      validator: (val) {
                        return Validator.validatePassword(val);
                      },
                      onChanged: (val) {
                        passwordKey.currentState?.validate();

                        setState(() {
                          password = val;
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
                        confirmPassword = val;
                      }),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: Checkbox(
                            value: acceptTerms,
                            // activeColor: Theme.of(context).colorScheme.secondary,
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary),
                            onChanged: (val) {
                              setState(() {
                                acceptTerms = val ?? false;
                              });
                            }),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'I Agree to the ',
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: "satoshi",
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms of Use',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "satoshi",
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: "satoshi",
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "satoshi",
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthStateError) {
                        InfoSnackBar.showErrorSnackBar(
                            context, state.error.errorMessage);
                      }
                      if (state is AuthStateUserIsRegistered) {
                        Navigator.of(context).pushNamed(Routes.dateOfBirth,
                            arguments: state.user);
                      }
                    },
                    builder: (context, state) {
                      return state is AuthStateIsLoading
                          ? const LoadingWidget()
                          : PrimaryButton(
                              label: "Continue",
                              onPressed: () {
                                user = UserData(
                                  confirmPassword: confirmPassword ?? "",
                                  password: password ?? "",
                                  email: email ?? "",
                                  fullName: fullName ?? "",
                                  countryCode: countryCode ?? "",
                                  phoneNumber: phoneNumber ?? "",
                                );

                                // formIsValid =
                                //     Validator.validateForm(user!, context);
                                if (!acceptTerms) {
                                  InfoSnackBar.showErrorSnackBar(context,
                                      "You have to accept the Terms of Use and Privacy Policy to proceed.");
                                }
                                final bool isValid =
                                    formKey.currentState?.validate() ?? false;
                                if (isValid && acceptTerms) {
                                  context.read<AuthBloc>().add(
                                      AuthEventRegisterUser(userData: user!));
                                }
                              },
                              isEnabled: true);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String formatPhoneNumber(String number, String countryCode) {
  return "+$countryCode-${number.substring(1, 4)}-${number.substring(4, 7)}-${number.substring(7, number.length)}";
}
