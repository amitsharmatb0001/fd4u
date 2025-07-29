import 'package:fd4u/pages/cart/cart_page.dart';
import 'package:fd4u/pages/food/popular_food_detail.dart';
import 'package:fd4u/pages/food/recommended_food_detail.dart';
import 'package:fd4u/pages/home/food_page_body.dart';
import 'package:fd4u/pages/home/main_food_page.dart';
import 'package:fd4u/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          title: "flutter",
          debugShowCheckedModeBanner: false,
          initialRoute: RouteHelper.getSplashScreen(),
          getPages: RouteHelper.Routes,
        );

      });

    });
  }
}



