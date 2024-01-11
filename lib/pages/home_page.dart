import 'package:aid_able/pages/addpost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    style: const TextStyle(
                        fontSize: 20.0, color: Colors.white),
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
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Your App Name"),
                  accountEmail: Text(user.email ?? ""),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person),
                  ),
                ),
                ListTile(
                  title: Text("Drawer Item 1"),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle drawer item tap
                  },
                ),
                ListTile(
                  title: Text("Drawer Item 2"),
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
    setState(() {
      _selectedIndex = index;
    });
  }
}
