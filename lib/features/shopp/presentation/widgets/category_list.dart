import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopp/features/shopp/presentation/providers/shopp_provider.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    super.key,
    required this.categorylist,
  });

  final List categorylist;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    Provider.of<ShoppProvider>(context, listen: false).getCategories();
    super.initState();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppProvider>(
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
          return SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: shopp.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: selectedIndex == index ? const Color(0xFFFF9A62) : const Color(0xFFDED9D9)),
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Text(
                      shopp.categories[index],
                      style: TextStyle(color: selectedIndex == index ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categorylist.length,
            itemBuilder: (BuildContext context, int index) {
              return Shimmer.fromColors(
                enabled: true,
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: selectedIndex == index ? const Color(0xFFFF9A62) : const Color(0xFFDED9D9)),
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Text(
                      widget.categorylist[index],
                      style: TextStyle(color: selectedIndex == index ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
