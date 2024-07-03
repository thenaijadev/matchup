import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class CreateTeamScreen extends StatelessWidget {
  const CreateTeamScreen({super.key});

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
                onChanged: (val) {}),
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
                hintText: "Enter the name of your team",
                enabledBorderRadius: 10,
                onChanged: (val) {}),
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
                      CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.inverseSurface,
                        radius: 30,
                        child: Image.asset(
                          "assets/images/photo_icon.png",
                          color: Theme.of(context).colorScheme.inversePrimary,
                          width: 28,
                        ),
                      ),
                      TextWidget(
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
                onPressed: () {
                  Navigator.pushNamed(context, Routes.addTeamMembers);
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
