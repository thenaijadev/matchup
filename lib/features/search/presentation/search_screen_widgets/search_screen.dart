import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/activities/bloc/activities_bloc.dart';
import 'package:matchup/features/activities/data/models/activities_model.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';

class SearchScreenWidget extends StatefulWidget {
  const SearchScreenWidget({super.key, required this.user});
  final AuthUser user;

  @override
  State<SearchScreenWidget> createState() => _SearchScreenWidgetState();
}

class _SearchScreenWidgetState extends State<SearchScreenWidget> {
  String searchTerm = "";
  List<Activities> activities = [];
  List<Activities> filteredActivities = [];

  @override
  void initState() {
    context.read<ActivitiesBloc>().add(ActivitiesEventGetAllActivities());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          InputFieldWidget(
              prefixicon: Icon(
                CupertinoIcons.search,
                color: Theme.of(context).colorScheme.secondary,
              ),
              hintColor: Theme.of(context).colorScheme.secondary,
              hintText: "Search for Activities",
              onChanged: (val) {
                setState(() {
                  searchTerm = val ?? ""; // Handle empty string case
                  filteredActivities = activities
                      .where((activity) => activity.name!
                          .toLowerCase()
                          .contains(searchTerm.toLowerCase()))
                      .toList(); // Filter based on search term (lowercase for case-insensitive)
                });
              }),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: BlocConsumer<ActivitiesBloc, ActivitiesState>(
              listener: (context, state) {
                setState(() {
                  if (state is ActivitiesStateAllActivitiesRetreived) {
                    activities = state.activitiesModel.activities;
                    filteredActivities =
                        activities; // Update filtered list initially with all activities
                  }
                });
              },
              builder: (context, state) {
                return BlocBuilder<ActivitiesBloc, ActivitiesState>(
                  builder: (context, state) {
                    return state is ActivitiesStateIsLoading
                        ? const LoadingWidget()
                        : state is ActivitiesStateAllActivitiesRetreived
                            ? ListView(
                                children: List.generate(
                                    filteredActivities
                                        .length, // Use filteredActivities for display
                                    (index) => GestureDetector(
                                          onTap: () => Navigator.pushNamed(
                                              context, Routes.getDirections),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextWidget(
                                                  text:
                                                      filteredActivities[index]
                                                              .name ??
                                                          "",
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                                Image.asset(
                                                  "assets/images/go_icon.png",
                                                  width: 10.w,
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                              )
                            : const SizedBox();
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
