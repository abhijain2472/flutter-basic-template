import 'package:basic_template/services/flavor/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:basic_template/services/network/injection_dir/injection.dart'
    as di;
import 'common/model/user_payload.dart';
import 'feature/landing_screen/landing_screen.dart';

/// This is a main function
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await PushNotificationsManager().init();
  FlavorConfig.setUpFlavor();
  Hive.registerAdapter(UserPayloadAdapter());
  await di.configureDependencies();
  await GetIt.instance.allReady();
  runApp(LandingScreen());
}
