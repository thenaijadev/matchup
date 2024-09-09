import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/config/dark_mode/presentation/bloc/dark_mode_bloc.dart';
import 'package:matchup/config/router/app_router.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/config/theme/dark_theme.dart';
import 'package:matchup/config/theme/light_theme.dart';
import 'package:matchup/core/utils/app_constraints.dart';
import 'package:matchup/features/activities/blocs/activities/activities_bloc.dart';
import 'package:matchup/features/activities/blocs/bloc/activity_details_bloc.dart';
import 'package:matchup/features/activities/blocs/reviews/reviews_bloc.dart';
import 'package:matchup/features/activities/data/providers/activities_providers.dart';
import 'package:matchup/features/activities/data/providers/reviews_provider.dart';
import 'package:matchup/features/activities/data/repositories/activities_repository.dart';
import 'package:matchup/features/activities/data/repositories/reviews_repository.dart';
import 'package:matchup/features/auth/bloc/auth_bloc.dart';
import 'package:matchup/features/auth/data/providers/auth_provider.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';
import 'package:matchup/features/auth/data/repositories/auth_repo.dart';
import 'package:matchup/features/chat/bloc/chats/chat_bloc.dart';
import 'package:matchup/features/chat/bloc/participants/participants_bloc.dart';
import 'package:matchup/features/chat/data/provider/chat_provider.dart';
import 'package:matchup/features/chat/data/provider/participants_provider.dart';
import 'package:matchup/features/chat/data/repository/chat_repository.dart';
import 'package:matchup/features/chat/data/repository/participant_repository.dart';
import 'package:matchup/features/news/bloc/news_bloc.dart';
import 'package:matchup/features/news/data/providers/news_providers.dart';
import 'package:matchup/features/news/data/repositories/news_repository.dart';
import 'package:matchup/features/profile/bloc/profile_bloc.dart';
import 'package:matchup/features/profile/data/providers/profile_provider.dart';
import 'package:matchup/features/profile/data/repositories/profile_repositories.dart';
import 'package:matchup/features/quiz/bloc/quiz_bloc.dart';
import 'package:matchup/features/quiz/data/providers/quiz_provider.dart';
import 'package:matchup/features/quiz/data/repositories/quiz_repository.dart';
import 'package:matchup/features/teams/bloc/team_bloc.dart';
import 'package:matchup/features/teams/data/providers/team_provider.dart';
import 'package:matchup/features/teams/data/repositories/team_repository.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    AppConstraints().initialize(context);

    final appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DarkModeBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
              authRepo: AuthRepository(
                  provider: AuthProvider(),
                  localDataSource: LocalDataSource())),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            repo: ProfileRepository(
              provider: ProfileProvider(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => NewsBloc(
            repo: NewsRepository(
              newsProvider: NewsProvider(),
            ),
          ),
        ),
        BlocProvider(
            create: (context) => ActivitiesBloc(
                repo: ActivitiesRepository(
                    activitiesProvider: ActivitiesProvider()))),
        BlocProvider(
          create: (context) =>
              ReviewsBloc(repo: ReviewsRepository(provider: ReviewsProvider())),
        ),
        BlocProvider(
          create: (context) =>
              TeamBloc(repo: TeamRepository(provider: TeamProvider())),
        ),
        BlocProvider(
          create: (context) => ActivityDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => ChatBloc(
            repo: ChatRepository(
              provider: ChatProvider(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => QuizBloc(
            repo: QuizRepository(
              provider: QuizProvider(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ParticipantsBloc(
            repo: ParticipantRepository(
              provider: ParticipantsProvider(),
            ),
          ),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: FutureBuilder(
            future: LocalDataSource().getUser(),
            builder: (context, snapShot) {
              return BlocBuilder<DarkModeBloc, DarkModeState>(
                builder: (context, state) {
                  if (state is DarkModeCurrentState) {
                    return state.status != "System"
                        ? ScreenUtilInit(
                            designSize: const Size(375, 812),
                            minTextAdapt: true,
                            splitScreenMode: true,
                            builder: (context, child) {
                              return MaterialApp(
                                theme: state.status == "Dark"
                                    ? darkTheme()
                                    : lightTheme(),
                                debugShowCheckedModeBanner: false,
                                title: 'Flutter Demo',
                                initialRoute: snapShot.hasData
                                    ? Routes.home
                                    : Routes.splash,
                                onGenerateRoute: appRouter.onGenerateRoute,
                              );
                            },
                          )
                        : ScreenUtilInit(
                            designSize: const Size(375, 812),
                            minTextAdapt: true,
                            splitScreenMode: true,
                            builder: (context, child) {
                              return MaterialApp(
                                theme: lightTheme(),
                                darkTheme: darkTheme(),
                                debugShowCheckedModeBanner: false,
                                title: 'Flutter Demo',
                                initialRoute: snapShot.hasData
                                    ? Routes.home
                                    : Routes.splash,
                                onGenerateRoute: appRouter.onGenerateRoute,
                              );
                            },
                          );
                  }
                  return const SizedBox();
                },
              );
            }),
      ),
    );
  }
}












// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:matchup/config/dark_mode/presentation/bloc/dark_mode_bloc.dart';
// import 'package:matchup/config/router/app_router.dart';
// import 'package:matchup/config/router/routes.dart';
// import 'package:matchup/config/theme/dark_theme.dart';
// import 'package:matchup/config/theme/light_theme.dart';
// import 'package:matchup/core/utils/app_constraints.dart';
// import 'package:matchup/features/activities/blocs/activities/activities_bloc.dart';
// import 'package:matchup/features/activities/blocs/bloc/activity_details_bloc.dart';
// import 'package:matchup/features/activities/blocs/reviews/reviews_bloc.dart';
// import 'package:matchup/features/activities/data/providers/activities_providers.dart';
// import 'package:matchup/features/activities/data/providers/reviews_provider.dart';
// import 'package:matchup/features/activities/data/repositories/activities_repository.dart';
// import 'package:matchup/features/activities/data/repositories/reviews_repository.dart';
// import 'package:matchup/features/auth/bloc/auth_bloc.dart';
// import 'package:matchup/features/auth/data/providers/auth_provider.dart';
// import 'package:matchup/features/auth/data/providers/local_provider.dart';
// import 'package:matchup/features/auth/data/repositories/auth_repo.dart';
// import 'package:matchup/features/chat/bloc/chat_bloc.dart';
// import 'package:matchup/features/chat/data/provider/chat_provider.dart';
// import 'package:matchup/features/chat/data/repository/chat_repository.dart';
// import 'package:matchup/features/news/bloc/news_bloc.dart';
// import 'package:matchup/features/news/data/providers/news_providers.dart';
// import 'package:matchup/features/news/data/repositories/news_repository.dart';
// import 'package:matchup/features/profile/bloc/profile_bloc.dart';
// import 'package:matchup/features/profile/data/providers/profile_provider.dart';
// import 'package:matchup/features/profile/data/repositories/profile_repositories.dart';
// import 'package:matchup/features/teams/bloc/team_bloc.dart';
// import 'package:matchup/features/teams/data/providers/team_provider.dart';
// import 'package:matchup/features/teams/data/repositories/team_repository.dart';

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     AppConstraints().initialize(context);

//     final appRouter = AppRouter();

//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => DarkModeBloc(),
//         ),
//         BlocProvider(
//           create: (context) => AuthBloc(
//               authRepo: AuthRepository(
//                   provider: AuthProvider(),
//                   localDataSource: LocalDataSource())),
//         ),
//         BlocProvider(
//           create: (context) =>
//               ProfileBloc(repo: ProfileRepository(provider: ProfileProvider())),
//         ),
//         BlocProvider(
//           create: (context) =>
//               NewsBloc(repo: NewsRepository(newsProvider: NewsProvider())),
//         ),
//         BlocProvider(
//           create: (context) => ActivitiesBloc(
//               repo: ActivitiesRepository(
//                   activitiesProvider: ActivitiesProvider())),
//         ),
//         BlocProvider(
//           create: (context) =>
//               ReviewsBloc(repo: ReviewsRepository(provider: ReviewsProvider())),
//         ),
//         BlocProvider(
//           create: (context) =>
//               TeamBloc(repo: TeamRepository(provider: TeamProvider())),
//         ),
//         BlocProvider(
//           create: (context) => ActivityDetailsBloc(),
//         ),
//         BlocProvider(
//           create: (context) => ChatBloc(
//             repo: ChatRepository(
//               provider: ChatProvider(),
//             ),
//           ),
//         ),
//       ],
//       child: GestureDetector(
//         onTap: () {
//           FocusManager.instance.primaryFocus?.unfocus();
//         },
//         child: FutureBuilder(
//             future: LocalDataSource().getUser(),
//             builder: (context, snapShot) {
//               return BlocBuilder<DarkModeBloc, DarkModeState>(
//                 builder: (context, state) {
//                   if (state is DarkModeCurrentState) {
//                     return state.status != "System"
//                         ? ScreenUtilInit(
//                             designSize: const Size(375, 812),
//                             minTextAdapt: true,
//                             splitScreenMode: true,
//                             builder: (context, child) {
//                               return MaterialApp(
//                                 theme: state.status == "Dark"
//                                     ? darkTheme()
//                                     : lightTheme(),
//                                 debugShowCheckedModeBanner: false,
//                                 title: 'Flutter Demo',
//                                 initialRoute: snapShot.hasData
//                                     ? Routes.home
//                                     : Routes.splash,
//                                 onGenerateRoute: appRouter.onGenerateRoute,
//                               );
//                             },
//                           )
//                         : ScreenUtilInit(
//                             designSize: const Size(375, 812),
//                             minTextAdapt: true,
//                             splitScreenMode: true,
//                             builder: (context, child) {
//                               return MaterialApp(
//                                 theme: lightTheme(),
//                                 darkTheme: darkTheme(),
//                                 debugShowCheckedModeBanner: false,
//                                 title: 'Flutter Demo',
//                                 initialRoute: snapShot.hasData
//                                     ? Routes.home
//                                     : Routes.splash,
//                                 onGenerateRoute: appRouter.onGenerateRoute,
//                               );
//                             },
//                           );
//                   }
//                   return const SizedBox();
//                 },
//               );
//             }),
//       ),
//     );
//   }
// }
