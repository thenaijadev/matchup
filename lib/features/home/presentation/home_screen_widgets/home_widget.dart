// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/features/auth/bloc/auth_bloc.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/home/presentation/home_screen_widgets/activities_section_widget.dart';
import 'package:matchup/features/home/presentation/home_screen_widgets/events_carousel.dart';
import 'package:matchup/features/home/presentation/home_screen_widgets/events_section_widget.dart';
import 'package:matchup/features/home/presentation/home_screen_widgets/home_section_header_widget.dart';
import 'package:matchup/features/home/presentation/home_screen_widgets/news_section.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({
    super.key,
    required this.user,
  });
  final AuthUser user;

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  void initState() {
    context.read<AuthBloc>().add(AuthEventSendFCM());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthStateError) {
            logger.e(state);
          }
        },
        builder: (context, state) {
          return state is AuthStateIsLoading
              ? const LoadingWidget()
              : ListView(
                  children: [
                    HomeWidgetHeaderSection(
                      user: widget.user,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 175,
                      child: EventsCarousel(
                          controller: PageController(
                        initialPage: 0,
                        viewportFraction: .95,
                      )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    NewsSectionWidget(user: widget.user),
                    const ActivitiesSectionWidget(),
                    const EventsSection()
                  ],
                );
        },
      ),
    );
  }
}
