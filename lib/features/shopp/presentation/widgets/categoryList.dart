import 'package:flutter/material.dart';

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
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categorylist.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: FilledButton(
                style: FilledButton.styleFrom(backgroundColor: selectedIndex == index ? Color(0xFFFF9A62) : Colors.grey),
                onPressed: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Text(
                  widget.categorylist[index],
                  style: TextStyle(color: selectedIndex == index ? Colors.white : Colors.black),
                )),
          );
        },
      ),
    );
  }
}
