import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/screens/auth/auth_controller.dart';
import 'package:zero_waste_kitchen/services/notification_service.dart';
import 'package:zero_waste_kitchen/utils/shared_prefs.dart';

import 'package:zero_waste_kitchen/utils/utils.dart';
import 'package:zero_waste_kitchen/widgets/auth_wrapper.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // static final FirebaseMessaging _firebaseMessaging =
  //     FirebaseMessaging.instance;

  @override
  Widget build(BuildContext context) {
    // final pushNotificationService = PushNotificationService(_firebaseMessaging);
    // pushNotificationService.initialise();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => SharedPrefs()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          theme: theme,
          home: const AuthWrapper(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
