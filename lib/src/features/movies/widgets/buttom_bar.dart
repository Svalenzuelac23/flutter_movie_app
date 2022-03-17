import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      iconSize: 30,
      elevation: 0,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.explore),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.drag_indicator),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
