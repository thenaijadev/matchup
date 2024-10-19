import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/activities/blocs/bloc/activity_details_bloc.dart';
import 'package:matchup/features/places/bloc/places_bloc.dart';

class MapScreenBottomSheet extends StatefulWidget {
  const MapScreenBottomSheet(
      {super.key, required this.screenContext, required this.onConfirmTap});
  final BuildContext screenContext;
  final VoidCallback onConfirmTap;
  @override
  State<MapScreenBottomSheet> createState() => _MapScreenBottomSheetState();
}

class _MapScreenBottomSheetState extends State<MapScreenBottomSheet> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                if (!locationPicked)
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset("assets/images/location_pin.png"),
                    ),
                  ),
                const SizedBox(
                  width: 10,
                ),
                TextWidget(
                  text: !locationPicked
                      ? "Please enter the location of the activity"
                      : "Confirm your address",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ],
            ),
          ),
          if (!locationPicked)
            const SizedBox(
              height: 30,
            ),
          if (!locationPicked)
            InputFieldWidget(
                controller: controller,
                fillColor: Colors.transparent,
                // enabledBorderRadius: 10,
                prefixicon: Icon(
                  CupertinoIcons.search,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                hintColor: Theme.of(context).colorScheme.secondary,
                // hintText: "Search for location or venue",
                hintText: "Enter your address",
                onChanged: (val) {
                  context
                      .read<PlacesBloc>()
                      .add(PlacesEventGetSuggestions(query: controller.text));
                }),
          if (!locationPicked)
            const SizedBox(
              height: 40,
            ),
          if (!locationPicked)
            BlocConsumer<PlacesBloc, PlacesState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return state is PlacesStateSuccess
                    ? state is PlacesStateIsLoading
                        ? const SizedBox(width: 100, child: LoadingWidget())
                        : SizedBox(
                            height: 200,
                            child: ListView(
                              children: [
                                Row(
                                  children: [
                                    TextWidget(
                                        textAlign: TextAlign.center,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontSize: 12,
                                        text: "Search Results"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ...List.generate(
                                    state.places.predictionsMap["predictions"]
                                        .length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.text = state.places
                                                .predictionsMap['predictions']
                                            [index]["description"];
                                      },
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/pin.png",
                                            width: 14,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .7,
                                            child: TextWidget(
                                                textAlign: TextAlign.start,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .inversePrimary,
                                                fontSize: 12,
                                                text:
                                                    state.places.predictionsMap[
                                                            'predictions']
                                                        [index]["description"]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          )
                    : const SizedBox();
              },
            ),
          const SizedBox(
            height: 30,
          ),
          if (!locationPicked)
            PrimaryButton(
                label: "Continue",
                onPressed: () {
                  final locationName = {"location_name": controller.text};
                  setState(() {
                    context.read<ActivityDetailsBloc>().add(
                            ActivityEventGatherInfoEvent(keyValue: {
                          "address": controller.text,
                          ...locationName
                        }));
                    locationPicked = true;
                  });

                  // Navigator.pop(context);
                },
                isEnabled: true),
          if (locationPicked)
            Padding(
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
                  TextWidget(
                    text: controller.text,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  )
                ],
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
