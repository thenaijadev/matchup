import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/snackbar.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/auth/data/models/user_data.dart';
import 'package:matchup/features/profile/bloc/profile_bloc.dart';
import 'package:matchup/features/profile/data/models/all_sports_model.dart';
import 'package:matchup/features/profile/data/models/data_transfer_model.dart';
import 'package:matchup/features/profile/presentation/widgets/sport_time_widget.dart';

class SportChoiceScreen extends StatefulWidget {
  const SportChoiceScreen({super.key, required this.user});
  final UserData user;
  @override
  State<SportChoiceScreen> createState() => _SportChoiceScreenState();
}

class _SportChoiceScreenState extends State<SportChoiceScreen> {
  // final List<Map<String, String>> items = [
  //   {"title": "Basketball", "image": "assets/images/basket_ball.png"},
  //   {"title": "Rugby", "image": "assets/images/rugby.png"},
  //   {"title": "Tennis", "image": "assets/images/tennis.png"},
  //   {"title": "Football", "image": "assets/images/football.png"},
  //   {"title": "Baseball", "image": "assets/images/baseball.png"},
  //   {"title": "Ice Hokey", "image": "assets/images/hockey.png"},
  //   {"title": "Table Tennis", "image": "assets/images/table_tennis.png"},
  //   {"title": "Cricket", "image": "assets/images/cricket.png"},
  //   {"title": "Soccer", "image": "assets/images/soccer.png"},
  // ];

  @override
  void initState() {
    context
        .read<ProfileBloc>()
        .add(ProfileEventGetSports(authToken: widget.user.token ?? ""));
    setState(() {});
    super.initState();
  }

  final List<Sport> selectedItems = [];

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
          text: "Choose your sport",
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileStateError) {
              InfoSnackBar.showErrorSnackBar(context, state.error.errorMessage);
            }
          },
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return state is ProfileStateIsLoading
                  ? const LoadingWidget()
                  : state is ProfileStateAllSportsGotten
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                              ),
                              child: TextWidget(
                                  textAlign: TextAlign.center,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  text:
                                      "You can select more than one of your favourite sport."),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              children: List.generate(
                                state.sportsModel.data.length,
                                (index) => SportItemWidget(
                                  isSelected: selectedItems
                                      .contains(state.sportsModel.data[index]),
                                  onTap: () {
                                    setState(() {
                                      if (selectedItems.length >= 5) {
                                        if (selectedItems.contains(
                                            state.sportsModel.data[index])) {
                                          selectedItems.remove(
                                              state.sportsModel.data[index]);
                                        }
                                      } else {
                                        if (selectedItems.contains(
                                            state.sportsModel.data[index])) {
                                          selectedItems.remove(
                                              state.sportsModel.data[index]);
                                        } else {
                                          selectedItems.add(
                                              state.sportsModel.data[index]);
                                        }
                                      }
                                    });
                                  },
                                  image:
                                      state.sportsModel.data[index].image ?? "",
                                  title: state.sportsModel.data[index].name!,
                                  chosenIndex: index,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Spacer(),
                            TextWidget(
                              text: "${selectedItems.length} of 5",
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const Spacer(),
                            Opacity(
                                opacity: selectedItems.isEmpty ? 0.5 : 1,
                                child: PrimaryButton(
                                    label: "Save",
                                    onPressed: () {
                                      if (selectedItems.isNotEmpty) {
                                        Navigator.pushNamed(
                                            context, Routes.chooseSportLevel,
                                            arguments: DataTransferModel(
                                                sports: selectedItems,
                                                user: widget.user));
                                      }
                                    },
                                    isEnabled: true)),
                          ],
                        )
                      : state is ProfileStateError
                          ? Column(
                              children: [
                                TextWidget(
                                  text:
                                      "An error has occured, please check your internet connection and try again",
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                PrimaryButton(
                                    label: "Retry",
                                    onPressed: () {
                                      context.read<ProfileBloc>().add(
                                          ProfileEventGetSports(
                                              authToken:
                                                  widget.user.token ?? ""));
                                    },
                                    isEnabled: true)
                              ],
                            )
                          : const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
