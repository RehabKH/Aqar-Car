import 'package:flexible/flexible.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/apis/eqar/officeApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/models/officeModel.dart';
import 'package:real_estate/ui/commonUI.dart';

class AddOffice extends StatefulWidget {
  @override
  _AddOfficeState createState() => _AddOfficeState();
}

class _AddOfficeState extends State<AddOffice> {
  CommonUI commonUI = new CommonUI();
  TextEditingController title = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController desc = new TextEditingController();
  OfficeApi officeApi = new OfficeApi();
  OfficeModel officeModel;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
        title: Text(
          "معرض جديد",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          commonUI.loginTextField("الاسم", Icons.email, title,color),
          SizedBox(
            height: 10.0,
          ),
          commonUI.loginTextField("رقم الجوال", Icons.phone, phone,color),
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
                                hintText: "وصف المعرض",
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
            height: 10.0,
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                loading = true;
              });
              officeModel =
                  new OfficeModel(1, title.text, phone.text, desc.text, "");
              officeApi.addOfficeData(officeModel).then((value) {
                setState(() {
                  loading = false;
                });
              });
            },
            child: Container(
              height: 50.0,
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
          SizedBox(height: 10.0)
        ],
      ),
    );
  }
}
