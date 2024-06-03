import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MaiSscreenState();
}

class _MaiSscreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  void changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const Center(
        child: Text('Home'),
      ),
      const Center(
        child: Text('Profile'),
      ),
      const Center(
        child: Text('Add'),
      )
    ];
    return Scaffold(
      body:
          // IndexedStack(
          //   index: _selectedIndex,
          //   children: [...screens],
          // ),

          Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (value) {
              changeIndex(value);
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('home')),
              NavigationRailDestination(
                  icon: Icon(Icons.person), label: Text('profile')),
              NavigationRailDestination(
                  icon: Icon(Icons.add), label: Text('add')),
            ],
          ),
          Expanded(child: screens[_selectedIndex])
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: changeIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add'),
          ]),
    );
  }
}
