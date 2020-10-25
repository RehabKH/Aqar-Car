// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/models/eqar/productModel.dart';

class AnnounceDetails extends StatefulWidget {
  final ProductModel productModel;
  AnnounceDetails(this.productModel);
  @override
  _AnnounceDetailsState createState() => _AnnounceDetailsState();
}

class _AnnounceDetailsState extends State<AnnounceDetails> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        centerTitle: true,
        title: Text(
          "تفاصيل الاعلان",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          //popUp menu
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            // SizedBox(
            //   height: 10.0,
            // ),

            Image.asset(
              "assets/builder.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            //slider
            // CarouselSlider(
            //   options: CarouselOptions(height: 100.0),
            //   items: [1, 2, 3, 4, 5].map((i) {
            //     return Builder(
            //       builder: (BuildContext context) {
            //         return Container(
            //             width: MediaQuery.of(context).size.width,
            //             margin: EdgeInsets.symmetric(horizontal: 5.0),
            //             decoration: BoxDecoration(color: Colors.transparent),
            //             child: Center(
            //                 child: Image.asset(
            //               "assets/builder.jpg",
            //               fit: BoxFit.cover,
            //               width: MediaQuery.of(context).size.width,
            //             )));
            //       },
            //     );
            //   }).toList(),
            // ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.productModel.title ?? "اسم الاعلان",
                  style: TextStyle(color: color),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.productModel.desc ?? "تفاصيل الاعلان",
                  style: TextStyle(color: color),
                ),
              ),
            ),

            // SizedBox(height: 20.0),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(text: " السعر :", style: TextStyle(color: color)),
                  TextSpan(
                      text: widget.productModel.price.toString() + "," ?? ",",
                      style: TextStyle(color: Colors.black)),
                  TextSpan(text: " الواجهه :", style: TextStyle(color: color)),
                  TextSpan(
                      text: widget.productModel.eqarinterface??"___ ,",
                      style: TextStyle(color: Colors.black)),
                        TextSpan(text: " المساحة :", style: TextStyle(color: color)),
                  TextSpan(
                      text: widget.productModel.eqarSpace?? "___ ,",
                      style: TextStyle(color: Colors.black)),
                       TextSpan(text: " الحمامات :", style: TextStyle(color: color)),
                  TextSpan(
                      text: widget.productModel.pathRoomCount?? "___ ,",
                      style: TextStyle(color: Colors.black)),
                         TextSpan(text: " عدد الريسبشن :", style: TextStyle(color: color)),
                  TextSpan(
                      text: widget.productModel.eqarresiptionCount?? "___ ,",
                      style: TextStyle(color: Colors.black)),
                         TextSpan(text: " عمر العقار :", style: TextStyle(color: color)),
                  TextSpan(
                      text: widget.productModel.eqarAge.toString() +","?? "___ ,",
                      style: TextStyle(color: Colors.black)),
                        TextSpan(text: " عرض شارع العقار :", style: TextStyle(color: color)),
                  TextSpan(
                      text: widget.productModel.eqarwidthstreet?? "___ ,",
                      style: TextStyle(color: Colors.black)),
                ])),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                    child: InkWell(
                      child: Container(
                        height: 35.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: Center(child: Text("اضافة الى المفضلة",style: TextStyle(color: Colors.white),))),
                      onTap: () {
                       
                      },
                    ))),
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
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
