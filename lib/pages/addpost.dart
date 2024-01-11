import 'package:flutter/material.dart';

class AddPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your Post'),
       // backgroundColor: Colors.lavender, // Set the lavender color for the app bar
      ),
      backgroundColor: Color(0xFFE6E6FA), // Set the lavender color for the entire page
      body: Center(
        child: Text(
          'Options and Features for Adding Post',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
