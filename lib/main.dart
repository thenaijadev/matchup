import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:matchup/app.dart';
import 'package:matchup/core/utils/bloc_observer.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  appInitialization();
  // await LocationServiceClass.determinePosition();

  Bloc.observer = AppBlocObserver();
  final user = await LocalDataSource().getUser();

  await FlutterContacts.requestPermission();
  runApp(const MyApp());
}

appInitialization() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // await initializeDependencies();
}
