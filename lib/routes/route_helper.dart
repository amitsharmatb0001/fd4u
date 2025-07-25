import 'package:fd4u/pages/food/popular_food_detail.dart';
import 'package:get/get.dart';

import '../pages/food/recommended_food_detail.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper
{
  static const String initial='/';
  static const String popularFood="/popular-food";
  static const String recommendedFood="/popular-food";

  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId)=>'$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId)=>'$recommendedFood?pageId=$pageId';


  static List<GetPage> Routes =[
    GetPage(name: initial, page: ()
    {
      return MainFoodPage();

    }
    ),
    GetPage(name: popularFood, page:()
    {
      var pageId=Get.parameters['pageId'];
      return PopularFoodDetail(pageId: int.parse(pageId!));
    },
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(name: recommendedFood, page:()
    {
      var pageId=Get.parameters['pageId'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!));
    },
      transition: Transition.leftToRightWithFade,
    ),
  ];
}