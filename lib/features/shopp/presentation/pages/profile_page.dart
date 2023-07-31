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
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
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
              child: ListTile(
                style: ListTileStyle.list,
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/xola.png'),
                ),
                title: const Text(
                  'Name',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                ),
                subtitle: const Text(
                  'Email',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: const Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text('My Account'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.face),
                    ),
                    title: Text('face ID'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.lock),
                    ),
                    title: Text('two-factor authentication'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.logout),
                    ),
                    title: Text('Log-out'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const Navigation(),
    );
  }
}
