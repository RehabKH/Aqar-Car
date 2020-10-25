import 'package:flutter/material.dart';
import 'package:real_estate/apis/carApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/constVal/constVal.dart';
import 'package:real_estate/models/carModel.dart';
import 'package:real_estate/models/cityModel.dart';
import 'package:real_estate/ui/commonUI.dart';
import 'package:toast/toast.dart';

class AddCar extends StatefulWidget {
  @override
  _AddCarState createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  CommonUI commonUI = new CommonUI();
  TextEditingController title = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController desc = new TextEditingController();
  // ProductApi productApi = new ProductApi();
  // ProductModel productModel;
  CarModel carModel;
  CarApi carApi = new CarApi();
  bool loading = false;
  ConstVal constVal = new ConstVal();
  CityModel selectedCountry;

  TextEditingController eqarNumber = new TextEditingController();

  TextEditingController place = new TextEditingController();

  String selectedModel;

  String selectedCompany;

  String selectedType;

  String selectedShape;

  String selectedStatus;

  String selectedMovement;

  String selectedEngine;
  @override
  void initState() {
    super.initState();
    constVal.getCities().then((value) {
      setState(() {
        selectedModel = constVal.modelList[0];

        selectedCountry = constVal.cityList[0];

        selectedCompany = constVal.companyList[0];
        selectedType = constVal.typeList[0];
        selectedShape = constVal.shapeList[0];

        selectedStatus = constVal.statusList[0];
        selectedMovement = constVal.movementList[0];
        selectedEngine = constVal.engineList[0];
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
        backgroundColor: carColor2,
        title: Text(
          " سيارة جديدة",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          commonUI.loginTextField("الاسم", Icons.title, title, carColor2),
          SizedBox(
            height: 10.0,
          ),
          commonUI.loginTextField("الشركة", Icons.place, price, carColor2),
          SizedBox(
            height: 10.0,
          ),
          commonUI.loginTextField(
              "السعر", Icons.attach_money, price, carColor2),
          SizedBox(
            height: 10.0,
          ),
          commonUI.buildCountryDropDownList(
              constVal.cityList, selectedCountry, onChangeCountry,carColor2),
          SizedBox(
            height: 10.0,
          ),
          commonUI.buildDropDownList(
              constVal.companyList, selectedCompany, onChangeCompany,carColor2),
          SizedBox(
            height: 10.0,
          ),
          commonUI.buildDropDownList(
              constVal.typeList, selectedType, onChangeType,carColor2),
          SizedBox(
            height: 10.0,
          ),
          commonUI.buildDropDownList(
              constVal.shapeList, selectedShape, onChangeShape,carColor2),
          SizedBox(
            height: 10.0,
          ),
          commonUI.buildDropDownList(
              constVal.modelList, selectedModel, onChangeModel,carColor2),
          SizedBox(
            height: 20.0,
          ),
          commonUI.buildDropDownList(
              constVal.statusList, selectedStatus, onChangeStatus,carColor2),
          SizedBox(
            height: 20.0,
          ),
          commonUI.buildDropDownList(
              constVal.movementList, selectedMovement, onChangeMovement,carColor2),
          SizedBox(
            height: 20.0,
          ),
          commonUI.buildDropDownList(
              constVal.engineList, selectedEngine, onChangeEngine,carColor2),
          SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            onPressed: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => new AddAnnounce2(title.text, price.text, place.text, eqarNumber.text, selectedCountry.id.toString(), selectedOperation, selectedRent, selectedeqarType)));
              setState(() {
                loading = true;
              });
              // if (widget.type == "عقار") {
              carModel = new CarModel(
                1,
                title.text,
                desc.text, null,
                double.tryParse(price.text),

                // null,
                // false,
                // true,
                // widget.place,
                // int.tryParse(aqarAge.text),
                // selectedFloorNum,
                // int.tryParse(selectedHoleCount),
                // space.text,
                // widget.eqarType,
                // selectedHomeType,
                // (selectedpathroomCount),
                // widget.rent,
              );
              carApi.addCarData(carModel).then((value) {
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
            },
            child: Container(
              height: 45.0,
              width: MediaQuery.of(context).size.width - 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: carColor2,

                // border: Border.all(
              ),
              child: Center(
                child: (loading)?
                CircularProgressIndicator(backgroundColor: Colors.white):
                Text(
                  "تم",
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

  onChangeCompany(val) {
    setState(() {
      selectedCompany = val;
    });
  }

  onChangeType(val) {
    setState(() {
      selectedType = val;
    });
  }

  onChangeShape(val) {
    setState(() {
      selectedShape = val;
    });
  }

  onChangeModel(val) {
    setState(() {
      selectedModel = val;
    });
  }

  onChangeEngine(val) {
    setState(() {
      selectedEngine = val;
    });
  }

  onChangeMovement(val) {
    setState(() {
      selectedMovement = val;
    });
  }

  onChangeStatus(val) {
    setState(() {
      selectedStatus = val;
    });
  }
}
