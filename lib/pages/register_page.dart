import 'package:aid_able/components/my_button.dart';
import 'package:aid_able/components/my_textfield.dart';
import 'package:aid_able/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  
  
  //sign user up method
  
  void signUserUp() async {
    
    
    // show loading screen
    
    
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //try creating the user
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      //pop the loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);

      //show error message
      showErrorMessage(e.code);
    }
  }

  //error message pop up
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            message,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfcbf49),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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

                const SizedBox(height: 10),

                //confirm password
                MyTextFeild(
                  controller: passwordController,
                  hintText: 'confirm password',
                  obscureText: true,
                ),

                const SizedBox(height: 5),

                //forgot pass

                const Text(
                  'Forgot password?',
                  style: TextStyle(color: Color(0xFF14213d)),
                ),

                const SizedBox(height: 10),

                //sign up button
                MyButton(
                  onTap: signUserUp,
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
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        'Log in Now!',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
