import 'package:flutter/material.dart';

class AddPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your Post'),
      ),
      body: Center(
        child: Text(
          'Options and Features for Adding Post',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
