import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'r.dart'; // Import the file containing the second code

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  final user = FirebaseAuth.instance.currentUser!;

  // Method to navigate to the second page
  void navigateToSecondPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp()), // Using the second code's page
    );
  }

  // Sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => navigateToSecondPage(context), // Navigate when icon is pressed
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text(
          "Logged In As ${user.email!}",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
