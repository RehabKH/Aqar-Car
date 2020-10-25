import 'package:flutter/material.dart';
import 'package:real_estate/apis/eqarTermsApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/ui/commonUI.dart';

class Construction extends StatefulWidget {
  @override
  _ConstructionState createState() => _ConstructionState();
}

class _ConstructionState extends State<Construction> {
  EqarApi eqarApi = new EqarApi();
  String facilityTitle = "";
  String facilityDesc = "";
  @override
  void initState() {
   
    super.initState();
    eqarApi.getFacilitiesData().then((value) {
      setState(() {
          facilityTitle = value["nameAr"];
        facilityDesc = value["discriptionAr"];
      });
    });
  }
  // CommonUI commonUI;
  // bool selectedbuilding = false,
  //     selectedPlaning = false,
  //     selectedSupervision = false,
  //     selectedpurchase = false,
  //     selectedDesign = false;
  // TextEditingController phoneController = new TextEditingController();

  // TextEditingController descController = new TextEditingController();

  // TextEditingController cityController = new TextEditingController();
  // @override
  // Widget build(BuildContext context) {
  //   commonUI = new CommonUI();
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("البناء والمقاولات",
  //           style: TextStyle(
  //             color: Colors.grey[700],
  //           )),
  //       centerTitle: true,
  //       elevation: 0.0,
  //       backgroundColor: Colors.grey[350],
  //     ),
  //     body: ListView(
  //       shrinkWrap: true,
  //       children: [
  //         SizedBox(
  //           height: 50.0,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               "اختر النوع",
  //               style: TextStyle(color: Colors.grey, fontSize: 17.0),
  //             ),
  //           ],
  //         ),
  //         SizedBox(
  //           height: 10.0,
  //         ),

  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             InkWell(
  //               onTap: () {
  //                 setState(() {
  //                   selectedDesign = false;
  //                   selectedPlaning = false;
  //                   selectedSupervision = false;
  //                   selectedbuilding = true;
  //                   selectedpurchase = false;

  //                 });
  //               },
  //               child: Container(
  //                 width: 150.0,
  //                 decoration: BoxDecoration(
  //                     border: Border.all(color:(selectedbuilding)?Colors.green: Colors.green[600])),
  //                 child: Center(
  //                   child: Text(
  //                     "البناء",
  //                     style: TextStyle(color: Colors.green[600]),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             InkWell(
  //               onTap: (){
  //                  setState(() {
  //                   selectedDesign = false;
  //                   selectedPlaning = true;
  //                   selectedSupervision = false;
  //                   selectedbuilding = false;
  //                   selectedpurchase = false;

  //                 });
  //               },
  //                             child: Container(
  //                 width: 150.0,
  //                 decoration:
  //                     BoxDecoration(border: Border.all(color:(selectedPlaning)?Colors.green: Colors.green[600])),
  //                 child: Center(
  //                     child: Text("المخططات الهندسية",
  //                         style: TextStyle(color: Colors.green[600]))),
  //               ),
  //             )
  //           ],
  //         ),
  //         SizedBox(
  //           height: 20.0,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             InkWell(
  //               onTap: (){
  //                  setState(() {
  //                   selectedDesign = false;
  //                   selectedPlaning = false;
  //                   selectedSupervision = true;
  //                   selectedbuilding = false;
  //                   selectedpurchase = false;

  //                 });
  //               },
  //                             child: Container(
  //                 width: 150.0,
  //                 decoration:
  //                     BoxDecoration(border: Border.all(color:(selectedSupervision)?Colors.green: Colors.green[600])),
  //                 child: Center(
  //                   child: Text(
  //                     "الإشراف",
  //                     style: TextStyle(color: Colors.green[600]),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             InkWell(
  //               onTap: (){
  //                 setState(() {
  //                   selectedDesign = false;
  //                   selectedPlaning = false;
  //                   selectedSupervision = false;
  //                   selectedbuilding = false;
  //                   selectedpurchase = true;

  //                 });
  //               },
  //                             child: Container(
  //                 width: 150.0,
  //                 decoration:
  //                     BoxDecoration(border: Border.all(color:(selectedpurchase)?Colors.green: Colors.green[600])),
  //                 child: Center(
  //                     child: Text("استشارات الشراء",
  //                         style: TextStyle(color: Colors.green[600]))),
  //               ),
  //             )
  //           ],
  //         ),
  //         SizedBox(
  //           height: 10.0,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             InkWell(
  //               onTap: (){
  //                 setState(() {
  //                   selectedDesign = true;
  //                   selectedPlaning = false;
  //                   selectedSupervision = false;
  //                   selectedbuilding = false;
  //                   selectedpurchase = false;

  //                 });
  //               },
  //                             child: Container(
  //                 width: 300.0,
  //                 decoration:
  //                     BoxDecoration(border: Border.all(color: Colors.green[600])),
  //                 child: Center(
  //                     child: Text("التصميم الداخلي",
  //                         style: TextStyle(color: (selectedDesign)?Colors.green:Colors.green[600]))),
  //               ),
  //             )
  //           ],
  //         ),
  //         //  child: Row(
  //         //    mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         //    children: [
  //         //
  //         //     //  VerticalDivider(color: Colors.green[600],thickness: 5,),
  //         //     Container(
  //         //       height: 10,
  //         //       child: Text("|",style: TextStyle(color: Colors.green[600]),),
  //         //     ),
  //         //      Text("المخططات الهندسية",style: TextStyle(color: Colors.green[600]),),

  //         //    ],
  //         //  ),

  //         SizedBox(
  //           height: 30.0,
  //         ),
  //         Divider(),
  //         commonUI.buildRow("رقم الجوال", "رقم الجوال", phoneController),
  //         Divider(),
  //         commonUI.buildRow("المدينة", "المدينة", cityController),
  //         Divider(),
  //         commonUI.buildRow("الوصف", "الوصف", descController),
  //         Divider(),
  //         MaterialButton(
  //           onPressed: () {},
  //           child: Container(
  //             height: 40.0,
  //             width: MediaQuery.of(context).size.width - 150.0,
  //             decoration: BoxDecoration(
  //               shape: BoxShape.rectangle,
  //                 borderRadius: BorderRadius.circular(10.0),
  //                 border: Border.all(
  //                   width: 1.5,
  //                   color: Colors.green[600],
  //                 )),
  //             child: Center(
  //               child:
  //                   Text("إرسال", style: TextStyle(color: Colors.green[600])),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تسهيلات",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        SizedBox(height: MediaQuery.of(context).size.height /4 - 100.0,),
              Align(
                alignment: Alignment.center,
                              child: Image(
                  height: 150.0,
                  width: 200.0,
                
                  image: AssetImage("assets/logo.png"),
                fit: BoxFit.cover,
                ),
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text(
                  facilityTitle,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: color),
                ),
              ],),
             
              SizedBox(
                height: 10.0,
              ),
               Row(
                
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                  facilityDesc,
                  style: TextStyle(color: Colors.grey,fontSize: 17.0),
                ),]
              )
            ],
          ),
      ),
    );
  }
}
