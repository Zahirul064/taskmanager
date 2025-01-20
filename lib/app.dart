import 'package:flutter/material.dart';
import 'package:taskmanager/screen/onboarding/emailVrificationScreen.dart';
import 'package:taskmanager/screen/onboarding/loginScreen.dart';
import 'package:taskmanager/screen/onboarding/pinVerificationScreen.dart';
import 'package:taskmanager/screen/onboarding/registrationScreen.dart';
import 'package:taskmanager/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmanager/screen/onboarding/splashScreen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      initialRoute: '/login',
      routes: {
        '/':(context)=>splashScreen(),
        '/login':(context)=>loginScreen(),
        '/registration':(context)=>Registrationscreen(),
        '/emailVerification':(context)=>Emailvrificationscreen(),
        '/pinVerification':(context)=>Pinverificationscreen(),
        '/setPassword':(context)=>Setpasswordscreen(),

      },

    );
  }
}
