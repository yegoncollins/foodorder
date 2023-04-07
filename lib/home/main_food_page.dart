import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  get borderRadius => null;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Container(
         child: Row(
          children: [
            borderRadius:BorderRadius.circular(10),
            color:Colors.blue,
          ),
         )
          ],
         );,
         
        
      ),
    );
  }
}