import 'package:flutter/material.dart';
import 'package:real_estate/apis/eqarTermsApi.dart';
import 'package:real_estate/color/constColor.dart';

class MarketingSolutions extends StatefulWidget {
  @override
  _MarketingSolutionsState createState() => _MarketingSolutionsState();
}

class _MarketingSolutionsState extends State<MarketingSolutions> {
  EqarApi eqarApi = new EqarApi();
  String title = "";
  String desc = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eqarApi.getMarketingAnswerData().then((value) {
      setState(() {
        title = value["nameAr"];
        desc = value["discriptionAr"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حلول تسويقيه",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
      ),
      body:Padding(
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
               Directionality(
                 textDirection: TextDirection.rtl,
                                child: Text(
                   
                    title,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: color,),
                  ),
               ),
              // Row(
                
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
                
              // ],),
             
              SizedBox(
                height: 10.0,
              ),
               Directionality(
                 textDirection: TextDirection.rtl,
                                child: Text(
                    desc,
                    style: TextStyle(color: Colors.grey,fontSize: 17.0),
                  ),
               )
              //  Row(
                
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //    ,]
              // )
            ],
          ),
      ),
    );
  }
}
