import 'package:flutter/material.dart';

import '../widgets/admin_category_list.dart';
import '../widgets/bottom_bar.dart';

class CategoyAdmin extends StatelessWidget {
  const CategoyAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Category'),
          backgroundColor: const Color(0xFFFF9A62),
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addCategory');
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: const AdminCategoryList(),
        bottomNavigationBar: const BottomBar(selectedIndex: 0));
  }
}
