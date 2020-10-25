// import 'package:real_estate/models/carTypeModel.dart';

class CarModel {
  int id;
  String titleAr;
  String descAr;
  String titleEn;
  String descEn;
  String imgUrl;
  double price;
  List<CarModel> allParents;
  CarModel(this.id, this.titleAr, this.descAr, this.imgUrl, this.price,{this.allParents});
}
