
import 'package:flutter/material.dart';

import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';

import 'package:task_manager/ui/widgets/screen_background.dart';

import '../widgets/app_logo.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  static const String name='/';

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {

  @override
  @override
  void initState() {
    super.initState();
    moveToNextScree();
  }

  Future<void> moveToNextScree() async{
    await Future.delayed(const Duration(seconds: 2));
    bool isUserLoggedIn=await AuthController.isUserLoggedIn();
    if(isUserLoggedIn){
      Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
    }
    else{
      Navigator.pushReplacementNamed(context, SignInScreen.name);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ScreenBackground(
        child: const Center(
          child: AppLogo(),
        ),
      )
    );
  }
}


