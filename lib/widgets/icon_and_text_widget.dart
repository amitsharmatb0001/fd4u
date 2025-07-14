import 'package:fd4u/utils/dimensions.dart';
import 'package:fd4u/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
   IconAndTextWidget({Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: Dimensions.icon24,),
        SizedBox(width: Dimensions.width5,),
        SmallText(text: text,),
      ],
    );
  }
}
