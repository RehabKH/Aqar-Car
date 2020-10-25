import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:real_estate/models/eqar/productModel.dart';
// import 'package:real_estate/models/offerModel.dart';

class EqarApi {
  Future<String> getContactMessage() async {
    var response = await http.get(
      "http://walaaaqar.somee.com/api/ContactData/GetAllContactDatas",
    );
    var contactResult = json.decode(response.body);
    print("contact result ::::::::::::::::::$contactResult");
    // if (contactResult["result"]["Message"] == "ok")
    return contactResult["result"]["Data"]["AboutUsDescriptionAr"];
  }

  Future getCalculatorData() async {
    var response = await http.get(
      "http://walaaaqar.somee.com/api/pages/GetCalculator",
    );
    var calculatorResult = json.decode(response.body);
    print("calculator result ::::::::::::::::::$calculatorResult");
    // if (contactResult["result"]["Message"] == "ok")
    return calculatorResult["result"]["Data"];
  }

  Future getFacilitiesData() async {
    var response = await http.get(
      "http://walaaaqar.somee.com/api/pages/GetFacilities",
    );
    var facilityResult = json.decode(response.body);
    print("facilityResult result ::::::::::::::::::$facilityResult");
    // if (contactResult["result"]["Message"] == "ok")
    return facilityResult["result"]["Data"];
  }

  Future getMarketingAnswerData() async {
    var response = await http.get(
      "http://walaaaqar.somee.com/api/pages/GetMarkitingAnswer",
    );
    var marketingResult = json.decode(response.body);
    print("marketingResult result ::::::::::::::::::$marketingResult");
    // if (contactResult["result"]["Message"] == "ok")
    return marketingResult["result"]["Data"];
  }
    List<ProductModel> offerList = new List<ProductModel>();

  Future<List<ProductModel>> getOffersData() async {
    var response = await http.get(
      "http://walaaaqar.somee.com/Api/pricing/GetAll",
    );
    var offersResult = json.decode(response.body);
    print("offersResult result ::::::::::::::::::$offersResult");
    // if (contactResult["result"]["Message"] == "ok")
    for (int i = 0; i < offersResult["result"]["Data"].length; i++) {
       offerList.add(new ProductModel(
          offersResult["result"]["Data"][i]["Id"],
          offersResult["result"]["Data"][i]["Title"],
          offersResult["result"]["Data"][i]["Description"],
          offersResult["result"]["Data"][i]["Price"],
          offersResult["result"]["Data"][i]["ImgSrc"],
          offersResult["result"]["Data"][i]["ForRent"],
          offersResult["result"]["Data"][i]["ForSell"],
          offersResult["result"]["Data"][i]["Address"],
          offersResult["result"]["Data"][i]["AcarAge"],
          offersResult["result"]["Data"][i]["AcarFloor"],
          offersResult["result"]["Data"][i]["AcarResptionCount"],
          offersResult["result"]["Data"][i]["AcarSpace"].toString(),
          offersResult["result"]["Data"][i]["bodyType"],
          offersResult["result"]["Data"][i]["hoseType"],
          offersResult["result"]["Data"][i]["AcarBathRoomCount"].toString(),
          offersResult["result"]["Data"][i]["rantType"],
          offersResult["result"]["Data"][i]["UserId"],
           offersResult["result"]["Data"][i]["Latitude"],

          offersResult["result"]["Data"][i]["Longitute"],
          // offersResult["result"]["Data"][i]["Longitute"],

        ));
      // offerList.add(new ProductModel(
      //      offersResult["result"]["Data"][i]["Id"],
      //      offersResult["result"]["Data"][i]["Title"],
      //     offersResult["result"]["Data"][i]["Description"],
      //    offersResult["result"]["Data"][i]["ImgSrc"],
      //      offersResult["result"]["Data"][i]["Price"]));
    }
    return offerList;
  }
}
