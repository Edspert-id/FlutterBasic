import 'package:flutter/material.dart';
import 'package:flutter_basic/ui/pages/bioskop_page.dart';
import 'package:flutter_basic/ui/pages/home_page.dart';
import 'package:flutter_basic/ui/pages/profile_page.dart';
import 'package:flutter_basic/ui/pages/tiket_page.dart';

import '../../values/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> bodyWidgets = [
    HomePage(),
    TiketPage(),
    BioskopPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurle,
      body: bodyWidgets[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.theaters),
            label: 'Bioskop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
