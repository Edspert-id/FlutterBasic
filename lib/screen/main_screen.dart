import 'package:flutter/material.dart';
import 'package:flutter_basic/screen/screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidgets()[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket), label: 'Ticket'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Bioskop'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  List<Widget> _bodyWidgets() {
    return [
      const HomeScreen(),
      const TicketScreen(),
      const BioskopScreen(),
      const ProfilScreen(),
    ];
  }
}
