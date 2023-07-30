import 'package:flutter/material.dart';
import 'package:shopp/features/shopp/presentation/widgets/navigation_home.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFFF9A62),
              ),
              child: const ListTile(
                style: ListTileStyle.list,
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/xola.png'),
                ),
                title: Text(
                  'Name',
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  'Email',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Navigation(),
    );
  }
}
