import 'package:real_estate/apis/eqar/eqoudApi.dart';

class EqoudModel {
  int id;
  String ownerName;
  int ownerIDNum;
  int ownerMobile;
  String rantName;
  int rantIDNum;
  int rantMobile;
  bool isActive;
  EqoudModel(this.id, this.ownerName, this.ownerIDNum, this.ownerMobile,
      this.rantName, this.rantIDNum, this.rantMobile,this.isActive);
}
