import 'package:flutter/material.dart';

//BottomNavigationBar Package
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

//Pages
import 'package:vacunapp/src/pages/pages.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetsOptions = [
    HomePage(),
    ExplorePage(),
    HistoryPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetsOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.black,
        ),
        child: SalomonBottomBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: const Color.fromARGB(255, 153, 153, 153),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Inicio"),
              selectedColor: Colors.white,
            ),

            /// Explore
            SalomonBottomBarItem(
              icon: const Icon(Icons.explore),
              title: const Text("Explorar"),
              selectedColor: Colors.white,
            ),

            /// History
            SalomonBottomBarItem(
              icon: const Icon(Icons.list_outlined),
              title: const Text("Historial"),
              selectedColor: Colors.white,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Perfil"),
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
