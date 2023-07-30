import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeadBar extends StatelessWidget {
  const HeadBar({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 35,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {},
        child: CircleAvatar(
          radius: height * 0.02,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: SvgPicture.asset(
              'assets/icons/category.svg',
              height: height * 0.045,
            ),
          ),
        ),
      ),
      title: Column(
        children: [
          Text('Hello zakie', style: TextStyle(fontSize: height * 0.02, fontWeight: FontWeight.w400, color: const Color(0xFF5F5A5A))),
          Text('Jakarta, IND', style: TextStyle(fontSize: height * 0.02, fontWeight: FontWeight.w700, color: const Color(0xFF131849))),
        ],
      ),
      actions: [
        CircleAvatar(
          radius: height * 0.03,
          // use image network
          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1690371316561-9462fef3de91?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80'),
        ),
      ],
    );
  }
}
