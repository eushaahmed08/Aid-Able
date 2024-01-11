
import 'package:aid_able/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'ThirtdPage.dart';



class second_page extends StatelessWidget {

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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/reduce.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      nextScreen:  third_page(),
      splashIconSize: double.infinity,
      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,

    );
  }
}