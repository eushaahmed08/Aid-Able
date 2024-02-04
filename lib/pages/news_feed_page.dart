// news_feed_page.dart

import 'package:flutter/material.dart';

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of posts
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Post $index'),
            // You can customize the ListTile as per your requirements
          );
        },
      ),
    );
  }
}
