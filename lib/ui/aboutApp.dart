import 'package:flutter/material.dart';
import 'package:real_estate/color/constColor.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("عن تطبيق عقار كار",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor:color,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
     SizedBox(height:50.0),
        Image(
          image: AssetImage("assets/logo.png"),
          height: 100.0,
          width: 200.0,
          fit: BoxFit.cover,
        ),
        // SizedBox(height: 10.0,),
          Text("عقار",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15.0),),
          Text("v 2.51.1",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15.0),),
          SizedBox(height: 35.0,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Image(
    height: 30.0,
    width: 30.0,
    fit: BoxFit.cover,
    image: AssetImage("assets/logo.jpeg"),

  ),
  SizedBox(width: 10.0,),
  Text("اتصل بنا",style: TextStyle(color: color),)
],),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
IconButton(icon: Icon(Icons.share,size: 25.0,color: color,),
onPressed: (){

},
),
  SizedBox(width: 10.0,),
  Text("شارك التطبيق",style: TextStyle(color: color),)
],),

 MaterialButton(
            onPressed: () {},
            child: Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width - 250.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1.5,
                    color: color,
                  )),
              child: Center(
                child:
                    Text("دليل الخدمات", style: TextStyle(color:color)),
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          MaterialButton(
            onPressed: () {},
            child: Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width - 250.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1.5,
                    color: color,
                  )),
              child: Center(
                child:
                    Text("الاسءلة الشاءعه", style: TextStyle(color: color)),
              ),
            ),
          )
        ],
      ),
    );
  }
}