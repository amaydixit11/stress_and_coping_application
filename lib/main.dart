import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart'; // Assuming this file contains your app-specific imports and configurations
import 'package:sizer/sizer.dart'; // Assuming you are using the 'sizer' package for responsive sizing

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData
              .light(), // Replace 'theme' with an actual ThemeData if defined elsewhere
          title: 'stress_and_coping_application',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
          scaffoldMessengerKey:
              globalMessengerKey, // Added this line to connect the messenger key
        );
      },
    );
  }
}
