import 'package:assestment_restaurant_app/provider/bottom_nav_provider.dart';
import 'package:assestment_restaurant_app/screens/bookmark/bookmark_screen.dart';
import 'package:assestment_restaurant_app/screens/home/home_screen.dart';
import 'package:assestment_restaurant_app/screens/settings/setting_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> _pages = [HomeScreen(), BookmarkScreen(), SettingScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Body of main screen
      body: Consumer<BottomNavProvider>(
        builder: (context, value, child) {
          return _pages[value.indexBottomBar];
        },
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        /// Index of Bottom Navigation Provider
        currentIndex: context.watch<BottomNavProvider>().indexBottomBar,

        /// On tap method return Bottom Navigation Provider indeBottomBar setter
        onTap: (index) =>
            context.read<BottomNavProvider>().setIndexBottombar = index,

        /// Return item of _pages
        items: const [
          /// Bottom bar item: Home
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',
          ),

          /// Bottom bar item: Bookmark
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
            tooltip: 'Bookmark',
          ),

          /// Bottom barn item:  Settings
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            tooltip: 'Settings',
          ),
        ],
      ),
    );
  }
}
