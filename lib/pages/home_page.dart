import 'package:aid_able/chat/chat_service.dart';
import 'package:aid_able/pages/addpost.dart';
import 'package:aid_able/pages/news_feed_page.dart';
import 'package:aid_able/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'ChatPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

//chat & auth service
 final ChatService _chatService= ChatService();
 final AuthService _authService= AuthService();

 @override


  Widget build (BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: const Text("Home"),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.grey,
      elevation: 0,

    ),
    drawer: const MyDrawer(),
    body: _buildUserList(),



  );





 }

Widget _buildUserList() {
  return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text ("Error");
        }


        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }

        return ListView(

          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData,context))
              .toList(),
        );
      }


      Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context){

      return UserTile(
        text:userData("email"),
        onTap:(){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:(context)=>ChatPage(
                receiverEmail: userData("email"),
                receiverID: userData("uid"),
              ),
            ),
          );

        },
   );
  }


}















class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
                              fontSize: 20.0, color: Colors.black),
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
        builder: (context) => const NewsFeedPage(), // Create NewsFeedPage class
      ),
    );
  } else if (index==2) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ChatPage(receiverEmail: '',), // Create NewsFeedPage class
      ),
    );
   } else {
    setState(() {
      _selectedIndex = index;
    });
  }

}
}
