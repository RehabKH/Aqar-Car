import 'dart:convert';

import 'package:real_estate/models/cityModel.dart';
import 'package:http/http.dart' as http;
class ConstVal{
  List<String> operationList = ["اختر العملية","للايجار", "بيع"];
List<String> rentList = [
  "اختر الايجار",
  'يومي',
  'شهري',
  'سنوى',
];
List<String> eqarTypeList =["اختر نوع العقار","شقه", "فلة", "ارض", "عمارة", "بيت", "مخزن"];
List<String> homeTypeList =['عزاب', 'عاءلات', "اختر المسكن"];
List<String> eqarDirectionList = ["اختر اتجاه العقار",'شمالية', 'غربية', "جنوبية", "شرقيه"];
List<String> flatCountList = ['4', '3', "2", "1"];
List<String> pathroomCountList =  ['4', '3', "2", "1","0"];
List<String> holeCountList = ['4', '3', "2", "1","0"];
List<String> floorNumberList =['4', '3', "2", "1","0"];
List<String> eqarRoomCountList =['4', '3', "2", "1","0"];

List<CityModel> cityList = new List<CityModel>();
////////////////////////////////////////////////////car variables
List<String> companyList =["جريت وول","GAC", "FAW", "هافال", "", ""];
List<String> typeList =['ونجل5', 'ونجل6', "ونجل7"];
List<String> shapeList = ['جيب', 'هاتش باك', "شيفورليه", "سيدان"];
List<String> modelList =["2020","2015","2000","2018"];
List<String> statusList = ["جديد","مستعمل"];
List<String> movementList = ["اوتوماتيك","مانيوال"];
List<String> engineList = ["1900","2000","2500","2100"];


Future<List<CityModel>> getCities() async {
    var response = await http.get(
      "http://walaaaqar.somee.com/Api/City/GetAllCities",
    );
    var cityResult = json.decode(response.body);
    print("cities result ::::::::::::::::::$cityResult");
    if (cityResult["result"]["Message"] == "Ok man") {
      for (int i = 0; i < cityResult["result"]["Data"].length; i++) {
        cityList.add(new CityModel(
          id: cityResult["result"]["Data"][i]["Id"],
      
          name: cityResult["result"]["Data"][i]["NameAr"],
          countryId: cityResult["result"]["Data"][i]["CountryId"],
        ));
      }
    }
    return cityList;

    // } else {
    //   return carList["message"];
    // }
  }
}