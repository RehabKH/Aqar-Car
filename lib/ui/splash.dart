import 'package:flutter/material.dart';
import 'package:real_estate/ui/cars/carsPage.dart';
import 'package:real_estate/ui/homePage.dart';
import 'package:real_estate/ui/typePage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => new TypePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child: new Image.asset(
            "assets/splash.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      
    );
  }
}
