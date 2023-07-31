import 'package:flutter/material.dart';
import 'package:shopp/features/shopp_admin/presentation/widgets/admin_product_list.dart';

import '../widgets/bottom_bar.dart';

class ProductAdmin extends StatelessWidget {
  const ProductAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Product'),
          backgroundColor: const Color(0xFFFF9A62),
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addProduct');
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: const AdminProductList(),
        bottomNavigationBar: const BottomBar(selectedIndex: 1));
  }
}
