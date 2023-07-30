import 'package:flutter/material.dart';
import 'package:shopp/features/shopp/presentation/widgets/big_sale_home.dart';
import 'package:shopp/features/shopp/presentation/widgets/head_bar_home.dart';
import 'package:shopp/features/shopp/presentation/widgets/search_bar_home.dart';

import '../../../../config/router/routes.dart';
import '../widgets/categoryList.dart';
import '../widgets/navigation_home.dart';

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
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 12, mainAxisExtent: 250),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteGenerator.productPage);
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 8,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(width: double.infinity, 'assets/images/xola.png', fit: BoxFit.cover),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text('Casual T-shirt\n\$35'),
                                      InkWell(
                                        onTap: () {
                                          print('heart');
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFFF9A62),
                                            shape: BoxShape.circle,
                                            boxShadow: [BoxShadow(blurRadius: 2, color: Color(0xFFFF9A62), spreadRadius: 5)],
                                          ),
                                          child: const Icon(size: 16, Icons.favorite_outline, color: Colors.white),
                                        ),
                                      )
                                    ],
                                  )),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const Navigation()),
    );
  }
}
