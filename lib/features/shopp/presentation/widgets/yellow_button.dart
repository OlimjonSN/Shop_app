import 'package:flutter/material.dart';

class YellowButton extends StatelessWidget {
  final String title;
  const YellowButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFF9A62)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(const Size(210, 61)),
      ),
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Bellota Text', fontWeight: FontWeight.w700)),
    );
  }
}
