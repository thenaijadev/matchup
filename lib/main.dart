import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:matchup/app.dart';
import 'package:matchup/core/utils/bloc_observer.dart';
import 'package:matchup/core/utils/firebase_notifications.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appInitialization();

  // await LocationServiceClass.determinePosition();

  Bloc.observer = AppBlocObserver();
  // final user = await LocalDataSource().getUser();

  runApp(const MyApp());
}

appInitialization() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

// ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FlutterContacts.requestPermission();

  await FirebaseAndPushNotificationService.initNotifications();
  // await FirebaseAndPushNotificationService.localNotificationsInit();
  // await initializeDependencies();
}
