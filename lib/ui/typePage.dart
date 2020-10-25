import 'package:flutter/material.dart';
import 'package:real_estate/ui/cars/carHome.dart';
import 'package:real_estate/ui/cars/carsPage.dart';
import 'package:real_estate/ui/homePage.dart';

class TypePage extends StatefulWidget {
  @override
  _TypePageState createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
         height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // color: Colors.blueGrey[200],
        image: DecorationImage(image: AssetImage("assets/bg.png"),
        fit: BoxFit.cover
        )
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child:  new Image.asset(
            "assets/eqar.png",
            fit: BoxFit.cover,
          ),
            // child: Container(
            //   height: 100.0,
            //   width: 100.0,
            //   decoration:
            //       BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            //   child: Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[Icon(Icons.home,color: Colors.white,size: 30.0,), Text("عقارات",style: TextStyle(color: Colors.white,fontSize: 17.0))],
            //     ),
            //   ),
            // ),
          ),
          SizedBox(height: 20.0),
          InkWell(
            onTap: (){
               Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => new CarHome()));
            },
            child: new Image.asset(
            "assets/car.png",
            fit: BoxFit.cover,
          ),
            //           child: Container(
            //   height: 100.0,
            //   width: 100.0,
            //   decoration:
            //       BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            //   child: Center(
            //     child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,

            //       children: <Widget>[Icon(Icons.drive_eta,color: Colors.white,size: 30.0,), Text("سيارات",style: TextStyle(color: Colors.white,fontSize: 17.0),)],
            //     ),
            //   ),
            // ),
          ),
        ],
      )),
    ));
  }
}
