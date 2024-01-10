import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AidAble'),
          leading: IconButton(
            icon: Icon(Icons.density_medium),
            onPressed: () {
              // Add functionality for the top app bar button here
            },
          ),
        ),
        body: Center(
          child: Text(
            'Feed',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.feed),
                iconSize: 30.0, // Adjust the size here as needed
                onPressed: () {
                  // Add functionality for the first bottom app bar button here
                },
              ),
              IconButton(
                icon: Icon(Icons.post_add),
                iconSize: 30.0, // Adjust the size here as needed
                onPressed: () {
                  // Add functionality for the second bottom app bar button here
                },
              ),
              IconButton(
                icon: Icon(Icons.question_answer),
                iconSize: 30.0, // Adjust the size here as needed
                onPressed: () {
                  // Add functionality for the third bottom app bar button here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}