import 'package:flutter/material.dart';
import 'package:foodorder/widgets/small_text.dart';
import 'package:google_fonts/google_fonts.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  
  final Color iconColor;
  const IconAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
         
        ),
      ],
    );
  }
}
