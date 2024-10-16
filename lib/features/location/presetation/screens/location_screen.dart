import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/location/presetation/widgets/location_item.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: Transform.translate(
          offset: const Offset(15, 0),
          child: Transform.scale(
            scale: 0.7,
            child: GestureDetector(
              onTap: () =>
                  Navigator.popAndPushNamed(context, Routes.sportChoice),
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
            text: "Location",
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          image: const DecorationImage(
            image: AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              shrinkWrap: true,
              children: const [
                LocationItem(
                  location: "75, ST Palmer Avenue Enugu State Nigeria",
                ),
              ],
            ),
            PrimaryButton(
                label: "Add new address",
                onPressed: () {
                  Navigator.pushNamed(context, Routes.createLocation);
                },
                isEnabled: true)
          ],
        ),
      ),
    );
  }
}
