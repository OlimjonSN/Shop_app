// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/router/routes.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 55,
      width: width * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 7, offset: Offset(1, 5), spreadRadius: 2)],
      ),
      // TODO: Remove icon buttons hover effect
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteGenerator.home);
            },
            icon: SvgPicture.asset('assets/icons/home.svg', height: 30, width: 30, color: const Color(0xFF969191)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteGenerator.cartPage);
              },
              icon: SvgPicture.asset('assets/icons/cart.svg', height: 30, width: 30, color: const Color(0xFF969191)),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteGenerator.profilePage);
            },
            icon: SvgPicture.asset('assets/icons/user.svg', height: 30, width: 30, color: const Color(0xFF969191)),
          ),
        ],
      ),
    );
  }
}
