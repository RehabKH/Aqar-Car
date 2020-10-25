class ProductModel {
  String eqarType;
  int eqarHomeCount;
  String homeType;
  int id;
  String eqarSpace;
  int eqarAge;
  int eqarFloor;
  String pathRoomCount;
  String userId;
  String title;
  String desc;
  double price;
  //operation
  bool forRent;
  //operation
  bool forSell;
  String imgUrl;
  String address;
  String rentType;
  String cityId;
  //المسكن
  String acarstates;
  //واجهه العقار
  String eqarinterface;
  //عرض شارع العقار
  String eqarwidthstreet;
  // عدد الصالات
  String eqarresiptionCount;
  //الصالات
  String eqarResiption;
  // String flatCount;
  String latitude;
  String longitude;
  ProductModel(
      this.id,
      this.title,
      this.desc,
      this.price,
      this.imgUrl,
      this.forRent,
      this.forSell,
      this.address,
      this.eqarAge,
      this.eqarFloor,
      this.eqarHomeCount,
      this.eqarSpace,
      this.eqarType,
      this.homeType,
      this.pathRoomCount,
      this.rentType,
      this.userId,
      this.latitude,
      this.longitude,
);
}
