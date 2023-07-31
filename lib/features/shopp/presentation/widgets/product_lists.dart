import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopp/features/shopp/presentation/providers/shopp_provider.dart';

import '../../../../config/router/routes.dart';

class ProductLists extends StatefulWidget {
  const ProductLists({
    super.key,
  });

  @override
  State<ProductLists> createState() => _ProductListsState();
}

class _ProductListsState extends State<ProductLists> {
  @override
  void initState() {
    Provider.of<ShoppProvider>(context, listen: false).getAllProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<ShoppProvider>(
        builder: (context, shopp, child) {
          if (shopp.shoppState == ShoppState.error) {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 100,
                    child: Center(child: Text(shopp.errorMessage!)),
                  );
                });
          } else if (shopp.shoppState == ShoppState.loaded) {
            return GridView.builder(
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
                                const Text('Casual T-shirt'),
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
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 12, mainAxisExtent: 250),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                enabled: true,
                child: InkWell(
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
                                const Text('Casual T-shirt'),
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
