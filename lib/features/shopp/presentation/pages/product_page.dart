import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/yellow_button.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
                    child: Image.asset('assets/images/woman.png', fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 41,
                            height: 41,
                            padding: const EdgeInsets.all(8),
                            decoration: const ShapeDecoration(color: Colors.white, shape: OvalBorder()),
                            child: SvgPicture.asset('assets/icons/back.svg'),
                          ),
                        ),
                        InkWell(
                          // TODO: MAKE HEART ICON WORK
                          onTap: () {
                            print('heart');
                          },
                          child: Container(
                            width: 41,
                            height: 41,
                            padding: const EdgeInsets.all(8),
                            decoration: const ShapeDecoration(color: Colors.white, shape: OvalBorder()),
                            child: SvgPicture.asset('assets/icons/heart.svg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Orange Blazer', style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Bellota Text', fontWeight: FontWeight.w400)),
                            Text('Button Classic Blazer', style: TextStyle(color: Color(0xFF5F5A5A), fontSize: 12, fontFamily: 'Bellota Text', fontWeight: FontWeight.w400)),
                          ],
                        ),
                        Text('\$250', style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Bellota Text', fontWeight: FontWeight.w400)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text('Orange blazer with soft material. Not hot comfortable  \nAvailable in various sizes. Suitable for use at parties', style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'Bellota Text', fontWeight: FontWeight.w400)),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        YellowButton(
                          title: 'Buy Now',
                          // TODO: buy now
                          onTap: () {
                            print('buy now');
                          },
                        ),
                        IconButton(
                          // TODO: add to cart
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))), minimumSize: MaterialStateProperty.all<Size>(const Size(68, 68))),
                          icon: SvgPicture.asset('assets/icons/cart.svg'),
                          // icon:Icon(Icons.add_shopping_cart),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
