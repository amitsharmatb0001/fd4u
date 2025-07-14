import 'package:fd4u/utils/colors.dart';
import 'package:fd4u/utils/dimensions.dart';
import 'package:fd4u/widgets/app_icon.dart';
import 'package:fd4u/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/expandable_text_widget.dart';



class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.clear),
                Icon(Icons.shopping_cart_outlined)

              ],
            ),
            bottom: PreferredSize(preferredSize: Size.fromHeight(20),
                child: Container(
                   child:  Center(child: BigText(size:Dimensions.font26,text: "coffe"),),
                    width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5,bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20)
                    ),
                  ),
                ),
            ),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/image/food1.png",
              width: double.maxFinite,
              fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(

            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: ExpandableTextWidget(text: "Cold coffee is a beloved beverage, especially in warmer climates like India, where it offers a refreshing escape from the heat.Cold coffee is a beloved beverage, especially in warmer climates like India, where it offers a refreshing escape from the heat.Cold coffee is a beloved beverage, especially in warmer climates like India, where it offers a refreshing escape from the heat.It's the ideal companion for warm afternoons, a perfect pick-me-up during a busy day, or a delightful treat for moments of pure relaxation. From the simple elegance of a black iced coffee to the decadent luxury of a blended mocha frappe, cold coffee offers a versatile and utterly enjoyable experience for every coffee lover. Its coolness provides instant relief, while its caffeine kick gently energizes, making it a beloved choice for any time you crave a cool, comforting, and flavorful escape.It's the ideal companion for warm afternoons, a perfect pick-me-up during a busy day, or a delightful treat for moments of pure relaxation. From the simple elegance of a black iced coffee to the decadent luxury of a blended mocha frappe "),
    )
        ],
      )
          ),
      ],
      ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20*2.5,right: Dimensions.width20*2.5,bottom: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.remove,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor, 
                    iconSize: Dimensions.icon24,),
                  BigText(text: "\₹ 100 "+" x "+" 0 ",color: AppColors.mainBlackColor,size: Dimensions.font26,),
                  AppIcon(icon: Icons.add,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.icon24,)
                ],

              ),
            ),
            Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20*2),
                      topRight: Radius.circular(Dimensions.radius20*2)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                    child: BigText(text: "\₹100 | add to cart",color: Colors.white),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor
                    ),
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}
