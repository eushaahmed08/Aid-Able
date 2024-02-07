import 'package:aid_able/components/my_button.dart';
import 'package:aid_able/components/my_textfield.dart';
import 'package:aid_able/components/square_tile.dart';
import 'package:aid_able/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {
    // show loading screen
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

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

                SquareTile(onTap: () {}, imagePath: 'lib/images/logo.png'),

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
                  hintText: 'email',
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
                  text: "Sign In",
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google

                    /* SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/images/google.png',
                    ),

                    const SizedBox(height: 20),

                    const SizedBox(width: 10),

                    //apple

                    SquareTile(
                      onTap: () {},
                      imagePath: 'lib/images/apple.png',
                    ),
                  ],
                ),
*/
                    const SizedBox(height: 10),

                    //not a memeber register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Register Now!',
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
              ],
            ),
          ),
        ),
      ),
    );
  }


}