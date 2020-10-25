import 'dart:convert';
import 'package:http/http.dart' as http;
class EqoudApi{
  Future addEqoudData(int id,
  String ownerName,
  int ownerIDNum,
  int ownerMobile,
  String rantName,
  int rantIDNum,
  int rantMobile,
  bool isActive) async {
    var response = await http.get(
      "http://walaaaqar.somee.com/Api/Eqoud/CreateEqoud?model.id=$id&model.ownerName=$ownerName&model.ownerIDNum=$ownerIDNum&model.ownerMobile=$ownerMobile&model.rantName=$rantName&model.rantIDnumb=$rantIDNum&model.rantmobile=$rantMobile&model.isActive=$isActive",
      headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${loginApi.token}',
        });
    var additionResult = json.decode(response.body);
    print("additionResult result ::::::::::::::::::$additionResult");
    // if (contactResult["result"]["Message"] == "ok")
    // return additionResult["result"]["Data"];
  }
}