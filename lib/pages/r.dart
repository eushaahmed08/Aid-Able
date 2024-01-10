import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

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
        body: _selectedIndex == 0
            ? Center(
          child: Text(
            'Feed',
            style: TextStyle(fontSize: 20.0),
          ),
        )
            : Container(), // Empty container when other icons are selected
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
                    return _selectedIndex == 0 ? 8.0 : 0.0; // Set elevation for the selected button
                  }),
                ),
                onPressed: () {
                  _onItemTapped(0);
                },
                child: Icon(Icons.feed),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
                    return _selectedIndex == 1 ? 8.0 : 0.0;
                  }),
                ),
                onPressed: () {
                  _onItemTapped(1);
                },
                child: Icon(Icons.post_add),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
                    return _selectedIndex == 2 ? 8.0 : 0.0;
                  }),
                ),
                onPressed: () {
                  _onItemTapped(2);
                },
                child: Icon(Icons.question_answer),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Set the first button as selected by default
    _selectedIndex = 0;
  }
}
