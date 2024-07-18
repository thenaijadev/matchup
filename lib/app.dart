import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/config/dark_mode/presentation/bloc/dark_mode_bloc.dart';
import 'package:matchup/config/router/app_router.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/config/theme/dark_theme.dart';
import 'package:matchup/config/theme/light_theme.dart';
import 'package:matchup/core/utils/app_constraints.dart';
import 'package:matchup/features/activities/bloc/activities_bloc.dart';
import 'package:matchup/features/activities/data/providers/activities_providers.dart';
import 'package:matchup/features/activities/data/repositories/activities_repository.dart';
import 'package:matchup/features/auth/bloc/auth_bloc.dart';
import 'package:matchup/features/auth/data/providers/auth_provider.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';
import 'package:matchup/features/auth/data/repositories/auth_repo.dart';
import 'package:matchup/features/news/bloc/news_bloc.dart';
import 'package:matchup/features/news/data/providers/news_providers.dart';
import 'package:matchup/features/news/data/repositories/news_repository.dart';
import 'package:matchup/features/profile/bloc/profile_bloc.dart';
import 'package:matchup/features/profile/data/providers/profile_provider.dart';
import 'package:matchup/features/profile/data/repositories/profile_repositories.dart';

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
          create: (context) =>
              ProfileBloc(repo: ProfileRepository(provider: ProfileProvider())),
        ),
        BlocProvider(
          create: (context) =>
              NewsBloc(repo: NewsRepository(newsProvider: NewsProvider())),
        ),
        BlocProvider(
          create: (context) => ActivitiesBloc(
              repo: ActivitiesRepository(
                  activitiesProvider: ActivitiesProvider())),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BlocBuilder<DarkModeBloc, DarkModeState>(
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
                          initialRoute: Routes.splash,
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
                          initialRoute: Routes.splash,
                          onGenerateRoute: appRouter.onGenerateRoute,
                        );
                      },
                    );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
