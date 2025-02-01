import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:school_management/Screens/Leave_Apply/LeaveApply.dart';
import 'package:school_management/Screens/LoginPage.dart';
import 'package:school_management/Screens/SplashScreen.dart';
import 'firebase_options.dart'; // Import the generated firebase_options.dart file

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase using the generated options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // This automatically selects the right platform configuration
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rise Education Center',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
