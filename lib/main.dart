// import 'package:cirrus_map_view/map_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/provider/searchDrawable.dart';
import 'package:real_estate/provider/selectedPopUpCar.dart';
import 'package:real_estate/ui/splash.dart';
// import 'package:real_estate/ui/typePage.dart';

void main() {
   // MapView.setApiKey("AIzaSyAeogr8IVZLHr5Zcd8qiNpUk_YhMcjeCZU");
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => DrawableSearch(),
    //   child: MyApp(),
    // ),
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DrawableSearch()),
        
        ListenableProvider(
          create: (context) => CarsProvider(),
         ),
      ],
       child: MyApp(),
  ));
}
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class MyApp extends StatelessWidget {
  
  
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Real Estate',
        theme: ThemeData(
          // primaryColor: color,
          textTheme: GoogleFonts.latoTextTheme(
      Theme.of(context).textTheme,
    ),
         //004d99
        //   iconTheme: new IconThemeData(
        //     color: Colors.amber,
        //     opacity: 1.0,
        //     size: 50.0
        // ),
        //  accentIconTheme: IconThemeData(color: color),
          // primarySwatch:MaterialColor(0xFF880E4F, color2),  
          
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:Splash(),
      );
    }
  }
  
