
import 'package:flutter/material.dart';

import 'package:foodorder/home/food_page_body.dart';
import 'package:foodorder/widgets/big_text.dart';
import 'package:foodorder/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  get borderRadius => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
      child: Container(
        margin: EdgeInsets.only(top: 45, bottom: 15),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                  BigText(text: "Nakuru",color: Color.fromARGB(255, 232, 111, 134),),
                  Row(
                    children: [
                      SmallText(text: "Kiamunyi",color: Color.fromARGB(255, 48, 47, 47), ),
                      const Icon(Icons.arrow_drop_down_rounded)
                    ],
                  )
              ],
            ),
            Center(
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 232, 111, 134),
                ),
                child: const Icon(Icons.search, color:Colors.white),
              ),
            )
          ],
        ),
      ),
    ),

     const FoodPageBody(),

        ],
      ),
    );
  }
}
