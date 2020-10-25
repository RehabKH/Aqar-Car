import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:real_estate/ui/bottomNavBarPages/loginPage.dart';
import 'package:real_estate/ui/commonUI.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegionsPage extends StatefulWidget {
  @override
  _RegionsPageState createState() => _RegionsPageState();
}

class _RegionsPageState extends State<RegionsPage> {
  CommonUI commonUI = new CommonUI();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
    return Scaffold(
        key: _scaffoldKey,
        drawer: commonUI.drawable(context,isLoggedIn:_isLoggedIn),
        body: Stack(children: <Widget>[
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
          Positioned(
              top:MediaQuery.of(context).size.height -80 ,
              width: MediaQuery.of(context).size.width,child: commonUI.buidbottomContainer(context, _scaffoldKey))
        ]));
  }

   bool _isLoggedIn = false;
  Future<bool> saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn");
  }
}
