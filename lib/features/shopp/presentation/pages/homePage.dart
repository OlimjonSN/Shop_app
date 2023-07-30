import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopp/features/shopp/presentation/widgets/bigSale_home.dart';
import 'package:shopp/features/shopp/presentation/widgets/headBar_home.dart';
import 'package:shopp/features/shopp/presentation/widgets/searchBar_home.dart';

import '../widgets/categoryList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    List categorylist = ['All', 'Clothes', 'Shoes', 'Bags', 'Watches', 'Accessories', 'Jewelry'];
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFF3E7E7),
          body: Padding(
            padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
            child: Column(
              children: [
                HeadBar(height: height),
                SizedBox(
                  height: height * 0.02,
                ),
                // search bar
                Searchbar(height: height),
                SizedBox(
                  height: height * 0.03,
                ),
                const Bigsale(),
                SizedBox(
                  height: height * 0.02,
                ),
                CategoryList(categorylist: categorylist),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 250,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 8,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    width: double.infinity,
                                    'assets/images/xola.png',
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text('Casual T-shirt\n\$35'),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFFF9A62),
                                        shape: BoxShape.circle,
                                        boxShadow: [BoxShadow(blurRadius: 2, color: Color(0xFFFF9A62), spreadRadius: 5)],
                                      ),
                                      child: const Icon(
                                        size: 16,
                                        Icons.favorite_outline,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )),
                            const SizedBox(height: 5),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            height: 55,
            width: width * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 7, offset: Offset(1, 5), spreadRadius: 2)],
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/home.svg', height: 30, width: 30, color: Color(0xFF969191)),
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0), child: IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/cart.svg', height: 30, width: 30, color: Color(0xFF969191)))),
              IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/user.svg', height: 30, width: 30, color: Color(0xFF969191))),
            ]),
          )),
    );
  }
}
