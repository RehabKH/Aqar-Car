import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:real_estate/models/officeModel.dart';

class OfficeApi {
  List<OfficeModel> officeList = new List<OfficeModel>();
  Future<List<OfficeModel>> getOfficeData() async {
    var response = await http
        .get("http://walaaaqar.somee.com/Api/Office/GetAll", headers: {
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
      // 'Authorization': 'Bearer ${loginApi.token}',
    });
    var officeResult = json.decode(response.body);
    print("office result ::::::::::::::::::$officeResult");
    for (int i = 0; i < officeResult["result"]["Data"].length; i++) {
      officeList.add(new OfficeModel(
          officeResult["result"]["Data"][i]["id"],
          officeResult["result"]["Data"][i]["nameAr"],
          officeResult["result"]["Data"][i]["phone"],
          officeResult["result"]["Data"][i]["descriptionAr"],
          officeResult["result"]["Data"][i]["imgSrc"]));
    }
    print("office list ::::::::::::::::::::::::::::::::::" +
        officeList[0].imgUrl.toString());
    return officeList;
    // if (contactResult["result"]["Message"] == "ok")
    // return additionResult["result"]["Data"];
  }

   Future addOfficeData(OfficeModel officeModel) async {
    var response = await http
        .post("http://walaaaqar.somee.com/Api/Office/create",body: jsonEncode({
          "nameAr":officeModel.title,
          "descriptionAr":officeModel.desc,
          "phone":officeModel.phone,
          "imgSrc": officeModel.imgUrl
        }),
         headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer ${loginApi.token}',
    },);
    var addOfficeResult = json.decode(response.body);
    print("addOfficeResult ::::::::::::::::::$addOfficeResult");
  
  }
}
