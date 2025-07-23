import 'package:fd4u/pages/home/food_page_body.dart';
import 'package:fd4u/utils/colors.dart';
import 'package:fd4u/utils/dimensions.dart';
import 'package:fd4u/widgets/big_text.dart';
import 'package:fd4u/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("Current height is ${MediaQuery.of(context).size.width}");
    return Scaffold(
      body: Column(
        children: [
          // showing hedar
          Container(
            child: Container(
              margin: EdgeInsets.only(top:Dimensions.height45,bottom: Dimensions.height15 ),
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "India",color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "bhilwara",color: Colors.black,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search_rounded,color:Colors.white, size: Dimensions.icon24,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],

              ),
            ),
          ),
          //showing body
          Expanded(child: SingleChildScrollView(
          child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
