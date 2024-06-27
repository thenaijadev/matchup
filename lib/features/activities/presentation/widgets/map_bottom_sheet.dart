import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class MapScreenBottomSheet extends StatefulWidget {
  const MapScreenBottomSheet(
      {super.key, required this.screenContext, required this.onConfirmTap});
  final BuildContext screenContext;
  final VoidCallback onConfirmTap;
  @override
  State<MapScreenBottomSheet> createState() => _MapScreenBottomSheetState();
}

class _MapScreenBottomSheetState extends State<MapScreenBottomSheet> {
  bool locationPicked = false;
  @override
  Widget build(BuildContext context) {
    var brightness = View.of(context).platformDispatcher.platformBrightness;
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!locationPicked)
            InputFieldWidget(
                fillColor: Colors.transparent,
                prefixicon: Icon(
                  CupertinoIcons.search,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                hintColor: Theme.of(context).colorScheme.secondary,
                hintText: "Search for location or venue",
                onChanged: (val) {}),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                  radius: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset("assets/images/location_pin.png"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextWidget(
                  text: "Set Location on map",
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )
              ],
            ),
          ),
          ...List.generate(
            3,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  locationPicked = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.inverseSurface,
                      radius: 15,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset("assets/images/location_pin.png"),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Computer games",
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        TextWidget(
                          text:
                              "08 festac avenue, ikate, surulere, lagos state",
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          if (locationPicked)
            PrimaryButton(
                label: "Confirm",
                onPressed: widget.onConfirmTap,
                isEnabled: true)
        ],
      ),
    );
  }
}
