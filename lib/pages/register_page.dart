import 'package:aid_able/components/my_button.dart';
import 'package:aid_able/components/my_textfield.dart';
import 'package:aid_able/components/square_tile.dart';
import 'package:aid_able/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class RegisterPage extends StatefulWidget {
  final Function()? ontap;
  const RegisterPage({super.key,required this.ontap});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final auth =AuthService();

  //sign user up method
  void signUserUp(BuildContext context) async {
    final auth = AuthService();
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await auth.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,

        );
      } else {
        Navigator.pop(context);
        //ErrorShowMessage(context, 'Password Don\'t Match');
        return;
      }

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      AlertDialog(
        title: Text(e.toString()),

      );
      Navigator.pop(context);
      //ErrorShowMessage(context,e.code);
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
  }

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

                  SquareTile(
                    onTap: () {},
                    imagePath: 'lib/images/logo.png',
                  ),

                  const SizedBox(height: 40),

                  //lets create an account
                  const Text(
                    'Lets create an account!',
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


                  const SizedBox(height: 10),

                  //confirm password
                  MyTextFeild(
                    controller: confirmPasswordController,
                    hintText: 'confirm password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),


                  //sign up button
                  MyButton(
                    text: "Sign Up",
                    onTap: () => signUserUp(context),
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
                            'Already have an account?',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.ontap,
                            child: const Text(
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

                ],
              ),
            ),
          ),
        ),
      );
    }
}



