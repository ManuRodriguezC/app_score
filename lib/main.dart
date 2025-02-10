import 'package:flutter/material.dart';
import 'package:score_rosario/config/router/app_router.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initOneSignal();
  runApp(const MyApp());
}

Future<void> initOneSignal() async {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("df7ccfd1-161d-4323-b24f-8a670194e092");

  OneSignal.Notifications.requestPermission(true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
