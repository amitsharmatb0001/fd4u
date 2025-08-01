import 'package:fd4u/pages/food/popular_food_detail.dart';
import 'package:fd4u/pages/home/home_page.dart';
import 'package:fd4u/pages/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../pages/cart/cart_page.dart';
import '../pages/food/recommended_food_detail.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper
{
  static const String splashScreen='/splash-screen';
  static const String initial='/';
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";
  static const String cartPage="/cart-page";

  static String getSplashScreen()=>'$splashScreen';
  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId, String page)=>'$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page)=>'$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage()=>'$cartPage';


  static List<GetPage> Routes =[

    GetPage(name: splashScreen, page: ()=>SplashScreen()),

    GetPage(name: initial, page: ()
    {
      return HomePage();

    }
    ),
    GetPage(name: popularFood, page:()
    {
      var pageId=Get.parameters['pageId'];
      var page=Get.parameters['page'];
      return PopularFoodDetail(pageId: int.parse(pageId!), page:page!,);
    },
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(name: recommendedFood, page:()
    {
      var pageId=Get.parameters['pageId'];
      var page=Get.parameters['page'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!),page:page!,);
    },
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: cartPage, page:()
    {
      return CartPage();
    },
     transition: Transition.leftToRightWithFade,
    )
  ];
}