import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:real_estate/models/eqar/productModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:real_estate/models/officeModel.dart';

class ProductApi {
  List<ProductModel> productList = new List<ProductModel>();
  Future addProductData(ProductModel productModel) async {
    await getUserID().then((value) {});
    print("user id::::::::::::::::::::::::::::::::::::::::::::::::::$userID");
    var response = await http.post(
      "http://walaaaqar.somee.com/api/product/CreatAcar",
      body: jsonEncode({
        "Title": productModel.title,
        "Description": productModel.desc,
        "Price": productModel.price,
        "imgSrc": productModel.imgUrl,
        "ForRent": false,
        "ForSell": true,
        "Address": productModel.address,
        "AcarAge": productModel.eqarAge,
        "AcarFloor": productModel.eqarFloor,
        "AcarResptionCount": productModel.eqarResiption,
        "AcarSpace": productModel.eqarSpace,
        "bodyType": productModel.homeType,
        "hoseType": productModel.homeType,
        "AcarBathRoomCount": productModel.pathRoomCount,
        "rantType": productModel.rentType,
        "UserId": userID
      }),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${loginApi.token}',
      },
    );
    var result = jsonEncode({
      "Title": productModel.title,
      "Description": productModel.desc,
      "Price": productModel.price,
      "imgSrc": productModel.imgUrl,
      "ForRent": false,
      "ForSell": true,
      "Address": productModel.address,
      "AcarAge": productModel.eqarAge,
      "AcarFloor": productModel.eqarFloor,
      "AcarResptionCount": productModel.eqarResiption,
      "AcarSpace": productModel.eqarSpace,
      "bodyType": productModel.homeType,
      "hoseType": productModel.homeType,
      "AcarBathRoomCount": productModel.pathRoomCount,
      "rantType": productModel.rentType,
      "UserId": productModel.userId
    });
    print("json result ::::::::::::::::::::::" + result);
    var addProductResult = json.decode(response.body);
    print("addProductResult ::::::::::::::::::$addProductResult");
    if (addProductResult["result"]["Message"] == "Ok")
      return "تم اضافة الاعلان بنجاح";
  }

  Future<List<ProductModel>> getAllAnnounceData() async {
    var response = await http.get(
      "http://walaaaqar.somee.com/api/productAcar/GetAll",
      // body: jsonEncode({
      //   "Title": productModel.title,
      //   "Description": productModel.desc,
      //   "Price": productModel.price,
      //   "imgSrc": productModel.imgUrl
      // }),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${loginApi.token}',
      },
    );
    var announceResult = json.decode(response.body);
    print("announceResult ::::::::::::::::::$announceResult");
    if (announceResult["result"]["Message"] == "Ok")
      for (int i = 0; i < announceResult["result"]["Data"].length; i++) {
        productList.add(new ProductModel(
          announceResult["result"]["Data"][i]["Id"],
          announceResult["result"]["Data"][i]["Title"],
          announceResult["result"]["Data"][i]["Description"],
          announceResult["result"]["Data"][i]["Price"],
          announceResult["result"]["Data"][i]["ImgSrc"],
          announceResult["result"]["Data"][i]["ForRent"],
          announceResult["result"]["Data"][i]["ForSell"],
          announceResult["result"]["Data"][i]["Address"],
          announceResult["result"]["Data"][i]["AcarAge"],
          announceResult["result"]["Data"][i]["AcarFloor"],
          announceResult["result"]["Data"][i]["AcarResptionCount"],
          announceResult["result"]["Data"][i]["AcarSpace"].toString(),
          announceResult["result"]["Data"][i]["bodyType"],
          announceResult["result"]["Data"][i]["hoseType"],
          announceResult["result"]["Data"][i]["AcarBathRoomCount"].toString(),
          announceResult["result"]["Data"][i]["rantType"],
          announceResult["result"]["Data"][i]["UserId"],
          announceResult["result"]["Data"][i]["Latitude"],

          announceResult["result"]["Data"][i]["Longitute"],

        ));
      }
    return productList;
  }

  String userID;
  bool isLoggedIn;
  
  Future<String> getUserID() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool("isLoggedIn");
    userID = prefs.getString("userID");
    // return prefs.getString("userID");
  }
}
