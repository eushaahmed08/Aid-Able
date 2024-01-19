import 'package:aid_able/pages/auth_page.dart';
import 'package:flutter/material.dart';
//import 'pages/login_page.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/first_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: const first_page());
  }
}

class FirstPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const FirstPage({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/reduce.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          navigatorKey.currentState!.push(
            MaterialPageRoute(
                builder: (context) => SecondPage(navigatorKey: navigatorKey)),
          );
        },
        label: const Text('Continue'),
        backgroundColor: Colors.blue[300],
        icon: const Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class SecondPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const SecondPage({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          navigatorKey.currentState!.push(
            MaterialPageRoute(builder: (context) => const AuthPage()),
          );
        },
        label: const Text('Continue'),
        backgroundColor: Colors.blue[300],
        icon: const Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
*/