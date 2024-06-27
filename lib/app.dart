import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/config/dark_mode/presentation/bloc/dark_mode_bloc.dart';
import 'package:matchup/config/router/app_router.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/config/theme/dark_theme.dart';
import 'package:matchup/config/theme/light_theme.dart';
import 'package:matchup/core/utils/app_constraints.dart';

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
    return BlocProvider(
      create: (context) => DarkModeBloc(),
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
