import 'package:fd4u/models/product_model.dart';
import 'package:get/get.dart';
import '../data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList=[];
  List<ProductModel> get recommendedProductList=>_recommendedProductList;
  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;


  Future<void> getRecommendedProductList()async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      print("got");
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
      print(_recommendedProductList);
    }else{
      print("error");
    }
  }



}