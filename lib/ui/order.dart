import 'package:flutter/material.dart';
import 'package:real_estate/apis/eqar/eqoudApi.dart';
import 'package:real_estate/apis/eqarTermsApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/ui/commonUI.dart';
import 'package:toast/toast.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  CommonUI commonUI = new CommonUI();
  TextEditingController ownerName = new TextEditingController();
  TextEditingController ownerIDNum = new TextEditingController();
  TextEditingController ownerMobile = new TextEditingController();
  TextEditingController rantName = new TextEditingController();
  TextEditingController rantIDNum = new TextEditingController();
  TextEditingController rantMobile = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  EqoudApi eqoudApi = new EqoudApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("طلب عقد إيجار",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    "هذه الخدمة لإبرام عقدتأجير معتمد عبر نظام ايجار",
                    style: TextStyle(color: Colors.grey, fontSize: 20.0),
                  ),
                  commonUI.buildRow("ادخل هنا", "اسم المالك", ownerName),
                  commonUI.buildRow("ادخل هنا", "رقم بطاقة المالك", ownerIDNum),
                  commonUI.buildRow(
                      "ادخل هنا", "رقم الجوال المالك", ownerMobile),
                  Divider(
                    color: color,
                  ),
                  commonUI.buildRow("ادخل هنا", "اسم المستأجر", rantName),
                  commonUI.buildRow(
                      "ادخل هنا", "رقم بطاقة المستأجر", rantIDNum),
                  commonUI.buildRow(
                      "ادخل هنا", "رقم الجوال المستأجر", rantMobile),
                  MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        eqoudApi
                            .addEqoudData(
                                1,
                                ownerName.text,
                                int.parse(ownerIDNum.text),
                                int.parse(ownerMobile.text),
                                rantName.text,
                                int.parse(rantIDNum.text),
                                int.parse(rantMobile.text),
                                false)
                            .then((value) {
                          Toast.show("تم اضافة عقد إجار بنجاح", context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.CENTER,
                              backgroundColor: color);
                          setState(() {
                            ownerIDNum.text = "";
                            ownerMobile.text = "";
                            ownerName.text = "";
                            rantIDNum.text = "";
                            rantMobile.text = "";
                            rantName.text = "";

                          });
                          print("Done:::::::::::::::::::");
                        });
                      }
                    },
                    child: Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width - 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: color,
                          )),
                      child: Center(
                        child: Text("إرسال", style: TextStyle(color: color)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "لتسريع عمل عقد الإجار نرجو إرسال التالى عبر الواتساب:",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "- معلومات بطاقة المستأجر",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "- معلومات بطاقة المالك",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "- صورة",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Image(
                        height: 40.0,
                        width: 40.0,
                        fit: BoxFit.cover,
                        image: AssetImage("assets/Whatsapp.png"),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        "01123654788",
                        style: TextStyle(color: Colors.blue[800]),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
