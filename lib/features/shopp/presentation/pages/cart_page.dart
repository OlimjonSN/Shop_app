import 'package:flutter/material.dart';
import 'package:shopp/features/shopp/presentation/widgets/head_bar_home.dart';
import 'package:shopp/features/shopp/presentation/widgets/yellow_button.dart';

import '../widgets/navigation_home.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: const Color(0xFFF3E7E7),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: HeadBar(
              height: height,
              title: const Text('Cart', style: TextStyle(color: Color(0xFF131849), fontSize: 15, fontFamily: 'Bellota Text', fontWeight: FontWeight.w700)),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: height * 0.65,
            child: ListView.builder(
              itemCount: 3,
              padding: const EdgeInsets.symmetric(horizontal: 26),
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(bottom: 13),
                  decoration: ShapeDecoration(color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 13.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18.0),
                          child: Image.asset('assets/images/woman.png'),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 13.0, bottom: 13.0, right: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // const SizedBox(width: 10),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Casual V-neck', style: TextStyle(color: Color(0xFF131849), fontSize: 14, fontFamily: 'Bellota Text', fontWeight: FontWeight.w600)),
                                  Text('Women Style', style: TextStyle(color: Color(0xFF5F5A5A), fontSize: 11, fontFamily: 'Bellota Text', fontWeight: FontWeight.w400)),
                                  Spacer(),
                                  Text('\$120', style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Bellota Text', fontWeight: FontWeight.w600)),
                                ],
                              ),
                              // const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                    // checkColor: ,
                                    fillColor: const MaterialStatePropertyAll(Color(0xFFFF9A62)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                        style: const ButtonStyle(
                                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                                          minimumSize: MaterialStatePropertyAll(Size(30, 10)),
                                        ),
                                        onPressed: () {},
                                        child: const Text('-', style: TextStyle(color: Color(0xFF131849), fontSize: 15.56, fontFamily: 'Bellota Text', fontWeight: FontWeight.w700)),
                                      ),
                                      const Text('1', style: TextStyle(color: Color(0xFF131849), fontSize: 15.56, fontFamily: 'Bellota Text', fontWeight: FontWeight.w700)),
                                      TextButton(
                                        style: const ButtonStyle(
                                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                                          minimumSize: MaterialStatePropertyAll(Size(30, 10)),
                                        ),
                                        onPressed: () {},
                                        child: const Text('+', style: TextStyle(color: Color(0xFF131849), fontSize: 15.56, fontFamily: 'Bellota Text', fontWeight: FontWeight.w700)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total', style: TextStyle(color: Color(0xFF444444), fontSize: 20, fontFamily: 'Bellota Text', fontWeight: FontWeight.w600)),
                    Text('\$480.00', style: TextStyle(color: Colors.black, fontSize: 24, fontFamily: 'Bellota Text', fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.45,
                  child: const YellowButton(title: 'Pay Now'),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: const Navigation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
