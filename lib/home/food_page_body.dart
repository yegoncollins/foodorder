import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, section) {
            return _buildPageItem(section);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Container(
      height: 220,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
          image: const DecorationImage(
            fit:BoxFit.cover,
            image: AssetImage
            ("assets/images/food6.jpg"
            )
            )
            ),
    );
  }
}
