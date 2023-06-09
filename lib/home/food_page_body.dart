import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodorder/home/utils/dimensions.dart';

import '../widgets/big_text.dart';
import '../widgets/icon_and_text_widget.dart';
import '../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.PageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
      height: 320,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, section) {
            return _buildPageItem(section);
          }),
    ),
    new DotsIndicator(
  dotsCount: 5,
  position: _currPageValue,
  decorator: DotsDecorator(
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
)
    
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.PageViewContainer,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              //image: const DecorationImage(
              //fit:BoxFit.cover,
              //image: AssetImage
              //("assets/images/food6.jpg"
              //)
              //)
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.PageViewTextContainer,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                     color: Color(0xFFe8e8e8),
                     blurRadius: 5.0,
                     offset: Offset(0, 5)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0)
                    )
                  ]
                  ),
                  
              child: Container(
                padding: EdgeInsets.only(Dimensions.height15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Healthy Snack"),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 232, 111, 134),
                              size: 15,
                            );
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "4.5"),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "1506"),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "comments")
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: Color.fromARGB(255, 232, 111, 134)),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "1.7Km",
                            iconColor: Color.fromARGB(255, 88, 211, 88)),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "32Min",
                            iconColor: Color.fromARGB(255, 30, 198, 228)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
