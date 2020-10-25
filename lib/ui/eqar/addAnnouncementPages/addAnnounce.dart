// import 'dart:ffi';

import 'package:flexible/flexible.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/apis/carApi.dart';
// import 'package:real_estate/apis/eqar/officeApi.dart';
import 'package:real_estate/apis/eqar/productApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/constVal/constVal.dart';
import 'package:real_estate/models/carModel.dart';
import 'package:real_estate/models/cityModel.dart';
import 'package:real_estate/models/eqar/productModel.dart';
// import 'package:real_estate/models/officeModel.dart';
import 'package:real_estate/ui/commonUI.dart';
import 'package:real_estate/ui/eqar/addAnnouncementPages/addAnnounce2.dart';
// import 'package:toast/toast.dart';

class AddAnnounce extends StatefulWidget {
  final String type;
  AddAnnounce(this.type);
  @override
  _AddAnnounceState createState() => _AddAnnounceState();
}

class _AddAnnounceState extends State<AddAnnounce> {
  CommonUI commonUI = new CommonUI();
  TextEditingController title = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController desc = new TextEditingController();
  ProductApi productApi = new ProductApi();
  ProductModel productModel;
  CarModel carModel;
  CarApi carApi = new CarApi();
  bool loadingPage = true;
  bool loading = false;
  ConstVal constVal = new ConstVal();
  CityModel selectedCountry;

  String selectedFlatCount;
  String selectedOperation;
  String selectedRent;
  String selectedeqarType;

  TextEditingController eqarNumber = new TextEditingController();

  TextEditingController place = new TextEditingController();
  @override
  void initState() {
    super.initState();
    constVal.getCities().then((value) {
      setState(() {
        selectedOperation = constVal.operationList[0];

        selectedCountry = constVal.cityList[0];

        selectedFlatCount = constVal.flatCountList[0];
        selectedRent = constVal.rentList[0];
        selectedeqarType = constVal.eqarTypeList[0];
        loadingPage = false;
      });
      print(selectedCountry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
        title: Text(
          " عقار جديد",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:(loadingPage)?
       Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      backgroundColor: color,
                    ),
                  )
                ],
              ),
            ):
       ListView(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          commonUI.loginTextField("الاسم", Icons.title, title, color),
          SizedBox(
            height: 10.0,
          ),
          commonUI.loginTextField("السعر", Icons.attach_money, price, color),
          SizedBox(
            height: 10.0,
          ),
          commonUI.loginTextField("المكان", Icons.title, place, color),
          SizedBox(
            height: 10.0,
          ),

          commonUI.loginTextField(
              "عرض شارع العقار", Icons.attach_money, eqarNumber, color),
          SizedBox(
            height: 10.0,
          ),
          // Align(
          //   alignment: Alignment.centerRight,
          //             child: Padding(
          //               padding: const EdgeInsets.only(right:28.0),
          //               child: Text(
          //     "عدد الشقق بالعقار",
          //     style: TextStyle(color: color, fontSize: 16.0),
          //   ),
          //             ),
          // ),
          commonUI.buildCountryDropDownList(
              constVal.cityList, selectedCountry, onChangeCountry, color),
          SizedBox(
            height: 10.0,
          ),
          commonUI.buildDropDownList(
              constVal.flatCountList, selectedFlatCount, onChangeFlat, color),
          SizedBox(
            height: 10.0,
          ),
          commonUI.buildDropDownList(constVal.operationList, selectedOperation,
              onChangeOperation, color),
          SizedBox(
            height: 10.0,
          ),
          commonUI.buildDropDownList(
              constVal.rentList, selectedRent, onChangeRent, color),
          SizedBox(
            height: 10.0,
          ),
          commonUI.buildDropDownList(
              constVal.eqarTypeList, selectedeqarType, onChangeEqarType, color),

          SizedBox(
            height: 20.0,
          ),

          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => new AddAnnounce2(
                      title.text,
                      price.text,
                      place.text,
                      eqarNumber.text,
                      selectedCountry.id.toString(),
                      selectedOperation,
                      selectedRent,
                      selectedeqarType)));
              // setState(() {
              //   loading = true;
              // });
              // if (widget.type == "عقار") {
              //   productModel = new ProductModel(
              //       id: 1,
              //       title: title.text,
              //       desc: desc.text,
              //       price: double.tryParse(price.text));
              //   productApi.addProductData(productModel).then((value) {
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
                  "التالى",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0)
        ],
      ),
    );
  }

  onChangeCountry(val) {
    setState(() {
      selectedCountry = val;
    });
  }

  onChangeFlat(val) {
    setState(() {
      selectedFlatCount = val;
    });
  }

  onChangeOperation(val) {
    setState(() {
      selectedOperation = val;
    });
  }

  onChangeEqarType(val) {
    setState(() {
      selectedeqarType = val;
    });
  }

  onChangeRent(val) {
    setState(() {
      selectedRent = val;
    });
  }
}
