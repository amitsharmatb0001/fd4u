import 'package:fd4u/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
   AppIcon({Key? key,
    required this.icon,
     this.backgroundColor = const Color(0xFFfcf4e4),
     this.iconColor =const Color(0xFF756d54),
     this.size = 40,  this.iconSize = 16,
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size/2),
      ),
      child: Icon(
        icon,
      color: iconColor,
        size: Dimensions.icon16,

        //size: iconSize,
      ),
    );
  }
}
