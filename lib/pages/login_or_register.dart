import 'package:aid_able/pages/login_page.dart';
import 'package:aid_able/pages/register_page.dart';
import 'package:flutter/material.dart';



class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPage();
}

class _LoginOrRegisterPage extends State<LoginOrRegisterPage> {
//initially show login page
  bool showLogInPage = true;

//toggle between login and register page
  void togglePages() {
    setState(() {
      showLogInPage = !showLogInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogInPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
