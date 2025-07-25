import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String,String> _mainHeaders;
  late Duration timeout;

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 60);
    token = AppConstants.TOKEN;
    _mainHeaders={
      'Content-type':'application/json; charset=UTF-8',
      //'Accept':'application/json',
      'Authorization':'Bearer $token'
    };
    //httpClient.baseUrl = appBaseUrl;
}
Future<Response> getData(String uri)async {
  try {
    Response response = await get(uri);
    return response;
  } catch (e) {
    print(e.toString());
    return Response(statusCode: 1, statusText: e.toString());
  }
}
}