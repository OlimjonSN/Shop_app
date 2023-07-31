import 'package:flutter/material.dart';
import 'package:shopp/features/shopp_admin/presentation/widgets/bottom_bar.dart';

class ProfileAdmin extends StatelessWidget {
  const ProfileAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFFFF9A62),
        elevation: 0.0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/xola.png'),
            ),
            const Text(
              'data@gmail.com',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              color: Colors.amber,
              height: 50,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      'data',
                      style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.amber,
              height: 50,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      'example@gmail.com',
                      style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 2,
      ),
    );
  }
}
