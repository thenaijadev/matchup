import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/snackbar.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/auth/bloc/auth_bloc.dart';
import 'package:matchup/features/auth/data/models/user_data.dart';

class GenderChoiceScreen extends StatefulWidget {
  const GenderChoiceScreen({super.key, required this.user});
  final UserData user;
  @override
  State<GenderChoiceScreen> createState() => _GenderChoiceScreenState();
}

class _GenderChoiceScreenState extends State<GenderChoiceScreen> {
  int choice = 1;
  bool showGender = false;
  String gender = "Male";
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
          text: "Set up your account",
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
                      "To give you the best experience possible, we’d like to know a little about you."),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  choice = 1;
                  gender = "Male";
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5)
                    .copyWith(right: 8),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.inverseSurface,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Male",
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    Radio<int>(
                        value: 1,
                        groupValue: choice,
                        onChanged: (val) {
                          setState(() {
                            choice = 1;
                            gender = "Male";
                          });
                        })
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  choice = 2;
                  gender = "Female";
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5)
                    .copyWith(right: 8),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.inverseSurface,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Female",
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    Radio<int>(
                        value: 2,
                        groupValue: choice,
                        onChanged: (val) {
                          setState(() {
                            choice = 2;
                            gender = "Female";
                          });
                        })
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  choice = 3;
                  gender = "Other";
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5)
                    .copyWith(right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.background,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.inverseSurface,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Other",
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    Radio<int>(
                        value: 3,
                        groupValue: choice,
                        onChanged: (val) {
                          setState(() {
                            choice = val!;
                            gender = "Other";
                          });
                        })
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 0.8,
                  child: Checkbox(
                      value: showGender,
                      // activeColor: Theme.of(context).colorScheme.secondary,
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                      onChanged: (val) {
                        setState(() {
                          showGender = val!;
                        });
                      }),
                ),
                TextWidget(
                  text: "Show your gender on your profile",
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.secondary,
                )
              ],
            ),
            const Spacer(),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateError) {
                  InfoSnackBar.showErrorSnackBar(
                      context, state.error.errorMessage);
                }
                if (state is AuthStateUserIsRegistered) {
                  Navigator.pushNamed(context, Routes.locationSearch,
                      arguments: {
                        "userData": widget.user,
                        "authUser": state.user
                      });
                }
              },
              builder: (context, state) {
                return state is AuthStateIsLoading
                    ? const LoadingWidget()
                    : PrimaryButton(
                        label: "Continue",
                        onPressed: () {
                          final userData = widget.user
                              .copyWith(gender: gender, showGender: showGender);
                          context
                              .read<AuthBloc>()
                              .add(AuthEventRegisterUser(userData: userData));
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
