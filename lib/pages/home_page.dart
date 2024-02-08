import 'package:aid_able/pages/addpost.dart';
import 'package:aid_able/pages/news_feed_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../chat/users page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;
  ThemeMode _currentThemeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _currentThemeMode,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AidAble'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.density_medium),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        body: _selectedIndex == 0
            ? ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  String itemName = '';
                  String imagePath = '';
                  switch (index) {
                    case 0:
                      itemName = 'Food';
                      imagePath = 'assets/food.jpg';
                      break;
                    case 1:
                      itemName = 'Clothes';
                      imagePath = 'assets/clothes.jpeg';
                      break;
                    case 2:
                      itemName = 'Books';
                      imagePath = 'assets/books.jpg';
                      break;
                    case 3:
                      itemName = 'Blankets';
                      imagePath = 'assets/Blanket.png';
                      break;
                    case 4:
                      itemName = 'Toys';
                      imagePath = 'assets/stationary.jpg';
                      break;
                    default:
                      itemName = 'Unknown';
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                itemName,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
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
                  elevation: MaterialStateProperty.resolveWith<double>(
                    (Set<MaterialState> states) {
                      return _selectedIndex == 0 ? 8.0 : 0.0;
                    },
                  ),
                ),
                onPressed: () {
                  _onItemTapped(0);
                },
                child: const Icon(Icons.feed),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith<double>(
                    (Set<MaterialState> states) {
                      return _selectedIndex == 1 ? 8.0 : 0.0;
                    },
                  ),
                ),
                onPressed: () {
                  _onItemTapped(1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddPostPage(),
                    ),
                  );
                },
                child: const Icon(Icons.post_add),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith<double>(
                    (Set<MaterialState> states) {
                      return _selectedIndex == 2 ? 8.0 : 0.0;
                    },
                  ),
                ),
                onPressed: () {
                  _onItemTapped(2);
                },
                child: const Icon(Icons.question_answer),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: const Text("AID - ABLE"),
                  accountEmail: Text(user.email ?? ""),
                  currentAccountPicture: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person),
                  ),
                ),
                SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: _currentThemeMode == ThemeMode.dark,
                  onChanged: (value) {
                    setState(() {
                      _currentThemeMode =
                          value ? ThemeMode.dark : ThemeMode.light;
                    });
                  },
                ),
                ListTile(
                  title: const Text("U S E R  N A M E "),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle drawer item tap
                  },
                ),
                ListTile(
                  title: const Text("U S E R  I N F O "),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle drawer item tap
                  },
                ),
                // Add more ListTile widgets for additional drawer items
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NewsFeedPage(),
        ),
      );
    } else if(index==2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
           Home(), // Create NewsFeedPage class
        ),
      );
    }
  }
}
