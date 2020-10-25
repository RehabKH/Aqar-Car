import 'package:flutter/material.dart';
import 'package:real_estate/apis/eqarTermsApi.dart';
import 'package:real_estate/color/constColor.dart';

class CallUs extends StatefulWidget {
  @override
  _CallUsState createState() => _CallUsState();
}

class _CallUsState extends State<CallUs> {
  EqarApi eqarApi = new EqarApi();
  String contactMessage = "";
  @override
  void initState() {
    super.initState();
    eqarApi.getContactMessage().then((value) {
      setState(() {
        contactMessage = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اتصل بنا",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
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
          // SizedBox(
          //   height: 50.0,
          // ),
          // _buildRow("", "رسوم الاعلان"),
          // SizedBox(
          //   height: 15.0,
          // ),
          // _buildRow("", "الاسءلة الشاءعه"),
          // SizedBox(
          //   height: 15.0,
          // ),
          // _buildRow("", "دليل الاستخدام"),
          // SizedBox(
          //   height: 15.0,
          // ),
          // _buildRow("", "اتصل بنا"),
        Padding(
          padding: const EdgeInsets.all(8.0),
        
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(contactMessage,style: TextStyle(fontSize: 20.0,color: color),)),
        )
        ],
      ),
    );
  }

  Widget _buildRow(String imgUrl, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(color: color, fontSize: 17.0),
        ),
        SizedBox(
          width: 10.0,
        ),
        Image(
          height: 30.0,
          width: 30.0,
          image: AssetImage(imgUrl),
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
