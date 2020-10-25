import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:real_estate/models/carModel.dart';

class CarApi {
  List<CarModel> carList = new List<CarModel>();
  List<CarModel> carCompanyList = new List<CarModel>();

  Future<List<CarModel>> getAllCars() async {
    var response = await http.get(
      "http://walaaaqar.somee.com/api/productCar/GetAllCar",
    );
    var carResult = json.decode(response.body);
    print("car result ::::::::::::::::::$carResult");
    if (carResult["result"]["Message"] == "Ok") {
      for (int i = 0; i < carResult["result"]["Data"].length; i++) {
        carList.add(new CarModel(
          carResult["result"]["Data"][i]["Id"],
          carResult["result"]["Data"][i]["Title"],
          carResult["result"]["Data"][i]["Description"],
          carResult["result"]["Data"][i]["ImgSrc"],
          carResult["result"]["Data"][i]["Price"],
        ));
      }
    }
    return carList;

    // } else {
    //   return carList["message"];
    // }
  }

  Future<List<CarModel>> getAllCarsCompany() async {
    var response = await http.get(
      "http://walaaaqar.somee.com/Api/CarCampany/GetAllCarCampany",
    );
    var carResult = json.decode(response.body);
    List<CarModel> allParentsList = new List<CarModel>();
    var allParents;
    print("car company result ::::::::::::::::::$carResult");
    if (carResult["result"]["Message"] == "Ok") {
      for (int i = 0; i < carResult["result"]["Data"].length; i++) {
        // CarModel car = new CarModel( carResult["result"]["Data"][i]["Id"],
        //    carResult["result"]["Data"][i]["TitleAr"],
        //   carResult["result"]["Data"][i]["DescriptionAr"],
        //    carResult["result"]["Data"][i]["ImgSrc"],
        //    carResult["result"]["Data"][i]["Price"],)
        carCompanyList.add(new CarModel(
          carResult["result"]["Data"][i]["Id"],
          carResult["result"]["Data"][i]["TitleAr"],
          carResult["result"]["Data"][i]["DescriptionAr"],
          carResult["result"]["Data"][i]["ImgSrc"],
          carResult["result"]["Data"][i]["Price"],
          allParents: carResult["result"]["Data"][i]["Price"],
        ));
      }
      // for (int j = 0; j < carCompanyList.length; j++) {
      //   for (int i = 0; i < carCompanyList[j].allParents.length;i++){
      //   allParentsList.add(new CarModel(
      //       carCompanyList[j].id,
      //       carCompanyList[j].titleAr,
      //       carCompanyList[j].descAr,
      //       carCompanyList[j].imgUrl,
      //       carCompanyList[j].price,
      //       allParents: carCompanyList[j].allParents,
      //     ));
      //   }
         
      // }
    }
    return carCompanyList;

    // } else {
    //   return carList["message"];
    // }
  }

  Future addCarData(CarModel carModel) async {
    var response = await http.post(
      "http://walaaaqar.somee.com/api/product/CreatCar",
      body: jsonEncode({
        "Title": carModel.titleAr,
        "Description": carModel.descAr,
        "Price": carModel.price,
        "imgSrc": carModel.imgUrl
      }),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${loginApi.token}',
      },
    );
    var carResult = json.decode(response.body);
    print("car result ::::::::::::::::::$carResult");
    if (carResult["result"]["Message"] == "Ok") return "تم اضافة الاعلان بنجاح";
  }

  Future<CarModel> getCarCompanyByID(String id) async {
    var response = await http.get(
      "http://walaaaqar.somee.com/Api/CarCampany/GetIDCarCampany?id=$id",
      // body: jsonEncode({
      //   "Title": carModel.titleAr,
      //   "Description": carModel.descAr,
      //   "Price": carModel.price,
      //   "imgSrc": carModel.imgUrl
      // }),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${loginApi.token}',
      },
    );
    var carResult = json.decode(response.body);
    print("car result ::::::::::::::::::$carResult");
    CarModel carDetails = new CarModel(
      carResult["result"]["Data"]["Id"],
      carResult["result"]["Data"]["TitleAr"],
      carResult["result"]["Data"]["DescriptionAr"],
      carResult["result"]["Data"]["ImgSrc"],
      carResult["result"]["Data"]["Price"],
      // price: carResult["result"]["Data"]["Price"],
    );
    return carDetails;
    // if (carResult["result"]["Message"] == "Ok") return "تم اضافة الاعلان بنجاح";
  }
}
