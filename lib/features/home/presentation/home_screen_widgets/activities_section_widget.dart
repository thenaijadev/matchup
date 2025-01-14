import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/activities/blocs/activities/activities_bloc.dart';

class ActivitiesSectionWidget extends StatelessWidget {
  const ActivitiesSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextWidget(
          text: "Activities",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        TextWidget(
          text: "Based on your sport of interest",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 2,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/note_pad.png",
                width: 80,
              ),
              const SizedBox(
                height: 13,
              ),
              BlocBuilder<ActivitiesBloc, ActivitiesState>(
                builder: (context, state) {
                  return TextWidget(
                    onTap: () {
                      if (state is ActivitiesStateAllActivitiesRetreived) {
                        Navigator.pushNamed(context, Routes.activities);
                      }
                    },
                    text: state is ActivitiesStateAllActivitiesRetreived
                        ? "${state.activitiesModel.activities.length} available"
                        : "No Activities",
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.secondary,
                  );
                },
              ),
              const SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PrimaryButton(
                    label: "Create Activity",
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.createActivity);
                    },
                    isEnabled: true),
              )
            ],
          ),
        )
      ],
    );
  }
}
