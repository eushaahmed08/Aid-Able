//import 'package:aid_able/pages/auth_page.dart';
//import 'package:aid_able/second_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'second_page.dart';



class first_page extends StatelessWidget {

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
      nextScreen:  second_page(),
      splashIconSize: double.infinity,
      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,

    );
  }
}