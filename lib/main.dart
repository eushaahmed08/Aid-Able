import 'package:aid_able/pages/auth_page.dart';
import 'package:flutter/material.dart';
//import 'pages/login_page.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            toolbarHeight: 100,
            title: Text("AidAble"),
            backgroundColor: Colors.blue[300],
            titleTextStyle: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              fontFamily: 'Kalnia',
            ),
            centerTitle: true,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/reuse.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            navigatorKey.currentState!.push(
              MaterialPageRoute(builder: (context) => FirstPage(navigatorKey: navigatorKey)),
            );
          },
          label: Text('Continue'),
          backgroundColor: Colors.blue[300],
          icon: Icon(Icons.arrow_forward),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  FirstPage({required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          navigatorKey.currentState!.push(
            MaterialPageRoute(builder: (context) => SecondPage(navigatorKey: navigatorKey)),
          );
        },
        label: Text('Continue'),
        backgroundColor: Colors.blue[300],
        icon: Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class SecondPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  SecondPage({required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
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
            MaterialPageRoute(builder: (context) => AuthPage()),
          );
        },
        label: Text('Continue'),
        backgroundColor: Colors.blue[300],
        icon: Icon(Icons.arrow_forward),
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