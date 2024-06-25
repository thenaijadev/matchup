import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/horizontal_divider.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class LocationSearchScreen extends StatefulWidget {
  const LocationSearchScreen({super.key});

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
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
          text: "What's your Location?",
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            InputFieldWidget(
                hintColor: Theme.of(context).colorScheme.secondary,
                hintText: "Search location",
                prefixicon: Icon(
                  CupertinoIcons.search,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                hintSize: 12,
                onChanged: (val) {}),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/target.png",
                    width: 18,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextWidget(
                      textAlign: TextAlign.center,
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 12,
                      text: "Use my current location"),
                ],
              ),
            ),
            const HorizontalDivider(
              thickness: 0.2,
              paddingVertical: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                    textAlign: TextAlign.center,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 12,
                    text: "Search Results"),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/pin.png",
                      width: 14,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextWidget(
                        textAlign: TextAlign.center,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 12,
                        text: "75, ST Palmer Avenue, Enugu"),
                  ],
                )
              ],
            ),
            const Spacer(),
            PrimaryButton(
                label: "Continue",
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.addProfileImage);
                },
                isEnabled: true)
          ],
        ),
      ),
    );
  }
}
