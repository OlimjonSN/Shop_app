import 'package:flutter/material.dart';

class Bigsale extends StatelessWidget {
  const Bigsale({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 113,
          width: double.infinity,
          decoration: ShapeDecoration(color: const Color(0xFFFF9A62), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)), shadows: const [BoxShadow(color: Color(0xFFFF9A62), blurRadius: 8, offset: Offset(0, 3), spreadRadius: 1)]),
          child: Padding(
            padding: const EdgeInsets.only(left: 150, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Big Sale\n',
                    style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Get the trendy \nFashion at a discount \nof up to 50% ',
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: -22,
          child: Image.asset('assets/images/opa.png'),
        ),
      ],
    );
  }
}
