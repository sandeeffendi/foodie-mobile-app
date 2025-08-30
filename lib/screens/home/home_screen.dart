import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(child: Icon(Icons.add)),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          ),
        ],
      ),
      body: Center(child: Text('ini adalah homescreen')),
    );
  }
}
