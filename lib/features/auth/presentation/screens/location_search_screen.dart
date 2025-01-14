import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/auth/data/models/user_data.dart';
import 'package:matchup/features/places/bloc/places_bloc.dart';

class LocationSearchScreen extends StatefulWidget {
  const LocationSearchScreen({super.key, required this.user});
  final UserData user;
  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  int choice = 1;
  bool showGender = false;
  String location = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                controller: _controller,
                hintColor: Theme.of(context).colorScheme.secondary,
                hintText: "Eg: Agege, Lagos Nigeria",
                prefixicon: Icon(
                  Icons.location_pin,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                hintSize: 12,
                onChanged: (val) {
                  setState(() {
                    location = val!;
                    Future.delayed(const Duration(seconds: 1), () {
                      context
                          .read<PlacesBloc>()
                          .add(PlacesEventGetSuggestions(query: val));
                    });
                  });
                }),
            const SizedBox(
              height: 30,
            ),

            // GestureDetector(
            //   onTap: () {},
            //   child: Row(
            //     children: [
            //       Image.asset(
            //         "assets/images/target.png",
            //         width: 18,
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       TextWidget(
            //           textAlign: TextAlign.center,
            //           color: Theme.of(context).colorScheme.secondary,
            //           fontSize: 12,
            //           text: "Use my current location"),
            //     ],
            //   ),
            // ),
            // const HorizontalDivider(
            //   thickness: 0.2,
            //   paddingVertical: 20,
            // ),
            BlocConsumer<PlacesBloc, PlacesState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return state is PlacesStateSuccess
                    ? state is PlacesStateIsLoading
                        ? const SizedBox(width: 100, child: LoadingWidget())
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * .5,
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
                                        _controller.text = state.places
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

            const Spacer(),
            PrimaryButton(
                label: "Continue",
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.addProfileImage,
                      arguments:
                          widget.user.copyWith(location: _controller.text));
                },
                isEnabled: location != "")
          ],
        ),
      ),
    );
  }
}
