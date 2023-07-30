import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopp/features/shopp/presentation/widgets/headBar_home.dart';
import 'package:shopp/features/shopp/presentation/widgets/searchBar_home.dart';

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
    return Scaffold(
        backgroundColor: const Color(0xFFF3E7E7),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
          child: Column(
            children: [
              headBar(height: height),
              SizedBox(
                height: height * 0.02,
              ),
              // search bar
              searchbar(height: height),
              SizedBox(
                height: height * 0.03,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: height * 0.165,
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFF9A62),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0xFFFF9A62),
                          blurRadius: 15,
                          offset: Offset(0, 5),
                          spreadRadius: 3,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      top: -20,
                      left: -22,
                      child: Image.asset(
                        'assets/images/opa.png',
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
