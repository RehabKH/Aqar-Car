import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/provider/searchDrawable.dart';
// import 'package:real_estate/ui/bottomNavBarPages/loginPage.dart';
import 'package:real_estate/ui/commonUI.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocation extends StatefulWidget {
  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool switchVal = false;
  TextEditingController locationController = new TextEditingController();
  CommonUI commonUI = new CommonUI();
    List<String> searchList = ["الكل", "الكل", "الكل", "الكل", "الكل"];
  String currentVal = "One";
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveLogin().then((value) {
      setState(() {
        _isLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawableSearch>(builder: (context, drawableSearch, child) {
      return Scaffold(
          key: _scaffoldKey,
          drawer: (drawableSearch.selectedSearch)
              ? commonUI.drawableSearch(context, searchList, currentVal,
                  locationController, switchVal, onchangeVal)
              : commonUI.drawable(context,isLoggedIn:_isLoggedIn),
          body: Stack(
            children: <Widget>[
// mapView.show(
//         new MapOptions(
//             mapViewType: MapViewType.normal,
//             showUserLocation: true,
//             // initialCameraPosition: new CameraPosition(
//             //     new Location(45.5235258, -122.6732493), 14.0, target: null),
//             title: "Recently Visited"),
//         toolbarActions: [new ToolbarAction("Close", 1)]);
              GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(27.044515, 31.325309), zoom: 16.0),
                onMapCreated: (map) {
                  // _mapController = map;
                },
                myLocationEnabled: true,
                mapType: MapType.normal,
                compassEnabled: true,
                zoomGesturesEnabled: true,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15.0, top: 50.0, right: 15.0),
              //   child: Container(
              //     // height: 80.0,
              //     // width: MediaQuery.of(context).size.width - 100.0,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(25.0),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         textDirection: TextDirection.ltr,
              //         children: <Widget>[
              //           InkWell(
              //             onTap: () {},
              //             child: Text(
              //               "فيلا للبيع",
              //               style: TextStyle(color: Colors.grey),
              //             ),
              //           ),
              //           InkWell(
              //             onTap: () {},
              //             child: Text(
              //               "شقه للاجار",
              //               style: TextStyle(color: Colors.grey),
              //             ),
              //           ),
              //           InkWell(
              //             onTap: () {},
              //             child: Text(
              //               "الكل",
              //               style: TextStyle(color: Colors.grey),
              //             ),
              //           ),
              //           InkWell(
              //             onTap: () {},
              //             child: Container(
              //                 height: 40.0,
              //                 width: 40.0,
              //                 decoration: BoxDecoration(boxShadow: [
              //                   BoxShadow(
              //                     color: Colors.grey.withOpacity(0.3),
              //                     spreadRadius: 1,
              //                     blurRadius: 2,
              //                     offset: Offset(0, 4), // changes position of shadow
              //                   ),
              //                 ], shape: BoxShape.circle, color: Colors.green),
              //                 child: Icon(
              //                   Icons.search,
              //                   color: Colors.white,
              //                 )),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              commonUI.buildSearchRow(_scaffoldKey, drawableSearch),
              Positioned(
                  top: MediaQuery.of(context).size.height - 80,
                  width: MediaQuery.of(context).size.width,
                  child: commonUI.buidbottomContainer(context, _scaffoldKey))
            ],
          ));
    });
  }
   onchangeVal(val) {
    setState(() {
      currentVal = val;
    });
  }
  bool _isLoggedIn = false;
  Future<bool> saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn");
  }
}
