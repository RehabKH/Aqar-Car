import 'package:flutter/material.dart';
import 'package:real_estate/apis/registerApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/models/userModel.dart';
import 'package:real_estate/ui/bottomNavBarPages/loginPage.dart';
import 'package:real_estate/ui/commonUI.dart';
import 'package:real_estate/ui/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phone = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController userName = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  CommonUI commonUI = new CommonUI();
  String selectedClientType = "نوع العميل";
  RegisterApi registerApi = new RegisterApi();
  UserModel userModel;

  TextEditingController confirmPass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
        title: Text(
          "حساب جديد",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            commonUI.loginTextField("الاسم", Icons.account_circle, name,color),
            SizedBox(
              height: 10.0,
            ),
            commonUI.loginTextField(
                "اسم المستخدم", Icons.account_circle, userName,color),
            SizedBox(
              height: 10.0,
            ),
            commonUI.loginTextField("رقم الجوال", Icons.phone, phone,color),
            SizedBox(
              height: 10.0,
            ),
            commonUI.loginTextField("البريد الالكترونى", Icons.email, email,color),
            SizedBox(
              height: 10.0,
            ),
            commonUI.loginTextField("العنوان", Icons.location_on, address,color),
            SizedBox(
              height: 10.0,
            ),
            commonUI.loginTextField("كلمة السر", Icons.vpn_key, pass,color),
            SizedBox(
              height: 10.0,
            ),
            commonUI.loginTextField(
                "تأكيد كلمة السر", Icons.vpn_key, confirmPass,color),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: DropdownButton<String>(
                // hint: Padding(
                //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                //   child: Text((list.length <= 0) ? "No Data Found" : "select ",
                //       style: TextStyle(color: Colors.indigo[300])),
                // ),
                underline: Container(color: (Colors.indigo[50])),
                iconEnabledColor: color,
                iconDisabledColor: color,
                value: selectedClientType,
                isExpanded: true,
                items: ['نوع العميل', 'مالك', 'مستأجر', 'مكتب', "مسوق"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 13.0),
                        child: new Text(value, style: TextStyle(color: color)),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedClientType = val;
                  });
                },
              ),
            ),
            MaterialButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  userModel = new UserModel(
                      fullName: name.text,
                      phone: phone.text,
                      email: email.text,
                      userName: userName.text,
                      address: address.text,
                      pass: pass.text);
                  registerApi.signUp(userModel).then((value)  {
                    print(value);
                    Toast.show(value, context,
                        duration: Toast.LENGTH_LONG,
                        gravity: Toast.TOP,
                        backgroundColor: color);
                      
                    if (value != null && value
                        .toString()
                        .contains("Account Was Created Successfully")) {
                           Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => new HomePage()));
                      //                    changeRoute() async {
                      //   await Future.delayed(Duration(seconds: 1), () {
                      //    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //                         builder: (context) => new HomePage()));
                      //   });
                      // }
                    }
                   
                  });
                }
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
                  child:
                      Text("إرسال رمز التحقق", style: TextStyle(color: color)),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: Text(
                  "رقم جوالكم لن يظهر إلا بعد إضافة اعلان",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "لديك حساب معنا؟",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => new LoginPage()));
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
            SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }
}
