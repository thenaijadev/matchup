import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/snackbar.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/auth/bloc/auth_bloc.dart';
import 'package:matchup/features/auth/data/models/user_data.dart';
import 'package:matchup/features/auth/presentation/widgets/picture_bottom_sheet.dart';

class ProfileImageChoiceScreen extends StatefulWidget {
  const ProfileImageChoiceScreen({super.key, required this.user});
  final UserData user;
  @override
  State<ProfileImageChoiceScreen> createState() =>
      _ProfileImageChoiceScreenState();
}

class _ProfileImageChoiceScreenState extends State<ProfileImageChoiceScreen> {
  int choice = 1;
  bool showGender = false;
  XFile? pickedFile;
  String authToken = "";
  @override
  void initState() {
    logger.e(widget.user.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: Transform.translate(
          offset: const Offset(11, 0),
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
          text: "Add Profile Pictures",
          fontSize: 22,
          fontWeight: FontWeight.bold,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/profiles.png",
              width: 130,
            ),
            const SizedBox(
              height: 25,
            ),
            TextWidget(
              text: "We love a great looking profile, Let’s make one!",
              textAlign: TextAlign.center,
              fontSize: 18,
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    scrollControlDisabledMaxHeightRatio: (1 / 2.5),
                    showDragHandle: true,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    context: context,
                    builder: ((sheetContext) {
                      return PictureBottomSheet(
                        changeImage: (file) {
                          setState(() {
                            pickedFile = file;
                          });
                          Navigator.pop(sheetContext);
                        },
                      );
                    }));
              },
              child: pickedFile == null
                  ? Image.asset(
                      "assets/images/upload.png",
                      width: 150,
                    )
                  : Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .primary, // Set the shadow color to orange
                            offset: const Offset(
                                4, 3), // Offset the shadow to the bottom left
                            blurRadius:
                                3.0, // Adjust blur radius for shadow softness
                            spreadRadius:
                                3.0, // Adjust spread radius for shadow extent
                          ),
                        ],
                        borderRadius: BorderRadius.circular(150),
                        image: DecorationImage(
                          image: FileImage(
                            File(
                              pickedFile!.path,
                            ),
                          ),
                          fit: BoxFit
                              .cover, // Adjust how the image fits the container
                        ),
                      ),
                    ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextWidget(
              text: "Upload your photo here",
              textAlign: TextAlign.center,
              fontSize: 18,
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextWidget(
                text:
                    "Recommended size is 256 x 256px. .png, .jpeg, .gif files up to 8MB.",
                textAlign: TextAlign.center,
                fontSize: 13,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateUserProfileUpdated) {
                  Navigator.pushNamed(context, Routes.sportChoice,
                      arguments: widget.user);
                }
                if (state is AuthStateErrorFileUploadError) {
                  InfoSnackBar.showErrorSnackBar(
                      context, "The image size is too big");
                }
              },
              builder: (context, state) {
                return state is AuthStateIsLoading
                    ? const LoadingWidget()
                    : Opacity(
                        opacity: pickedFile != null ? 1 : .5,
                        child: PrimaryButton(
                            label: "Continue",
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                  AuthEventUpdateProfile(
                                      authToken: widget.user.token ?? "",
                                      userData: widget.user
                                          .copyWith(profileImage: pickedFile)));
                            },
                            isEnabled: pickedFile != null),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
