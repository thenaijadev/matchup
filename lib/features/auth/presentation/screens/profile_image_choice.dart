import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class ProfileImageChoiceScreen extends StatefulWidget {
  const ProfileImageChoiceScreen({super.key});

  @override
  State<ProfileImageChoiceScreen> createState() =>
      _ProfileImageChoiceScreenState();
}

class _ProfileImageChoiceScreenState extends State<ProfileImageChoiceScreen> {
  int choice = 1;
  bool showGender = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
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
          text: "Add Profile Pictures",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                    backgroundColor: Theme.of(context).colorScheme.background,
                    context: context,
                    builder: ((context) {
                      return const PictureBottomSheet();
                    }));
              },
              child: Image.asset(
                "assets/images/upload.png",
                width: 150,
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
            Opacity(
              opacity: .5,
              child: PrimaryButton(
                  label: "Continue",
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.dateOfBirth);
                  },
                  isEnabled: true),
            )
          ],
        ),
      ),
    );
  }
}

class PictureBottomSheet extends StatefulWidget {
  const PictureBottomSheet({super.key});

  @override
  State<PictureBottomSheet> createState() => _PictureBottomSheetState();
}

class _PictureBottomSheetState extends State<PictureBottomSheet> {
  int chosenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    chosenIndex = 0;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: chosenIndex == 0
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent),
                    color: const Color(0xff232323),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    "assets/images/photo.png",
                    width: 80,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: "Your Photos",
                textAlign: TextAlign.center,
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    chosenIndex = 1;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: const Color(0xff232323),
                    border: Border.all(
                        width: 1,
                        color: chosenIndex == 1
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    "assets/images/camera.png",
                    width: 80,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: "Your Photos",
                textAlign: TextAlign.center,
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
