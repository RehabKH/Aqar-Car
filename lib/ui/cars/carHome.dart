import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/apis/carApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/models/customPopUpModel.dart';
import 'package:real_estate/provider/selectedPopUpCar.dart';
import 'package:real_estate/ui/callUs.dart';
import 'package:real_estate/ui/cars/addCar.dart';
// import 'package:real_estate/ui/eqar/addAnnouncementPages/addAnnounce.dart';
import 'package:real_estate/ui/cars/accountPage.dart';
import 'package:real_estate/ui/cars/cars.dart';
import 'package:real_estate/ui/cars/carsPage.dart';
import 'package:real_estate/ui/cars/commonUI.dart';
import 'package:real_estate/ui/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarHome extends StatefulWidget {
  @override
  _CarHomeState createState() => _CarHomeState();
}

class _CarHomeState extends State<CarHome> {
  // List<CustomPopUpModel> _popupMenu = [
  //   CustomPopUpModel(title: 'الرئيسية', icon: Icons.home),
  //   CustomPopUpModel(title: 'عقارات', icon: Icons.home),
  //   CustomPopUpModel(title: 'سيارات', icon: Icons.directions_car),
  //   CustomPopUpModel(title: 'اتصل بنا', icon: Icons.message),
  // ];
  CarsPage carsPage = new CarsPage();
  CarApi carApi = new CarApi();
  CommonCARUI commonCARUI = new CommonCARUI();
  AccountPage accountPage = new AccountPage();
  int _selectedIndex = 3;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool selectedCars = false;
  Cars cars = new Cars();
  bool loading = true;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _selectedHomeCar = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();

    carApi.getAllCarsCompany().then((val) {
      saveLogin().then((value) {
        setState(() {
          loading = false;
          _isLoggedIn = value;
        });
      });
    });
  }

  Future<bool> saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn");
  }

  @override
  Widget build(BuildContext context) {
    carsPage = new CarsPage(context: context);
    // cars = new Cars();
  
    // Color textColor = Colors.pink;
    List<Widget> _optionBody = <Widget>[
      accountPage.buildBody(),
      Center(
        child: Text("chating"),
      ),
    
      Consumer<CarsProvider>(builder: (context, carsPopUp, child) {
        return
            // (carsPopUp.currentSelected == "سيارات")
            //     ? cars
            //     :
            (loading)
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: CircularProgressIndicator(
                      backgroundColor: color,
                    )),
                  )
                : carsPage.carPageBody(carApi.carCompanyList);
      })
    ];
    return Scaffold(
      key: _scaffoldKey,
      drawer: commonCARUI.accountDrawable(context, isLoggedIn: (_isLoggedIn == null)?false:_isLoggedIn),
      appBar: _optionAppBar.elementAt(_selectedIndex),
      body: _optionBody.elementAt(_selectedIndex),
      // body: Container(child:   carsPage.carPageBody(),),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text(
                'حسابي',
                style: TextStyle(color: Colors.pink),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text(
                'المراسلة',
                style: TextStyle(color: Colors.pink),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text(
                'المفضلة',
                style: TextStyle(color: Colors.pink),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'سيارات',
                style: TextStyle(color: Colors.pink),
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: carColor,

          onTap: _onItemTapped,
          unselectedItemColor: bottomNavTextColor,
          // backgroundColor: Colors.black,
          // fixedColor: HexColor.fromHex("#300317") ,
        ),
      ),
    );
  }

  List<Widget> _optionAppBar = <Widget>[
    AppBar(
      title: Text("الحساب"),
      centerTitle: true,
      backgroundColor: carColor2,
      actions: [
        // IconButton(
        //     icon: Icon(
        //       Icons.more_vert,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       // _scaffoldKey.currentState.openDrawer();
        //     })
      ],
    ),
    AppBar(
      title: Text("المراسلة"),
      centerTitle: true,
      backgroundColor: carColor2,
      actions: [
        Consumer<CarsProvider>(builder: (context, carsPopUp, child) {
          return PopupMenuButton<CustomPopUpModel>(
            elevation: 3.2,
            initialValue: CustomPopUpModel(title: 'الرئيسية', icon: Icons.home),
            onCanceled: () {
              print('You have not chossed anything');
            },
            tooltip: 'This is tooltip',
            onSelected: (val) {
              if (val.title == "الرئيسية") {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => new CarHome()));
              }
              else
              if (val.title == "عقارات") {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => new HomePage()));
              }
              else if(val.title == "سيارات"){
                 Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => new Cars()));
              }
              else if(val.title == "اتصل بنا"){
                 Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => new CallUs()));
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                CustomPopUpModel(title: 'الرئيسية', icon: Icons.home),
                CustomPopUpModel(title: 'عقارات', icon: Icons.home),
                CustomPopUpModel(title: 'سيارات', icon: Icons.directions_car),
                CustomPopUpModel(title: 'اتصل بنا', icon: Icons.message),
              ].map((CustomPopUpModel choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          );
        })
      ],
    ),
    AppBar(
      backgroundColor: carColor2,
      title: Text("اعلانات المفضلة"),
      centerTitle: true,
      actions: [
        Column(
          children: [
            SizedBox(
              height: 20.0,
              width: 20.0,
              child: IconButton(
                  icon: Icon(
                    Icons.add_circle,
                  ),
                  onPressed: () {}),
            ),
            // SizedBox(
            //   height: 5.0,
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 10.0),
              child: Text("اضافة اعلان"),
            )
          ],
        )
      ],
    ),
    AppBar(
      backgroundColor: carColor2,
      title: Text("سيارات"),
      centerTitle: true,
      actions: [
        Consumer<CarsProvider>(builder: (context, carsPopUp, child) {
          return (carsPopUp.currentSelected == "سيارات")
              ? IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => new AddCar()));
                  })
              : PopupMenuButton<CustomPopUpModel>(
                  elevation: 3.2,
                  initialValue:
                      CustomPopUpModel(title: 'الرئيسية', icon: Icons.home),
                  onCanceled: () {
                    print('You have not chossed anything');
                  },
                  tooltip: 'This is tooltip',
                  onSelected: (val) {
                     if (val.title == "الرئيسية") {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => new CarHome()));
              }
               else if (val.title == "عقارات") {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => new HomePage()));
              }
              else if(val.title == "سيارات"){
                 Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => new Cars()));
              }
              else if(val.title == "اتصل بنا"){
                 Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => new CallUs()));
              }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      CustomPopUpModel(title: 'الرئيسية', icon: Icons.home),
                      CustomPopUpModel(title: 'عقارات', icon: Icons.home),
                      CustomPopUpModel(
                          title: 'سيارات', icon: Icons.directions_car),
                      CustomPopUpModel(title: 'اتصل بنا', icon: Icons.message),
                    ].map((CustomPopUpModel choice) {
                      return PopupMenuItem(
                        value: choice,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            choice.title,
                            style: TextStyle(color: Colors.pink),
                          ),
                        ),
                      );
                    }).toList();
                  },
                );
        })
        // Column(
        //   children: [
        //     IconButton(
        //         icon: Icon(
        //           Icons.add_circle,
        //           color: Colors.white,
        //         ),
        //         onPressed: () {}),
        //     Text("اضافة اعلان"),
        //   ],
        // )
      ],
    ),
  ];
}
