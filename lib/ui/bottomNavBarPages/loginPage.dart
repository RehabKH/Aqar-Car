import 'package:flutter/material.dart';
import 'package:real_estate/apis/registerApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/ui/commonUI.dart';
import 'package:real_estate/ui/homePage.dart';
import 'package:real_estate/ui/registerPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  CommonUI commonUI = new CommonUI();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  RegisterApi registerApi = new RegisterApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
        title: Text(
          "تسجيل الدخول",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          commonUI.loginTextField(
              "الايميل", Icons.email, phoneController, color),
          SizedBox(
            height: 10.0,
          ),
          commonUI.loginTextField(
              "كلمة المرور", Icons.vpn_key, passController, color),
          SizedBox(
            height: 10.0,
          ),
          MaterialButton(
            onPressed: () {
              registerApi
                  .signIn(phoneController.text, passController.text)
                  .then((value) {
                print("login Done");
                if (value == "Successful Login") {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => new HomePage()));
                }
              });
            },
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width - 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: color,
                  )),
              child: Center(
                child: Text("تسجيل الدخول", style: TextStyle(color: color)),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              child: Text(
                "نسيت كلمة المرور ؟",
                style: TextStyle(color: color),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "لست مسجل لدينا؟",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => new RegisterPage()));
            },
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width - 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: color,
                  )),
              child: Center(
                child: Text("حساب جديد", style: TextStyle(color: color)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
