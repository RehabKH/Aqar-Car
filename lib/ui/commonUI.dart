
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/itemModel.dart';
import 'package:real_estate/models/cityModel.dart';
import 'package:real_estate/provider/searchDrawable.dart';
import 'package:real_estate/ui/MarketingSolutions.dart';
import 'package:real_estate/ui/aboutApp.dart';
import 'package:real_estate/ui/eqar/addAnnouncementPages/addAnnounce.dart';
import 'package:real_estate/ui/allAnnouncePage.dart';
import 'package:real_estate/ui/announceToday.dart';
import 'package:real_estate/ui/bottomNavBarPages/loginPage.dart';
import 'package:real_estate/ui/bottomNavBarPages/myLocationPage.dart';
import 'package:real_estate/ui/bottomNavBarPages/regionsPage.dart';
import 'package:real_estate/ui/calculatorPage.dart';
import 'package:real_estate/ui/callUs.dart';
import 'package:real_estate/ui/facilities.dart';
// import 'package:real_estate/ui/construction.dart';
import 'package:real_estate/ui/eqarNotes.dart';
import 'package:real_estate/ui/offers.dart';
import 'package:real_estate/ui/officePage.dart';
import 'package:real_estate/ui/order.dart';
import 'package:real_estate/ui/eqar/priceOffer.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool selectedSearch = false;

class CommonUI {
  List<ItemModel> itemModel = [
    new ItemModel(Icons.announcement, "عقارات"),
    new ItemModel(Icons.add, "إضف إعلانك"),
    new ItemModel(Icons.turned_in, "عروض مميزة"),
    new ItemModel(Icons.description, "عقود إيجار"),
    new ItemModel(Icons.build, "تسهيلات"),
    new ItemModel(Icons.assignment, "حاسبة التمويل العقاري"),
    new ItemModel(Icons.insert_invitation, "إعلانات اليوم"),
    new ItemModel(Icons.favorite_border, "المفضلة"),
    new ItemModel(Icons.notifications, "الطلبات"),
    new ItemModel(Icons.note, "مدونة عقار"),
    new ItemModel(Icons.note, "حلول تسويقيه"),
    new ItemModel(Icons.note, "المعارض والمكاتب"),
    new ItemModel(Icons.flag, "الخدمات"),
    new ItemModel(Icons.turned_in, "عروض الاسعار"),

//offline_bolt
  ];

  Widget buildContainer(IconData icon, String title) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Container(
        // height: 80.0,
        // width: 50.0,
        decoration: BoxDecoration(

            // color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
                size: 20.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                title,
                style: TextStyle(color: color, fontSize: 16.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawableContainer(BuildContext context, int index, IconData icon,
      String title, bool isLoggedIn) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          if (index == 0) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => new AllAnnouncePage()));
          } else if (index == 1) {
            if ((isLoggedIn)) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => new AddAnnounce("عقار")));
            } else {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => new LoginPage()));
            }

            //
          } else if (index == 2) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => new Offers()));
          } else if (index == 3) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => new Order()));
          } else if (index == 4) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => new Construction()));
          } else if (index == 9) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => new EqarNotes()));
          } else if (index == 5) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => new CalculatorPage()));
          } else if (index == 6) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => new AnnouncePage()));
          } else if (index == 10) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => new MarketingSolutions()));
          } else if (index == 11) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => new OfficePage()));
          } else if (index == 12) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => new AllAnnouncePage()));
          } else if (index == 13) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => new PriceOffer()));
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => new LoginPage()));
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
                  color: color,
                  size: 30.0,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  title,
                  style: TextStyle(color: color, fontSize: 15.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSearchRow(scaffoldKey, drawableSearch) {
    // return Consumer<DrawableSearch>(builder: (context, drawableSearch, child) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 50.0, right: 15.0),
      child: Container(
        // height: 80.0,
        // width: MediaQuery.of(context).size.width - 100.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Text(
                  "فيلا للبيع",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "شقه للاجار",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "الكل",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              InkWell(
                onTap: () {
                  drawableSearch.changeDrawable(true);
                  // setState(() {
                  //   selectedSearch = true;
                  // });
                  scaffoldKey.currentState.openDrawer();
                },
                child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ], shape: BoxShape.circle, color: color),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30.0,
                    )),
              )
            ],
          ),
        ),
      ),
    );
    // });
  }

  Widget buidbottomContainer(BuildContext context, scaffoldKey) {
    return Consumer<DrawableSearch>(builder: (context, drawableSearch, child) {
      return Container(
        height: 80.0,
        color: Colors.white,
        // width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    print("selected home");
                    scaffoldKey.currentState.openDrawer();

                    drawableSearch.changeDrawable(false);
                    // return home();
                  },
                  child: buildContainer((Icons.list), "قاىمة")),
              InkWell(
                  onTap: () {
                   
                    // selectedChat = true;
                    // selectedDrawer = false;
                    // selectedHome = false;
                    // selectedLocation = false;
                    // selectedarea = false;
                  },
                  child: buildContainer((Icons.chat), "محادثة")),
              InkWell(
                  onTap: () {
                    // return regionsPage();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => new RegionsPage()));
                    // selectedChat = false;
                    // selectedDrawer = false;
                    // selectedHome = false;
                    // selectedLocation = false;
                    // selectedarea = true;
                  },
                  child: buildContainer((Icons.place), "المناطق")),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => new MyLocation()));
                    // return myLocation();
                  },
                  child: buildContainer((Icons.gps_fixed), "موقعي")),
              InkWell(
                  onTap: () {
                    // scaffoldKey.currentState.setState(() {
                    //   selectedSearch = false;

                    // });
                  },
                  child: buildContainer((Icons.add), "حسابي")),
            ],
          ),
        ),
      );
    });
  }

  Widget loginTextField(String hint, IconData icon,
      TextEditingController controller, Color _color) {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0, left: 40.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0)),
        height: 45.0,
        // width:/ ,
        child: Theme(
          data: new ThemeData(
            primaryColor: _color,
            primaryColorDark: _color,
          ),
          child: Padding(
            padding: (hint == "موقع الحريطة الحالى")
                ? const EdgeInsets.only(left: 10.0, right: 10.0)
                : const EdgeInsets.only(left: 50.0, right: 50.0),
            child: Container(
              width: 350.0,
              child: Center(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    style: TextStyle(color: _color),
                    controller: controller,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "هذا الحقل لا يمكن ان يكون فارغ";
                      }
                      if (hint == "البريد الالكترونى") {
                        String email =
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
                        RegExp regExp = RegExp(email);
                        if (!regExp.hasMatch(val)) {
                          return "يرجى كتابة بريد اليكترونى صحيح";
                        }
                        return null;
                      } else
                        return null;
                    },
                    // onChanged: (val) {
                    //   // updateTitle();
                    // },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        icon,
                        color: _color,
                      ),
                      hintText: hint,

                      // enabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(5.0),
                      //       bottomLeft: Radius.circular(5.0)),

                      //   borderSide: BorderSide(
                      //       color: Colors.black, style: BorderStyle.solid),

                      //   // color:Colors.grey
                      // ),
                      hintStyle: TextStyle(color: Colors.grey),
                      // labelStyle: TextStyle(color: Colors.white),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(5.0),
                      //       bottomLeft: Radius.circular(5.0)),
                      //   borderSide: BorderSide(
                      //     color: Colors.black,
                      //   ),

                      //   // color:Colors.grey
                      // )
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(String hint, String text, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Theme(
                data: new ThemeData(
                  primaryColor: color,
                  primaryColorDark: color,
                ),
                child: TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return "هذا الحقل لا يمكن ان يكون فارغ";
                    }
                    return null;
                  },
                  textAlign: TextAlign.right,
                  style: TextStyle(color: color),
                  // textDirection: TextDirection.rtl,
                  controller: controller,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                      border: OutlineInputBorder(

                          // color:Colors.grey
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),

                        borderSide: BorderSide(
                            color: Colors.grey, style: BorderStyle.solid),

                        // color:Colors.grey
                      ),
                      hintText: hint,
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
            ),
            SizedBox(
              width: 25.0,
            ),
            Text(
              text,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }

  Widget drawable(BuildContext context, {bool isLoggedIn = false}) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 60.0,
          child: Column(
            // shrinkWrap: true,
            children: [
            SizedBox(
                height: 40.0,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    if (isLoggedIn) {
                      clearLogin().then((value) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => new LoginPage()));
                      });
                    }
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => new LoginPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text((isLoggedIn) ? "تسجيل الخروج" : "تسجيل الدخول",
                          style: TextStyle(color: color, fontSize: 15.0)),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.input,
                        color: color,
                        size: 30.0,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                  height: 520.0,
                 
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
                        return buildDrawableContainer(
                            context,
                            index,
                            itemModel[index].icon,
                            itemModel[index].title,
                            isLoggedIn);
                      })),
            ],
          ),
        ),
        Divider(
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => new CallUs()));
                },
                child: Text(
                  "اتصل بنا",
                  style: TextStyle(color: color, fontSize: 15.0),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => new AboutApp()));
                },
                child: Text(
                  "عن تطبيق عقار",
                  style: TextStyle(color: color, fontSize: 15.0),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }

  //drawable search
  Widget drawableSearch(
      BuildContext context,
      List<String> list,
      String currentVal,
      TextEditingController locationController,
      bool switchVal,
      Function onChangeVal) {
    return Drawer(
        child: Column(children: [
      Container(
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
      ),
      Divider(),
      DropdownButton<String>(
        // hint: Padding(
        //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        //   child: Text((list.length <= 0) ? "No Data Found" : "select ",
        //       style: TextStyle(color: Colors.indigo[300])),
        // ),
        underline: Container(color: (Colors.indigo[50])),
        iconEnabledColor: color,
        iconDisabledColor: color,
        value: currentVal,
        items: ['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, top: 13.0),
                child: new Text(value, style: TextStyle(color: color)),
              ),
            ),
          );
        }).toList(),
        onChanged: onChangeVal,
      ),
      Divider(),
      loginTextField(
          "موقع الحريطة الحالى", Icons.location_on, locationController, color),
      SizedBox(
        height: 20.0,
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 50.0,
            width: 200.0,
            decoration: BoxDecoration(border: Border.all(color: color)),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "بحث",
                    style: TextStyle(color: color),
                  )
                ],
              ),
              // child: RichText(
              //     text: TextSpan(children: [
              //   TextSpan(
              //       text: "بحث\n",
              //       style: TextStyle(
              //           color: Colors.blue[800], fontWeight: FontWeight.bold)),
              //   TextSpan(
              //       text: "بحث 44 إعلان",
              //       style: TextStyle(
              //         color: Colors.blue[800],
              //       ))
              // ])),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "الإعلانات خلال اسبوعين فقط",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: 20.0,
          ),
          Switch(
            value: switchVal,
            onChanged: (val) {
              switchVal = val;
            },
            activeColor: Colors.teal,
          )
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height - 450.0,
      ),
      InkWell(
        onTap: () {},
        child: Text(
          "< تصفح برقم اللإعلان او الجوال",
          style: TextStyle(color: color, fontSize: 17.0),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
    ]));
  }

  /////////////////////////////////////////search row
  Widget searchRow(
      TextEditingController searchController, BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width - 40.0,
        height: 50.0,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Flexible(
            child: Container(
              // height: 40.0,
              child: Theme(
                data: new ThemeData(
                  primaryColor: color,
                  // primaryColorDark: Colors.amberAccent[400],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                  child: Container(
                    width: 350.0,
                    child: Center(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: searchController,
                          // style:  TextStyle(color:Colors.white),

                          // onChanged: (val) {
                          //   // updateTitle();
                          // },

                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 20.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.0),
                                          bottomLeft: Radius.circular(5.0))),
                                  // child: Center(
                                  //   child: Image.asset(
                                  //     "files/imgs/serch.png",
                                  //     height: 30.0,
                                  //     width: 30.0,
                                  // )  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                              hintText: "بحث",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 7.0, vertical: 0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0)),

                                borderSide: BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.solid),

                                // color:Colors.grey
                              ),
                              hintStyle: TextStyle(color: color),
                              // labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0)),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),

                                // color:Colors.grey
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(width: 10.0),
          // Padding(
          //   padding: const EdgeInsets.only(right: 30.0, top: 10.0),
          //   child: InkWell(
          //     onTap: () {},
          //     child: new Container(
          //         margin: new EdgeInsets.symmetric(horizontal: 1.0),
          //         child: Center(
          //           child: Text(
          //             "بحث",
          //             style: TextStyle(color: color),
          //           ),
          //         )),
          //   ),
          // ),
        ]));
  }

  Widget buildGridView(List officeList, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 210.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(400.0)),
      child: GridView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            // height: 400.0,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: (officeList[index] == null)
                        ? AssetImage("assets/builder.jpg")
                        : NetworkImage("http://" + officeList[index].imgUrl)),
                borderRadius: BorderRadius.circular(10.0)),
            child: Center(
              child: Text(
                officeList[index].titleAr ?? "",
                style: TextStyle(color: carColor, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
        itemCount: officeList.length,
        //_allCompanies.length,
        // primary: false,
        padding: const EdgeInsets.only(left: 20, right: 20.0),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5.0,
          //for height of card
          childAspectRatio: 0.9,
          //for horizontal space
          mainAxisSpacing: 8.0,
        ),
      ),
    );
  }

  Widget buildAddOfficeRow(BuildContext context) {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
      width: MediaQuery.of(context).size.width / 3 + 30.0,
      child: Center(
        child: Text(
          "اضف مكتب / معرض جديد",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> clearLogin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Widget buildDropDownList(List<String> myList, String currentVal,
      Function onChangeFunc, Color _color) {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0, left: 40.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0)
            //       border: Border(

            // bottom: BorderSide(
            //   color: Colors.grey,

            // )
            // )),
            ),
        child: DropdownButton<String>(
            // hint: Padding(
            //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            //   child: Text((list.length <= 0) ? "No Data Found" : "select ",
            //       style: TextStyle(color: Colors.indigo[300])),
            // ),
            underline: Container(color: _color),
            iconEnabledColor: _color,
            iconDisabledColor: _color,
            value: currentVal,
            isExpanded: true,
            items: myList.map<DropdownMenuItem<String>>((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 13.0),
                    child: new Text(value, style: TextStyle(color: _color)),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChangeFunc),
      ),
    );
  }

  Widget buildCountryDropDownList(List<CityModel> myList, CityModel currentVal,
      Function onChangeFunc, Color _color) {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0, left: 40.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0)),
        //       border: Border(

        // bottom: BorderSide(
        //   color: Colors.grey,

        // ))),
        child: DropdownButton<CityModel>(
            underline: Container(color: (_color)),
            iconEnabledColor: _color,
            iconDisabledColor: _color,
            value: currentVal,
            isExpanded: true,
            items: myList.map<DropdownMenuItem<CityModel>>((value) {
              return new DropdownMenuItem<CityModel>(
                value: value,
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 13.0),
                    child: new Text(value.name ?? "name",
                        style: TextStyle(color: _color)),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChangeFunc),
      ),
    );
  }

  // bool isLoggedIn;

  // Future<String> getUserID() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   isLoggedIn = prefs.getBool("isLoggedIn");
  //   // userID = prefs.getString("userID");
  // return prefs.getString("userID");
  // }
}
