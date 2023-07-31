import 'package:flutter/material.dart';
import 'package:shopp/features/shopp/presentation/widgets/big_sale_home.dart';
import 'package:shopp/features/shopp/presentation/widgets/head_bar_home.dart';
import 'package:shopp/features/shopp/presentation/widgets/search_bar_home.dart';

import '../widgets/category_list.dart';
import '../widgets/navigation_home.dart';
import '../widgets/product_lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    List categorylist = ['All', 'Clothes', 'Shoes', 'Bags', 'Watches', 'Accessories', 'Jewelry'];
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFF3E7E7),
          body: Padding(
            padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
            child: Column(
              children: [
                HeadBar(
                  height: height,
                  title: Column(
                    children: [
                      Text('Hello zakie', style: TextStyle(fontSize: height * 0.02, fontWeight: FontWeight.w400, color: const Color(0xFF5F5A5A))),
                      Text('Jakarta, IND', style: TextStyle(fontSize: height * 0.02, fontWeight: FontWeight.w700, color: const Color(0xFF131849))),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                // search bar
                Searchbar(height: height),
                SizedBox(height: height * 0.03),
                const Bigsale(),
                SizedBox(height: height * 0.02),
                CategoryList(categorylist: categorylist),
                const SizedBox(height: 20),
                const ProductLists(),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const Navigation()),
    );
  }
}
