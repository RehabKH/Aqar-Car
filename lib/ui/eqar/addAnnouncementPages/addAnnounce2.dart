import 'package:flexible/flexible.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/apis/eqar/productApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/constVal/constVal.dart';
import 'package:real_estate/models/eqar/productModel.dart';
import 'package:real_estate/ui/commonUI.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class AddAnnounce2 extends StatefulWidget {
  final String name;
  final String price;
  final String place;
  final String street;
  final String cityId;
  final String opration;
  final String rent;
  final String eqarType;
  AddAnnounce2(this.name, this.price, this.place, this.street, this.cityId,
      this.opration, this.rent, this.eqarType);
  @override
  _AddAnnounce2State createState() => _AddAnnounce2State();
}

class _AddAnnounce2State extends State<AddAnnounce2> {
  CommonUI commonUI = new CommonUI();

  TextEditingController aqarAge = new TextEditingController();
  String selectedpathroomCount;
  String selectedHoleCount;
  int selectedFloorNum;
  ProductModel productModel;
  String selectedHomeType;
  String selectedeqarDirection;
  ConstVal constVal = new ConstVal();
  ProductApi productApi = new ProductApi();
  String selectedRoomCount;

  TextEditingController desc = new TextEditingController();

  TextEditingController space = new TextEditingController();

  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedHomeType = constVal.homeTypeList[0];
      selectedeqarDirection = constVal.eqarDirectionList[0];

      selectedpathroomCount = constVal.pathroomCountList[0];
      selectedHoleCount = constVal.holeCountList[0];
      selectedFloorNum = int.tryParse(constVal.floorNumberList[0]);
      selectedRoomCount = constVal.eqarRoomCountList[0];
    });
    getUserID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
        title: Text(
          "اضافة عقار جديد",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),

          // Padding(
          //   padding: const EdgeInsets.only(right: 28.0),
          //   child: Align(
          //     alignment: Alignment.centerRight,
          //     child: Text(
          //       "المسكن",
          //       style: TextStyle(color: color, fontSize: 16.0),
          //     ),
          //   ),
          // ),
          commonUI.buildDropDownList(
              constVal.homeTypeList, selectedHomeType, onChangeType, color),
          SizedBox(
            height: 10.0,
          ),
          // Padding(
          //     padding: const EdgeInsets.only(right: 28.0),
          //     child: Align(
          //         alignment: Alignment.centerRight,
          //         child: Text(
          //           "واجهه العقار",
          //           style: TextStyle(color: color, fontSize: 16.0),
          //         ))),
          commonUI.buildDropDownList(constVal.eqarDirectionList,
              selectedeqarDirection, onChangeDirection, color),
          SizedBox(
            height: 10.0,
          ),
          // Padding(
          //     padding: const EdgeInsets.only(right: 28.0),
          //     child: Align(
          //         alignment: Alignment.centerRight,
          //         child: Text(
          //           "عددالحمامات ",
          //           style: TextStyle(color: color, fontSize: 16.0),
          //         ))),
          commonUI.buildDropDownList(constVal.pathroomCountList,
              selectedpathroomCount, onChangePathroom, color),
          SizedBox(
            height: 10.0,
          ),
          // Padding(
          //     padding: const EdgeInsets.only(right: 28.0),
          //     child: Align(
          //         alignment: Alignment.centerRight,
          //         child: Text(
          //           "عدد الصالات ",
          //           style: TextStyle(color: color, fontSize: 16.0),
          //         ))),
          commonUI.buildDropDownList(
              constVal.holeCountList, selectedHoleCount, onChangeHole, color),
          SizedBox(
            height: 10.0,
          ),
          // Padding(
          //     padding: const EdgeInsets.only(right: 28.0),
          //     child: Align(
          //         alignment: Alignment.centerRight,
          //         child: Text(
          //           "رقم الطابق",
          //           style: TextStyle(color: color, fontSize: 16.0),
          //         ))),
          commonUI.buildDropDownList(constVal.floorNumberList,
              selectedFloorNum.toString(), onChangeFloor, color),
          SizedBox(
            height: 10.0,
          ),
          commonUI.buildDropDownList(constVal.eqarRoomCountList,
              selectedRoomCount, onChangeEqarRoom, color),
          SizedBox(
            height: 10.0,
          ),
          // Text(
          //   "عمر العقار",
          //   style: TextStyle(color: color, fontSize: 16.0),
          // ),
          //    SizedBox(
          //   height: 5.0,
          // ),
          commonUI.loginTextField("عمر العقار", Icons.title, aqarAge, color),
          SizedBox(
            height: 10.0,
          ),
          // Text(
          //   "مساحه العقار",
          //   style: TextStyle(color: color, fontSize: 16.0),
          // ),
          //   SizedBox(
          //   height: 5.0,
          // ),
          commonUI.loginTextField("مساحه العقار", Icons.title, space, color),
          SizedBox(
            height: 10.0,
          ),
          ScreenFlexibleWidget(
              // 1. Wrap with `ScreenFlexibleWidget`

              child: Builder(
            builder: (BuildContext context) {
              return Padding(
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 15.0, left: 40.0, right: 40.0),
                  child: Container(
                    // width: 350.0,
                    child: Center(
                      child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            controller: desc,

                            // style: textStyle,
                            onChanged: (val) {
                              // debugPrint("something changed in description ");
                              // updateDescription();
                            },
                            maxLines: null,
                            style: TextStyle(color: color),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.note,
                                  color: color,
                                ),
                                hintText: "وصف الاعلان",
                                // labelText: "Description",
                                // labelStyle: textStyle,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                          )),
                    ),
                  ));
            },
          )),
          SizedBox(
            height: 20.0,
          ),

          MaterialButton(
            onPressed: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => new AddAnnounce2()));
              setState(() {
                loading = true;
              });
              // if (widget.type == "عقار") {
              productModel = new ProductModel(
                  1,
                  widget.name,
                  desc.text,
                  double.tryParse(widget.price),
                  null,
                  false,
                  true,
                  widget.place,
                  int.tryParse(aqarAge.text),
                  selectedFloorNum,
                  int.tryParse(selectedHoleCount),
                  space.text,
                  widget.eqarType,
                  selectedHomeType,
                  (selectedpathroomCount),
                  widget.rent,
                  userID,"27.189946","31.189949");
              productApi.addProductData(productModel).then((value) {
                setState(() {
                  loading = false;
                });
                if (value == "تم اضافة الاعلان بنجاح") {
                  Toast.show(value, context,
                      duration: Toast.LENGTH_LONG,
                      gravity: Toast.TOP,
                      backgroundColor: color);
                }
              });
              // } else {
              //   carModel = new CarModel(
              //       id: 1,
              //       titleAr: title.text,
              //       descAr: desc.text,
              //       price: double.tryParse(price.text));
              //   carApi.addCarData(carModel).then((value) {
              //     setState(() {
              //       loading = false;
              //     });
              //     if (value == "تم اضافة الاعلان بنجاح") {
              //       Toast.show(value, context,
              //           duration: Toast.LENGTH_LONG,
              //           gravity: Toast.TOP,
              //           backgroundColor: color);
              //       price.text = "";
              //       title.text = "";
              //       desc.text = "";
              //     }
              //   });
              // }
            },
            child: Container(
              height: 45.0,
              width: MediaQuery.of(context).size.width - 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: color,

                // border: Border.all(
              ),
              child: Center(
                child: Text(
                  "اضافة",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onChangeDirection(val) {
    setState(() {
      selectedeqarDirection = val;
    });
  }

  onChangeType(val) {
    setState(() {
      selectedHomeType = val;
    });
  }

  onChangePathroom(val) {
    setState(() {
      selectedpathroomCount = val;
    });
  }

  onChangeHole(val) {
    setState(() {
      selectedHoleCount = val;
    });
  }

  onChangeFloor(val) {
    setState(() {
      selectedFloorNum = val;
    });
  }

  onChangeEqarRoom(val) {
    setState(() {
      selectedRoomCount = val;
    });
  }

  String userID;
  bool isLoggedIn;

  Future<String> getUserID() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool("isLoggedIn");
    userID = prefs.getString("userID");
    });
    // return prefs.getString("userID");
  }
}
