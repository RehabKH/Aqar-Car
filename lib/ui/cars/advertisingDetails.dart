import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/models/carModel.dart';
import 'package:real_estate/ui/cars/commonUI.dart';

class AdvertisingDetails extends StatefulWidget {
  final CarModel carModel;
  AdvertisingDetails({this.carModel});
  @override
  _AdvertisingDetailsState createState() => _AdvertisingDetailsState();
}

class _AdvertisingDetailsState extends State<AdvertisingDetails> {
  CommonCARUI commonCARUI = new CommonCARUI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "تفاصيل الاعلان",
          style: TextStyle(color: Colors.white),
          
        ),
        backgroundColor: carColor2,
        actions: [
          //popUp menu
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            //slider
            CarouselSlider(
              options: CarouselOptions(height: 100.0),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Center(
                            child: Image.asset(
                          "assets/car.jpg",
                          fit: BoxFit.contain,
                          width: 250.0,
                        )));
                  },
                );
              }).toList(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.carModel.titleAr??"title",
                  style: TextStyle(color: carColor2),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 70.0,
                  width: 100.0,
                  child: commonCARUI.buildIconColumn(
                      "قبل 7 دقيقة", Icons.access_time,carColor2),
                ),
                SizedBox(
                  height: 70.0,
                  width: 100.0,
                  child: commonCARUI.buildIconColumn(
                       widget.carModel.descAr??"98777899", Icons.account_circle, carColor2),
                ),
                SizedBox(
                  height: 70.0,
                  width: 100.0,
                  child: commonCARUI.buildIconColumn(
                      "حائل", Icons.location_on, carColor2),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Align(
            //   alignment: Alignment.topRight,
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            //     child: RichText(
            //         text: TextSpan(children: [
            //       TextSpan(text: " النوع :", style: TextStyle(color: color)),
            //       TextSpan(
            //           text: "فورد ", style: TextStyle(color: Colors.black)),
            //     ])),
            //   ),
            // ),
            // Align(
            //     alignment: Alignment.topRight,
            //     child: Padding(
            //       padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            //       child: RichText(
            //           text: TextSpan(children: [
            //         TextSpan(
            //             text: "الموديل :",
            //             style: TextStyle(
            //               color: color,
            //             )),
            //         TextSpan(
            //             text: "2009", style: TextStyle(color: Colors.black)),
            //       ])),
            //     )),
            // Align(
            //     alignment: Alignment.topRight,
            //     child: Padding(
            //       padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            //       child: RichText(
            //           text: TextSpan(children: [
            //         TextSpan(
            //             text: " :حالة السيارة", style: TextStyle(color: color)),
            //         TextSpan(
            //             text: "مستعمل", style: TextStyle(color: Colors.black)),
            //       ])),
            //     )),
            // Align(
            //     alignment: Alignment.topRight,
            //     child: Padding(
            //       padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            //       child: RichText(
            //           text: TextSpan(children: [
            //         TextSpan(
            //             text: "نوع الوقود :", style: TextStyle(color: color)),
            //         TextSpan(
            //             text: "بنزين", style: TextStyle(color: Colors.black)),
            //       ])),
            //     )),
            // Align(
            //     alignment: Alignment.topRight,
            //     child: Padding(
            //       padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            //       child: RichText(
            //           text: TextSpan(children: [
            //         TextSpan(text: "الممشي :", style: TextStyle(color: color)),
            //         TextSpan(
            //             text: "190", style: TextStyle(color: Colors.black)),
            //       ])),
            //     )),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(text: "الوصف :", style: TextStyle(color: carColor2,fontWeight: FontWeight.bold,fontSize: 17.0)),
                    TextSpan(
                        text: widget.carModel.descAr??"تفاصيل السيارة كاملة ", style: TextStyle(color:carColor2,fontSize: 17.0)),
                  ])),
                )),
            SizedBox(
              height: 20.0,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     SizedBox(
            //       height: 70.0,
            //       width: 100.0,
            //       child: commonCARUI.buildIconColumn(
            //           "اتصال", Icons.phone, Colors.green),
            //     ),
            //     SizedBox(
            //       height: 70.0,
            //       width: 100.0,
            //       child: commonCARUI.buildIconColumn(
            //           "مراسلة", Icons.email, Colors.blue),
            //     ),
            //     SizedBox(
            //       height: 70.0,
            //       width: 100.0,
            //       child: commonCARUI.buildIconColumn(
            //           "أضف للمفضلة", Icons.star_border, Colors.orange),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
