import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/snackbar.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/profile/bloc/profile_bloc.dart';
import 'package:matchup/features/profile/data/models/all_sports_model.dart';
import 'package:matchup/features/profile/data/models/data_transfer_model.dart';
import 'package:matchup/features/profile/presentation/widgets/sport_level.dart';

class ChooseSportLevelScreen extends StatefulWidget {
  const ChooseSportLevelScreen({super.key, required this.data});
  final DataTransferModel data;

  @override
  State<ChooseSportLevelScreen> createState() => _ChooseSportLevelScreenState();
}

class _ChooseSportLevelScreenState extends State<ChooseSportLevelScreen> {
  List<Sport> screenSports = [];
  bool screenIsComplete = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
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
        centerTitle: true,
        title: TextWidget(
          text: "Choose your sport",
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0)
              .copyWith(bottom: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: TextWidget(
                    textAlign: TextAlign.center,
                    color: Theme.of(context).colorScheme.secondary,
                    text:
                        "How well will you rate your skills on each of the sport."),
              ),
              Expanded(
                child: ListView(
                  children: List.generate(
                      widget.data.sports.length,
                      (index) => SportLevelWidget(
                            moveSport: (sports, isComplete) {
                              setState(() {
                                screenSports = sports;

                                logger.e({sports, isComplete});
                              });
                            },
                            index: index,
                            sports: widget.data.sports,
                          )),
                ),
              ),
              BlocConsumer<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  if (state is ProfileStateError) {
                    InfoSnackBar.showErrorSnackBar(
                        context, state.error.errorMessage);
                  }
                  if (state is ProfileStateUserSportCreated) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.home, (route) => route.isFirst);
                  }
                },
                builder: (context, state) {
                  return state is ProfileStateIsLoading
                      ? const LoadingWidget()
                      : PrimaryButton(
                          label: "Save",
                          onPressed: () {
                            final data = screenSports
                                .map((e) => {
                                      "sport_id": e.id,
                                      "skill_level":
                                          e.skillLevel?.toLowerCase() ?? "",
                                      "experience_level":
                                          e.experienceLevel?.toLowerCase() ??
                                              "",
                                    })
                                .toList();

                            if (screenSports.isEmpty) {
                              InfoSnackBar.showErrorSnackBar(
                                  context, "Please complete the form");
                            } else {
                              for (var item in screenSports) {
                                if (item.experienceLevel == null ||
                                    item.skillLevel == null) {
                                  InfoSnackBar.showErrorSnackBar(
                                      context, "Please complete the form",
                                      time: 1);
                                  setState(() {
                                    screenIsComplete == false;
                                  });
                                }
                              }
                            }
                            if (screenIsComplete) {
                              context.read<ProfileBloc>().add(
                                  ProfileEventCreateUserSport(
                                      sports: data,
                                      authToken: widget.data.user.token ?? ""));
                            }
                          },
                          isEnabled: true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createData({required List<Map<String, dynamic>> data}) {
    logger.d(data);
  }
}
