import 'package:flutter/material.dart';
import 'package:shopp/features/shopp_admin/presentation/widgets/bottom_bar.dart';

class ProductAdmin extends StatelessWidget {
  const ProductAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
          backgroundColor: Colors.grey[600],
          elevation: 0.0,
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
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
              title: const Text('Galaxy S21 Ultra'),
              subtitle: const Text('ajoyib kamera'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomBar());
  }
}
