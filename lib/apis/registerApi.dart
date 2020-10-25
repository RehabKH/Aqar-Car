import 'dart:convert';

import 'package:real_estate/models/userModel.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterApi {
  Future signUp(UserModel userModel) async {
    print(userModel.address + ":::::::::" + userModel.userName);
    var response = await http.post(
      "http://walaaaqar.somee.com/api/Auth/Registeration",
      body: jsonEncode({
        "UserType": userModel.userType,
        "FullName": userModel.fullName,
        "Email": userModel.email,
        "PasswordHash": userModel.pass,
        "PhoneNumber": userModel.phone,
        "ImageSrc": "",
        "Address": userModel.address,
        "UserName": userModel.userName
      }),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${loginApi.token}',
      },
    );
    var testData = jsonEncode({
      "UserType": userModel.userType,
      "FullName": userModel.fullName,
      "Email": userModel.email,
      "PasswordHash": userModel.pass,
      "PhoneNumber": userModel.phone,
      "ImageSrc": "",
      "Address": userModel.address,
      "UserName": userModel.userName
    });
    print("json data::::::::::::::::::::::::::::::::::::::" + testData);
    var registerResult = json.decode(response.body);
    print("registerResult ::::::::::::::::::$registerResult");

    if (registerResult["result"]["Message"]
        .toString()
        .contains("Account Was Created Successfully"))
      await saveLogin(registerResult["result"]["Data"]["Id"].toString());
    return registerResult["result"]["Message"];
  }

  Future signIn(String phone, String pass) async {
    // print(phone + ":::::::::" + pass);
    var response = await http.post(
      "http://walaaaqar.somee.com/api/Auth/Login",
      body: jsonEncode({
        // "UserType": userModel.userType,
        // "FullName": userModel.fullName,
        "Email": phone,
        "PasswordHash": pass,
        // "PhoneNumber": phone,
        // "ImageSrc":"",
        // "Address": userModel.address,
        // "UserName":userModel.userName
      }),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${loginApi.token}',
      },
    );
    var loginResult = json.decode(response.body);
    print("loginResult ::::::::::::::::::$loginResult");
    var loginTest = jsonEncode({
      // "UserType": userModel.userType,
      // "FullName": userModel.fullName,
      "Email": phone,
      "PasswordHash": pass,
      // "PhoneNumber": phone,
      // "ImageSrc":"",
      // "Address": userModel.address,
      // "UserName":userModel.userName
    });
    print("login test::::::::::::::::" + loginTest);
    if (loginResult["message"] == "Successful Login") {
      saveLogin(loginResult["data"]["Id"].toString());
    return loginResult["message"];

    }
  }

  Future<void> saveLogin(String userID) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", true);
    prefs.setString("userID", userID);
    print("user id :::::::::::::::::::::::::::::::::::::::::::::::::::::" +
        userID);
  }
}
