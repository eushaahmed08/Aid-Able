import 'package:flutter/material.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your Post'),
      ),
      body: const Center(
        child: Text(
          'Options and Features for Adding Post',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
