import 'package:flutter/material.dart';
import 'package:shopp/features/shopp_admin/presentation/widgets/bottom_bar.dart';

class CategoyAdmin extends StatelessWidget {
  const CategoyAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/xola.png'),
              ),
              title: const Text('Gadjets'),
              subtitle: const Text('sifatli mahsulotlar'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomBar(
          selectedIndex: 0,
        ));
  }
}
