import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/auth/presentation/widgets/picture_bottom_sheet.dart';

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({super.key});

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  String? teamName;
  String? teamSlogan;
  XFile? pickedFile;
  void pickFile({required String source}) async {
    if (source == "Gallery") {
      final picker = ImagePicker();

      pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {});
    } else {
      final picker = ImagePicker();

      pickedFile = await picker.pickImage(source: ImageSource.camera);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
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
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextWidget(
            text: "Create a team",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: "Team name",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 10,
            ),
            InputFieldWidget(
                hintColor: Theme.of(context).colorScheme.secondary,
                hintText: "Enter the name of your team",
                enabledBorderRadius: 10,
                onChanged: (val) {
                  setState(() {
                    teamName = val;
                  });
                }),
            TextWidget(
              text: "You can change this later in the team settings.",
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              height: 30,
            ),
            TextWidget(
              text: "Team slogan",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 10,
            ),
            InputFieldWidget(
                hintColor: Theme.of(context).colorScheme.secondary,
                hintText: "Enter your team slogan",
                enabledBorderRadius: 10,
                onChanged: (val) {
                  setState(() {
                    teamSlogan = val;
                  });
                }),
            const SizedBox(
              height: 30,
            ),
            TextWidget(
              text: "Upload logo",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      pickedFile == null
                          ? CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.inverseSurface,
                              radius: 30,
                              child: Image.asset(
                                "assets/images/photo_icon.png",
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                width: 28,
                              ),
                            )
                          : Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
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
                      const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              scrollControlDisabledMaxHeightRatio: (1 / 2.5),
                              showDragHandle: true,
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
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
                        text: "Click to upload Logo",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        textDecoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      TextWidget(
                        text: "or",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      TextWidget(
                        textAlign: TextAlign.center,
                        text:
                            "drag and drop SVG, PNG, JPG or GIF (max 800 x 400 px)",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Spacer(),
            PrimaryButton(
                label: "Next",
                onPressed: () async {
                  final details = {
                    "name": teamName,
                    "slogan": teamSlogan,
                    "badge": await MultipartFile.fromFile(
                      pickedFile?.path ?? "",
                      filename: pickedFile?.path.split('/').last,
                    ),
                  };
                  Navigator.pushNamed(context, Routes.addTeamMembers,
                      arguments: details);
                },
                isEnabled: true),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TextWidget(
                text: "Skip for now",
                textAlign: TextAlign.center,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
