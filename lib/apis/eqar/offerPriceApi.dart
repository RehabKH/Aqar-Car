import 'dart:convert';

import 'package:real_estate/models/eqar/productModel.dart';
import 'package:http/http.dart' as http;

class OfferPriceApi {
  List<ProductModel> offerList = new List<ProductModel>();
  Future<List<ProductModel>> getOfferPriceData() async {
    var response = await http.get(
      "http://walaaaqar.somee.com/Api/pricing/GetAll",
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
    if (announceResult["result"]["Message"] == "Ok man")
      for (int i = 0; i < announceResult["result"]["Data"].length; i++) {
        offerList.add(new ProductModel(
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
          announceResult["result"]["Data"][i]["AcarSpace"],
          announceResult["result"]["Data"][i]["bodyType"],
          announceResult["result"]["Data"][i]["hoseType"],
          announceResult["result"]["Data"][i]["AcarBathRoomCount"],
          announceResult["result"]["Data"][i]["rantType"],
          announceResult["result"]["Data"][i]["UserId"],
           announceResult["result"]["Data"][i]["Latitude"],

          announceResult["result"]["Data"][i]["Longitute"],
        ));
        // offerList.add(new ProductModel(
        //     id: announceResult["result"]["Data"][i]["Id"],
        //     title: announceResult["result"]["Data"][i]["Title"],
        //     desc: announceResult["result"]["Data"][i]["Description"],
        //     price: announceResult["result"]["Data"][i]["Price"],
        //     imgUrl: announceResult["result"]["Data"][i]["ImgSrc"]));
      }
    return offerList;
  }
}
