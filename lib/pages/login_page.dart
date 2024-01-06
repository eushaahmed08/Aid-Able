import 'package:aid_able/components/my_button.dart';
import 'package:aid_able/components/my_textfield.dart';
import 'package:aid_able/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFfcbf49),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // //logo
              // const Icon(
              //   Icons.lock,
              //   size: 100,
              // ),

              const SquareTile(imagePath: 'lib/images/logo.png'),

              const SizedBox(height: 40),

              const Text(
                'Welcome Back',
                style: TextStyle(
                  color: Color.fromARGB(255, 9, 9, 9),
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 20),

              //username
              MyTextFeild(
                controller: emailController,
                hintText: 'username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              //password
              MyTextFeild(
                controller: passwordController,
                hintText: 'password',
                obscureText: true,
              ),

              const SizedBox(height: 5),

              //forgot pass

              const Text(
                'Forgot password?',
                style: TextStyle(color: Color(0xFF14213d)),
              ),

              const SizedBox(height: 10),

              //sign in button
              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 10),

              //or continue with
              const Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  )),
                  Text('Or continue with'),
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ))
                ],
              ),
              //google+apple sign in button
              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google
                  SquareTile(imagePath: 'lib/images/google.png'),

                  SizedBox(height: 20),

                  SizedBox(width: 10),

                  //apple

                  SquareTile(imagePath: 'lib/images/apple.png'),
                ],
              ),

              const SizedBox(height: 10),

              //not a memeber register now
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Register Now!',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
