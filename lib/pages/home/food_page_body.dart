import 'package:dots_indicator/dots_indicator.dart';
import 'package:fd4u/controllers/popular_product_controller.dart';
import 'package:fd4u/controllers/recommended_product_controller.dart';
import 'package:fd4u/models/product_model.dart';
import 'package:fd4u/routes/route_helper.dart';
import 'package:fd4u/utils/app_constants.dart';
import 'package:fd4u/utils/colors.dart';
import 'package:fd4u/utils/dimensions.dart';
import 'package:fd4u/widgets/app_column.dart';
import 'package:fd4u/widgets/big_text.dart';
import 'package:fd4u/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../food/popular_food_detail.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: .85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print("Current value is $_currPageValue");
      });
    });
  }
  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isLoaded?Container(
            //color: Colors.pink,
            height: Dimensions.pageView,

              child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProducts.popularProductList.length,
                  itemBuilder: (context,position){
                    return _buildPageItem(position,popularProducts.popularProductList[position]);
                  }),

          ):CircularProgressIndicator();
        }),
       /* DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            colors: [
              Colors.grey[300]!,
              Colors.grey[400]!,
              Colors.grey[500]!,
              Colors.grey[600]!,
              Colors.grey[700]!,
            ],
            activeColors: [
              Colors.red[300]!,
              Colors.red[400]!,
              Colors.red[500]!,
              Colors.red[600]!,
              Colors.red[700]!,
            ],
          ),
        ),*/

         GetBuilder<PopularProductController>(builder: (popularProducts){
           return new DotsIndicator(
           dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
           position: _currPageValue,
    decorator: DotsDecorator(
    shape: const Border(),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    );
    }),
        /*DotsIndicator(
   dotsCount: 11,
    position: _currPageValue,
    decorator: DotsDecorator(
    activeColor: AppColors.mainColor,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    )*/
        //popular text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "recommended"),
              SizedBox(width: Dimensions.width10,),
              Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(text: "..",color: Colors.black26,)
              ),
              SizedBox(width: Dimensions.width10,),
              Container(

                child: SmallText(text: "food paring"),
              )
            ],
          ),
        ),
          //recommend food

        //list of food & image

        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recommendedProduct.recommendedProductList.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getRecommendedFood(index, "home"));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
                    child: Row(
                        children: [
                          // showing image section
                          Container(
                            height: Dimensions.listViewImgSize,
                            width:Dimensions.listViewImgSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white38,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!
                                    )
                                )
                            ),
                          ),
                          // showing text section
                          Expanded(
                            child: Container(
                              height: Dimensions.listViewTextConstSize,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(Dimensions.radius20),
                                    bottomRight: Radius.circular(Dimensions.radius20)
                                ),
                                color: Colors.white,

                              ),
                              child: Padding(
                                padding:EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                    SizedBox(height: Dimensions.height10,),
                                    SmallText(text: "with ice cream"),
                                    SizedBox(height: Dimensions.height10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(icon: Icons.circle_sharp,
                                          text: "normal",
                                          iconColor: AppColors.iconColor,),
                                        IconAndTextWidget(icon: Icons.location_on,
                                          text: "1.7km",
                                          iconColor: AppColors.mainColor,),
                                        IconAndTextWidget(icon: Icons.access_time_rounded,
                                          text: "32min",
                                          iconColor: AppColors.iconColor2,),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )


                        ]
                    ),
                  ),
                );

              }):CircularProgressIndicator();
    }),


      ],
    );
  }
  Widget _buildPageItem(int index, ProductModel popularProduct){
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1,1,1)..setTranslationRaw(0,currTrans,0);
    }

    else if(index == _currPageValue.floor()+1) {
      var currScale = _scaleFactor +
          (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1,1,1);
      matrix = Matrix4.diagonal3Values(1,1,1)..setTranslationRaw(0,currTrans,0);
    }
    else if(
    index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1,currScale,1);
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,currTrans,0);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,_height*(1-currScale)/2,1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(

            onTap: (){

              Get.toNamed(RouteHelper.getPopularFood(index,"home"));
            },

            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: index.isEven?Color(0xffff1744):Color(0xff69c5df),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+popularProduct.img!))
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.height30,bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0,5)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5,0)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(5,0)
                    )
                  ]

              ),
              child: Container(
                padding: EdgeInsetsGeometry.only(top: Dimensions.height10,left: Dimensions.width10,right: Dimensions.width10,),
                child: AppColumn(text: popularProduct.name!),
              ),

            ),
          )
        ],
      ),
    );
  }
}
