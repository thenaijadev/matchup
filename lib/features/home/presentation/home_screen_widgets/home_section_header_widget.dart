import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/profile/bloc/profile_bloc.dart';

class HomeWidgetHeaderSection extends StatelessWidget {
  const HomeWidgetHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state is ProfileStateIsLoading
            ? const CircularProgressIndicator()
            : state is ProfileStateError
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(child: Icon(Icons.person)),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Good Morning",
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              TextWidget(
                                text: "Error, tap to retry",
                                fontSize: 14,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                                  width: 2),
                            ),
                            child: Image.asset(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              width: 50,
                              "assets/images/search.png",
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                                  width: 2),
                            ),
                            child: Image.asset(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              width: 50,
                              "assets/images/bell.png",
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                : state is ProfileStateUserGotten
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(child: Icon(Icons.person)),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "Good Morning",
                                    fontSize: 12,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  TextWidget(
                                    text: "Error, tap to retry",
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inverseSurface,
                                      width: 2),
                                ),
                                child: Image.asset(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  width: 50,
                                  "assets/images/search.png",
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inverseSurface,
                                      width: 2),
                                ),
                                child: Image.asset(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  width: 50,
                                  "assets/images/bell.png",
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    : const SizedBox();
      },
    );
  }
}
