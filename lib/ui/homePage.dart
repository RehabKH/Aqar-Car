import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/apis/eqar/productApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/provider/searchDrawable.dart';
import 'package:real_estate/ui/commonUI.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CommonUI commonUI;
  // bool selectedSearch = false;
  TextEditingController locationController = new TextEditingController();
  List<String> searchList = ["الكل", "الكل", "الكل", "الكل", "الكل"];
  String currentVal = "One";
  bool switchVal = false;
  // CustomBottomNavBar customBottomNavBar ;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // GlobalKey<ScaffoldState> _searchKey = new GlobalKey<ScaffoldState>();
  String contactMessage = "";
  LatLng location1 = new LatLng(27.189946, 31.189949);
  ProductApi productApi = new ProductApi();
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveLogin().then((value) {
      productApi.getAllAnnounceData().then((val) {
        setState(() {
          loading = false;
           _isLoggedIn = value;
        
        });
      });
     
    });
  }



  @override
  Widget build(BuildContext context) {
    // customBottomNavBar = new CustomBottomNavBar(context);
    commonUI = CommonUI();

    return Consumer<DrawableSearch>(builder: (context, drawableSearch, child) {
      return Scaffold(
          key: _scaffoldKey,
          drawer: (drawableSearch.selectedSearch)
              ? commonUI.drawableSearch(context, searchList, currentVal,
                  locationController, switchVal, onchangeVal)
              : commonUI.drawable(
                  context, isLoggedIn:(_isLoggedIn == null) ? false : _isLoggedIn),
          //  ,
          body: (loading)?
          Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(
                          backgroundColor: color,
                        ),
                      )
                    ],
                  ),
                ):Stack(
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
                // markers: Set<Marker>.of(markers.values),
              ),
              commonUI.buildSearchRow(_scaffoldKey, drawableSearch),
              // SizedBox(height: MediaQuery.of(context).size.height -80,),
              Positioned(
                  top: MediaQuery.of(context).size.height - 80,
                  width: MediaQuery.of(context).size.width,
                  child: commonUI.buidbottomContainer(context, _scaffoldKey))
            ],
          ));
    });
  }

  // List<Widget> bottomNavBarItems = <Widget>[

  //  home(),
  //  LoginPage(),
  //   regionsPage(),
  //   myLocation(),

  // ];
  // int _selectedIndex = 0;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

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

  /////////////////////////////google map

  // void _onMarkerDragEnd(MarkerId markerId, LatLng newPosition) async {
  //   final Marker tappedMarker = markers[markerId];
  //   if (tappedMarker != null) {
  //     await showDialog<void>(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //               actions: <Widget>[
  //                 FlatButton(
  //                   child: const Text('OK'),
  //                   onPressed: () => Navigator.of(context).pop(),
  //                 )
  //               ],
  //               content: Padding(
  //                   padding: const EdgeInsets.symmetric(vertical: 66),
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: <Widget>[
  //                       Text('Old position: ${tappedMarker.position}'),
  //                       Text('New position: $newPosition'),
  //                     ],
  //                   )));
  //         });
  //   }
  // }
//   static final LatLng center = const LatLng(-33.86711, 151.1947171);

//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
//   void _add() {
//     var markerIdVal = MyWayToGenerateId();
//     final MarkerId markerId = MarkerId(markerIdVal);

//     // creating a new MARKER
//     final Marker marker = Marker(
//       markerId: markerId,
//       position: LatLng(
//         center.latitude ,
//         center.longitude,
//       ),
//       // infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
//       onTap: () {
//         // _onMarkerTapped(markerId);
//       },
//     );

//     setState(() {
//       // adding a new marker to map
//       markers[markerId] = marker;
//     });
// }
}
