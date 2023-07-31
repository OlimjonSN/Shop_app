import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/features/shopp_admin/presentation/widgets/bottom_bar.dart';

import '../providers/shopp_admin_procider.dart';
import '../widgets/admin_category_list.dart';

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
        body: AdminCategoryList(onRefresh: Provider.of<ShoppAdminProvider>(context, listen: false).getCategories),
        bottomNavigationBar: const BottomBar(selectedIndex: 0));
  }
}
