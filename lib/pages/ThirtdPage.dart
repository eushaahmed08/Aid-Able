
// ignore_for_file: file_names

import 'package:aid_able/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';



// ignore: camel_case_types
class third_page extends StatelessWidget {
  const third_page({super.key});


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      splash:
      Center(

        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/recycle.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      nextScreen:  const AuthPage(),
      splashIconSize: double.infinity,
      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,

    );
  }
}