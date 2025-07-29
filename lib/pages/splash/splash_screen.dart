import 'dart:async';

import 'package:fd4u/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;
 Future<void> _loadResources() async{
    await Future.delayed(const Duration(seconds: 7));
   await Get.find<PopularProductController>().getPopularProductList();
   await Get.find<RecommendedProductController>().getRecommendedProductList();
   await Get.find<CartController>();
  }
  @override
  void initState(){
    super.initState();
    _loadResources();
    controller =  AnimationController(vsync: this, duration: const Duration(seconds: 5))..forward();
    animation =  CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(
        const Duration(seconds: 7),
            ()=>Get.offNamed(RouteHelper.getInitial())
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition( scale: animation,

              child: Center(child: Image.asset("assets/image/logo.png",width: Dimensions.splashImg))),
          Center(child: Image.asset("assets/image/tagline.png",width: Dimensions.splashImg),)
        ],
      ),
    );
  }
}
