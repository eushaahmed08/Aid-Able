//import 'package:aid_able/pages/auth_page.dart';
//import 'package:aid_able/second_page.dart';
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'second_page.dart';



class first_page extends StatelessWidget {
  const first_page({super.key});


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
                  image: AssetImage('assets/reuse.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      nextScreen:  const second_page(),
      splashIconSize: double.infinity,
      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,

    );
  }
}