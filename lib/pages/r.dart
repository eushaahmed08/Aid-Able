import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AidAble'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: _selectedIndex == 0
          ? ListView(
        children: [
          _buildCategoryItem(
            title: 'Food',
            imagePath: 'assets/food.jpg', // Provide correct image path
          ),
          _buildCategoryItem(
            title: 'Clothes',
            imagePath: 'assets/clothes.jpg', // Provide correct image path
          ),
          _buildCategoryItem(
            title: 'Books',
            imagePath: 'assets/books.jpg', // Provide correct image path
          ),
          _buildCategoryItem(
            title: 'Blankets',
            imagePath: 'assets/Blanket.jpg', // Provide correct image path
          ),
          _buildCategoryItem(
            title: 'Toys',
            imagePath: 'assets/stationary.jpg', // Provide correct image path
          ),
        ],
      )
          : Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Add Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCategoryItem({String title, String imagePath}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 120, // Adjust image width as needed
            height: 120, // Adjust image height as needed
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
