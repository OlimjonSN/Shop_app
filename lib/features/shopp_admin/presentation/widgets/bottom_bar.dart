import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  BottomBar({super.key, required this.selectedIndex});
  int selectedIndex;
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: (int index) {
        print(widget.selectedIndex);
        widget.selectedIndex = index;

        if (index == 0) {
          Navigator.pushNamed(context, '/categoryAdmin');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/productAdmin');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/profileAdmin');
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.category,
            color: widget.selectedIndex == 0 ? Colors.blue : Colors.grey,
          ),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag,
            color: widget.selectedIndex == 1 ? Colors.blue : Colors.grey,
          ),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: widget.selectedIndex == 2 ? Colors.blue : Colors.grey,
          ),
          label: 'profile',
        ),
      ],
    );
  }
}
