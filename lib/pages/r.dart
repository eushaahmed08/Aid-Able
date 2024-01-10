import 'package:flutter/material.dart';
import 'addpost.dart';

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
            onPressed: () {},
          ),
        ),
        body: _selectedIndex == 0
            ? ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            String itemName = '';
            switch (index) {
              case 0:
                itemName = 'Food';
                break;
              case 1:
                itemName = 'Clothes';
                break;
              case 2:
                itemName = 'Books';
                break;
              case 3:
                itemName = 'Blankets';
                break;
              case 4:
                itemName = 'Toys';
                break;
              default:
                itemName = 'Unknown';
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 56.6929,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    itemName,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            );
          },
        )
            : Container(),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
                    return _selectedIndex == 0 ? 8.0 : 0.0;
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPostPage()),
                  );
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
    _selectedIndex = 0;
  }
}
