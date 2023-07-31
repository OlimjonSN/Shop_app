import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../providers/shopp_admin_procider.dart';

class AdminCategoryList extends StatefulWidget {
  final VoidCallback onRefresh;
  const AdminCategoryList({
    super.key,
    required this.onRefresh,
  });

  @override
  State<AdminCategoryList> createState() => _AdminCategoryListState();
}

class _AdminCategoryListState extends State<AdminCategoryList> {
  @override
  void initState() {
    widget.onRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppAdminProvider>(
      builder: (context, admin, child) {
        if (admin.shoppAdminState == ShoppAdminState.error) {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 100,
                  child: Center(child: Text(admin.errorMessage!)),
                );
              });
        } else if (admin.shoppAdminState == ShoppAdminState.loaded) {
          return ListView.builder(
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
          );
        }
        return ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              enabled: true,
              child: ListTile(
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
              ),
            );
          },
        );
      },
    );
  }
}
