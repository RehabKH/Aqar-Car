import 'package:flutter/material.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/itemModel.dart';
import 'package:real_estate/ui/callUs.dart';
import 'package:real_estate/ui/cars/addCar.dart';
// import 'package:real_estate/ui/eqar/addAnnouncementPages/addAnnounce.dart';
import 'package:real_estate/ui/bottomNavBarPages/loginPage.dart';
import 'package:real_estate/ui/cars/cars.dart';

class CommonCARUI {
  List<ItemModel> itemModel = [
    new ItemModel(Icons.add, "إضف إعلانك"),
    new ItemModel(Icons.announcement, "اعلاناتى"),
    new ItemModel(Icons.favorite, "اعلانات مفضلة"),
    // new ItemModel(Icons.report, "تقارير موجز"),
    // new ItemModel(Icons.local_offer, "نظام الخصم"),
    new ItemModel(Icons.insert_invitation, "رسوم الاعلان"),
    // new ItemModel(Icons.settings, "اعدادات"),
    new ItemModel(Icons.event_note, "معاهدة استخدام الخدمة"),
    new ItemModel(Icons.call, "اتصل بنا"),

//offline_bolt
  ];
  Widget buildIconColumn(String title, IconData icon, Color iconColor) {
    return Column(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(height: 5.0),
        Text(
          title,
          style: TextStyle(color: color),
        ),
      ],
    );
  }

  Widget accountDrawable(BuildContext context, {bool isLoggedIn = false}) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            // shrinkWrap: true,
            children: [
              SizedBox(
                height: 60.0,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    if (!isLoggedIn) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => new LoginPage()));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text((isLoggedIn)?"تسجيل خروج":"تسجيل الدخول",
                          style: TextStyle(color: color, fontSize: 15.0)),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.input,
                        color: carColor2,
                        size: 30.0,
                      )
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 20.0),
              Container(
                  height: MediaQuery.of(context).size.height - 90.0,
                  child: GridView.builder(
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        //for height of card
                        childAspectRatio: 1.4,
                        //for horizontal space
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: itemModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDrawableContainer(context, index,
                            itemModel[index].icon, itemModel[index].title,isLoggedIn);
                      })),
            ],
          ),
        ),
        // Divider(
        //   color: carColor2,
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 8.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       InkWell(
        //         onTap: () {
        //           Navigator.of(context).push(
        //               MaterialPageRoute(builder: (context) => new CallUs()));
        //         },
        //         child: Text(
        //           "اتصل بنا",
        //           style: TextStyle(color: color, fontSize: 15.0),
        //         ),
        //       ),
        //       // InkWell(
        //       //   onTap: () {
        //       //     Navigator.of(context).push(
        //       //         MaterialPageRoute(builder: (context) => new AboutApp()));
        //       //   },
        //       //   child: Text(
        //       //     "عن تطبيق عقار",
        //       //     style: TextStyle(color: color, fontSize: 15.0),
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // )
      ],
    ));
    // return Drawer(

    //   child: Container(
    //     decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           height: 100.0,
    //         ),
    //         Container(
    //           color: Colors.white,
    //           // height: MediaQuery.of(context).size.height -200.0
    //           child: Column(
    //             children: [
    //               Text("اضف اعلان"),
    //               Divider(),
    //               Text("اعلاناتى"),
    //               Divider(),
    //               Text("اعلانات مفضلة"),
    //               Divider(),
    //               Text("تقارير موجز"),
    //               Divider(),
    //               Text("نظام الخصم"),
    //               Divider(),
    //               Text("رسوم الاعلان"),
    //               Divider(),
    //               Text("اعدادات"),
    //               Divider(),
    //               Text("معاهدة استخدام الخدمة"),
    //               Divider(),
    //               Text("اتصل بنا"),
    //               Divider(),
    //               Text("تسجيل الخروج"),
    //               Divider(),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget buildDrawableContainer(
      BuildContext context, int index, IconData icon, String title,bool isLoggedLin) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          if (index == 0) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => new AddCar()));
          }
          else if(index == 1){
              Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => new Cars()));
          }
           else if(index == 8){
              Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => new CallUs()));
          }
        },
        child: Container(
          height: 80.0,
          width: 50.0,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: carColor2,
                  size: 30.0,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
