// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:real_estate/ui/bottomNavBarPages/loginPage.dart';
// import 'package:real_estate/ui/registerPage.dart';

// class CustomBottomNavBar {
//   BuildContext context;
//   CustomBottomNavBar(this.context);
//   // Widget regionsPage() {
//   //   return 
//   // }

//   Widget myLocation() {
//     return 
//   }

//   Widget home() {
//     return Stack(
//       children: <Widget>[
// // mapView.show(
// //         new MapOptions(
// //             mapViewType: MapViewType.normal,
// //             showUserLocation: true,
// //             // initialCameraPosition: new CameraPosition(
// //             //     new Location(45.5235258, -122.6732493), 14.0, target: null),
// //             title: "Recently Visited"),
// //         toolbarActions: [new ToolbarAction("Close", 1)]);
//         GoogleMap(
//           initialCameraPosition:
//               CameraPosition(target: LatLng(27.044515, 31.325309), zoom: 16.0),
//           onMapCreated: (map) {
//             // _mapController = map;
//           },
//           myLocationEnabled: true,
//           mapType: MapType.normal,
//           compassEnabled: true,
//           zoomGesturesEnabled: true,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 15.0, top: 50.0, right: 15.0),
//           child: Container(
//             // height: 80.0,
//             // width: MediaQuery.of(context).size.width - 100.0,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(25.0),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 textDirection: TextDirection.ltr,
//                 children: <Widget>[
//                   InkWell(
//                     onTap: () {},
//                     child: Text(
//                       "فيلا للبيع",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Text(
//                       "شقه للاجار",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Text(
//                       "الكل",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                         height: 40.0,
//                         width: 40.0,
//                         decoration: BoxDecoration(boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.3),
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: Offset(0, 4), // changes position of shadow
//                           ),
//                         ], shape: BoxShape.circle, color: Colors.green),
//                         child: Icon(
//                           Icons.search,
//                           color: Colors.white,
//                         )),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         buidbottomContainer()
//       ],
//     );
//   }

// // BuildContext context;

//   Widget drawer() {
//     return Drawer(
//       child: Column(
//         children: [
//           Container(
//             // height: MediaQuery.of(context).size.height - 80.0,
//             child: ListView(
//               shrinkWrap: true,
//               children: [
//                 Container(
//                   height: 50.0,
//                   color: Colors.grey,
//                   child: Row(
//                     children: [
//                       Text(
//                         "English",
//                         style: TextStyle(color: Colors.green),
//                       ),
//                       IconButton(
//                           icon: Icon(
//                             Icons.assignment,
//                             color: Colors.green,
//                           ),
//                           onPressed: () {}),
//                       SizedBox(
//                         width: 15.0,
//                       ),
//                       Text(
//                         "أسرار البناء",
//                         style: TextStyle(color: Colors.blue[900]),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 90.0,
//                 ),
//                 Center(
//                   child: Row(
//                     children: [
//                       Text("تسجيل الدخول",
//                           style: TextStyle(color: Colors.green)),
//                       // Icon(Icons)
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 Container(
//                     child: GridView.builder(
//                         gridDelegate:
//                             new SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 5.0,
//                           //for height of card
//                           childAspectRatio: 0.6,
//                           //for horizontal space
//                           mainAxisSpacing: 6.0,
//                         ),
//                         itemCount: 10,
//                         itemBuilder: (BuildContext context, int index) {
//                           return buildContainer(
//                               Icons.favorite_border, "الطلبات");
//                         }))
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   // Widget buidbottomContainer() {
//   //   return Padding(
//   //     padding: const EdgeInsets.only(top: 600.0),
//   //     child: Container(
//   //       height: 80.0,
//   //       color: Colors.white,
//   //       // width: MediaQuery.of(context).size.width,
//   //       child: Padding(
//   //         padding: const EdgeInsets.only(top: 8.0),
//   //         child: Row(
//   //           mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //           children: [
//   //             InkWell(
//   //                 onTap: () {
//   //                   print("selected home");
//   //                   return home();
//   //                 },
//   //                 child: buildContainer((Icons.format_list_bulleted), "قاىمة")),
//   //             InkWell(
//   //                 onTap: () {
//   //                   Navigator.of(context).push(MaterialPageRoute(
//   //                       builder: (context) => new LoginPage()));
//   //                   // selectedChat = true;
//   //                   // selectedDrawer = false;
//   //                   // selectedHome = false;
//   //                   // selectedLocation = false;
//   //                   // selectedarea = false;
//   //                 },
//   //                 child: buildContainer((Icons.chat), "محادثة")),
//   //             InkWell(
//   //                 onTap: () {
//   //                   return regionsPage();
//   //                   // Navigator.of(context).push(MaterialPageRoute(
//   //                   //     builder: (context) => new RegisterPage()));
//   //                   // selectedChat = false;
//   //                   // selectedDrawer = false;
//   //                   // selectedHome = false;
//   //                   // selectedLocation = false;
//   //                   // selectedarea = true;
//   //                 },
//   //                 child: buildContainer((Icons.place), "المناطق")),
//   //             InkWell(
//   //                 onTap: () {
//   //                   return myLocation();
                  
//   //                 },
//   //                 child: buildContainer((Icons.gps_fixed), "موقعي")),
//   //             InkWell(
//   //                 onTap: () {
//   //                   print("selected my account");
                    
//   //                 },
//   //                 child: buildContainer((Icons.add), "حسابي")),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   Widget buildContainer(IconData icon, String title) {
//     return Center(
//       child: Column(
//         children: [
//           Icon(
//             icon,
//             color: Colors.green,
//           ),
//           SizedBox(
//             height: 5.0,
//           ),
//           Text(
//             title,
//             style: TextStyle(color: Colors.green),
//           )
//         ],
//       ),
//     );
//   }
// }
// // Widget regionsPage() {
// //     return Stack(children: <Widget>[
// //       GoogleMap(
// //         initialCameraPosition:
// //             CameraPosition(target: LatLng(27.044515, 31.325309), zoom: 16.0),
// //         onMapCreated: (map) {
// //           // _mapController = map;
// //         },
// //         myLocationEnabled: true,
// //         mapType: MapType.normal,
// //         compassEnabled: true,
// //         zoomGesturesEnabled: true,
// //       ),
// //       // buidbottomContainer()
// //     ]);
// //   }

// //   Widget myLocation() {
// //     return Stack(
// //       children: <Widget>[
// // // mapView.show(
// // //         new MapOptions(
// // //             mapViewType: MapViewType.normal,
// // //             showUserLocation: true,
// // //             // initialCameraPosition: new CameraPosition(
// // //             //     new Location(45.5235258, -122.6732493), 14.0, target: null),
// // //             title: "Recently Visited"),
// // //         toolbarActions: [new ToolbarAction("Close", 1)]);
// //         GoogleMap(
// //           initialCameraPosition:
// //               CameraPosition(target: LatLng(27.044515, 31.325309), zoom: 16.0),
// //           onMapCreated: (map) {
// //             // _mapController = map;
// //           },
// //           myLocationEnabled: true,
// //           mapType: MapType.normal,
// //           compassEnabled: true,
// //           zoomGesturesEnabled: true,
// //         ),
// //         Padding(
// //           padding: const EdgeInsets.only(left: 15.0, top: 50.0, right: 15.0),
// //           child: Container(
// //             // height: 80.0,
// //             // width: MediaQuery.of(context).size.width - 100.0,
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(25.0),
// //             ),
// //             child: Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                 textDirection: TextDirection.ltr,
// //                 children: <Widget>[
// //                   InkWell(
// //                     onTap: () {},
// //                     child: Text(
// //                       "فيلا للبيع",
// //                       style: TextStyle(color: Colors.grey),
// //                     ),
// //                   ),
// //                   InkWell(
// //                     onTap: () {},
// //                     child: Text(
// //                       "شقه للاجار",
// //                       style: TextStyle(color: Colors.grey),
// //                     ),
// //                   ),
// //                   InkWell(
// //                     onTap: () {},
// //                     child: Text(
// //                       "الكل",
// //                       style: TextStyle(color: Colors.grey),
// //                     ),
// //                   ),
// //                   InkWell(
// //                     onTap: () {},
// //                     child: Container(
// //                         height: 40.0,
// //                         width: 40.0,
// //                         decoration: BoxDecoration(boxShadow: [
// //                           BoxShadow(
// //                             color: Colors.grey.withOpacity(0.3),
// //                             spreadRadius: 1,
// //                             blurRadius: 2,
// //                             offset: Offset(0, 4), // changes position of shadow
// //                           ),
// //                         ], shape: BoxShape.circle, color: Colors.green),
// //                         child: Icon(
// //                           Icons.search,
// //                           color: Colors.white,
// //                         )),
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //         // buidbottomContainer()
// //       ],
// //     );
// //   }


// // // BuildContext context;

// //   Widget drawer() {
// //     return Drawer(
// //       child: Column(
// //         children: [
// //           Container(
// //             // height: MediaQuery.of(context).size.height - 80.0,
// //             child: ListView(
// //               shrinkWrap: true,
// //               children: [
// //                 Container(
// //                   height: 50.0,
// //                   color: Colors.grey,
// //                   child: Row(
// //                     children: [
// //                       Text(
// //                         "English",
// //                         style: TextStyle(color: Colors.green),
// //                       ),
// //                       IconButton(
// //                           icon: Icon(
// //                             Icons.assignment,
// //                             color: Colors.green,
// //                           ),
// //                           onPressed: () {}),
// //                       SizedBox(
// //                         width: 15.0,
// //                       ),
// //                       Text(
// //                         "أسرار البناء",
// //                         style: TextStyle(color: Colors.blue[900]),
// //                       )
// //                     ],
// //                   ),
// //                 ),
// //                 SizedBox(
// //                   height: 90.0,
// //                 ),
// //                 Center(
// //                   child: Row(
// //                     children: [
// //                       Text("تسجيل الدخول",
// //                           style: TextStyle(color: Colors.green)),
// //                       // Icon(Icons)
// //                     ],
// //                   ),
// //                 ),
// //                 SizedBox(height: 20.0),
// //                 Container(
// //                     child: GridView.builder(
// //                         gridDelegate:
// //                             new SliverGridDelegateWithFixedCrossAxisCount(
// //                           crossAxisCount: 2,
// //                           crossAxisSpacing: 5.0,
// //                           //for height of card
// //                           childAspectRatio: 0.6,
// //                           //for horizontal space
// //                           mainAxisSpacing: 6.0,
// //                         ),
// //                         itemCount: 10,
// //                         itemBuilder: (BuildContext context, int index) {
// //                           return buildContainer(
// //                               Icons.favorite_border, "الطلبات");
// //                         }))
// //               ],
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }

// //   Widget buildContainer(IconData icon, String title) {
// //     return Center(
// //       child: Column(
// //         children: [
// //           Icon(
// //             icon,
// //             color: Colors.green,
// //           ),
// //           SizedBox(
// //             height: 5.0,
// //           ),
// //           Text(
// //             title,
// //             style: TextStyle(color: Colors.green),
// //           )
// //         ],
// //       ),
// //     );
// //   }
