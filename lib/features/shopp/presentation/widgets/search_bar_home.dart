import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Color(0xFFFF9A62))),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Colors.transparent)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: '\tSearch',
            hintStyle: const TextStyle(color: Color(0xFF7C7C7C), fontSize: 15, fontWeight: FontWeight.w400),
          ),
          // style: const TextStyle(fontSize: 25),
          showCursor: false,
        )),
        const SizedBox(width: 10),
        // TODO: Remove inkwell hover effect
        InkWell(
          onTap: () {},
          child: Container(
            height: height * 0.075,
            width: height * 0.075,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF9A62).withOpacity(0.5),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                  spreadRadius: 3, // changes position of shadow
                ),
              ],
              color: const Color(0xFFFF9A62),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.search, color: Colors.white),
          ),
        )
      ],
    );
  }
}
