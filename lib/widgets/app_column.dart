import 'package:fd4u/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BigText(text: text, size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: List.generate(5,(index) {return Icon(Icons.star, color:AppColors.mainColor,size: 15,);}),
            ),

            SizedBox(width: Dimensions.width10,),
            SmallText(text: "4.5"),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "500"),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "comments")

          ],
        ),
        SizedBox(height: Dimensions.height10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(icon: Icons.circle_sharp,
                text: "normal",
                iconColor: AppColors.iconColor),

            IconAndTextWidget(icon: Icons.circle_sharp,
                text: "5km",
                iconColor: AppColors.mainColor),

            IconAndTextWidget(icon: Icons.access_time_rounded,
                text: "25min",
                iconColor: AppColors.iconColor2)
          ],
        )
      ],
    );
  }
}
