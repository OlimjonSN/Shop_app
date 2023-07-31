import 'package:flutter/material.dart';

class ProfileAdmin extends StatelessWidget {
  const ProfileAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Colors.grey[600],
          elevation: 0.0,
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/xola.png'),
            ),
            const Text('data@gmail.com'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              color: Colors.amber,
              width: double.infinity,
              child: Text('45'),
            )
          ],
        ));
  }
}
