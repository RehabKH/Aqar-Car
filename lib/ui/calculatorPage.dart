import 'package:flutter/material.dart';
import 'package:real_estate/apis/eqarTermsApi.dart';
import 'package:real_estate/color/constColor.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  EqarApi eqarApi = new EqarApi();
  String calculatorTitle = "";
  String desc = "";
  @override
  void initState() {
    super.initState();
    eqarApi.getCalculatorData().then((value) {
      setState(() {
        calculatorTitle = value["nameAr"];
        desc = value["discriptionAr"];

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حاسبة التمويل العقاري",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height /4 - 100.0,),
              Align(
                alignment: Alignment.center,
                              child: Image(
                  height: 150.0,
                  width: 200.0,
                
                  image: AssetImage("assets/logo.png"),
                fit: BoxFit.cover,
                ),
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text(
                  calculatorTitle,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: color),
                ),
              ],),
             
              SizedBox(
                height: 15.0,
              ),
               Row(
                
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                  desc,
                  style: TextStyle(color: Colors.grey,fontSize: 17.0),
                ),]
              )
            ],
          ),
      ),
    );
  }
}
