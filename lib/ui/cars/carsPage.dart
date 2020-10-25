import 'package:flutter/material.dart';
import 'package:real_estate/apis/carApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/models/carModel.dart';
// import 'package:real_estate/ui/announceDetails.dart';
// import 'package:real_estate/ui/cars/advertisingDetails.dart';
import 'package:real_estate/ui/cars/selectedCarCompany.dart';
import 'package:real_estate/ui/commonUI.dart';

class CarsPage {
  BuildContext context;
  CarsPage({this.context});
  CommonUI commonUI = new CommonUI();
  bool loading = false;
  CarApi carApi = new CarApi();
  TextEditingController searchController = new TextEditingController();
  Widget carPageBody(List<CarModel> carList) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              elevation: 0.5,
              textColor: carColor,
              onPressed: () {},
              child: Center(
                child: Text("الخدمات"),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            RaisedButton(
              elevation: 0.5,
              textColor: carColor,
              onPressed: () {},
              child: Center(
                child: Text("كل الماركات"),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        gridView(carList)
      ],
    );
  }

  Widget gridView(List<CarModel> carModel) {
    Color _color = Colors.green;
    return Column(
      children: [
        // Row(
        //   children: [
        //     commonUI.searchRow(searchController, context),
        //     SizedBox(
        //       width: 15.0,
        //     ),
        //     // commonUI.buildAddOfficeRow(context),
        //   ],
        // ),
        SizedBox(height: 10.0),
        (loading)
            ? Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ),
                    )
                  ],
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.height - 220.0,
                child: GridView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 400.0,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Image(
                                height: 80.0,
                                width: 200.0,
                                fit: BoxFit.cover,
                                image: AssetImage("assets/builder.jpg")),
                          ),
                          // Container(
                          // decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     image: DecorationImage(image:
                          //     // (officeApi.officeList[index] == null)
                          //     AssetImage("assets/builder.jpg")),
                          //     //  NetworkImage("http://"+officeApi.officeList[index].imgUrl)),
                          //     borderRadius: BorderRadius.circular(10.0)),
                          //     // child: Center(child:
                          //     // ),

                          // ),
                          Text(
                            carModel[index].titleAr ?? "",
                            style: TextStyle(
                                color: _color, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            carModel[index].descAr ?? "",
                            style: TextStyle(color: _color),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          InkWell(
                            onTap: () {
                               Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        new SelectedCarCompany(
                                            carModel[index].allParents,carModel[index].titleAr)));
                              // carApi
                              //     .getCarCompanyByID(
                              //         carModel[index].id.toString())
                              //     .then((value) {
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //       builder: (context) =>
                              //           new AdvertisingDetails(
                              //               carModel: value)));
                              // });
                            },
                            child: Container(
                              width: 200,
                              color: _color,
                              child: Center(
                                child: Text(
                                  "المزيد",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: carModel.length,
                  //_allCompanies.length,
                  // primary: false,
                  padding: const EdgeInsets.only(left: 20, right: 20.0),
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5.0,
                    //for height of card
                    childAspectRatio: 0.5,
                    //for horizontal space
                    mainAxisSpacing: 8.0,
                  ),
                ),
              ),
      ],
    );
  }

  Widget buildGridView(List<CarModel> carList) {
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
                    image:
                        // (carList[index].imgUrl != null)?
                        //  NetworkImage("http://"+carList[index].imgUrl)
                        AssetImage("assets/car.jpg")),
                borderRadius: BorderRadius.circular(10.0)),
            child: Center(
              child: Text(
                "تيوتا",
                style: TextStyle(color: carColor, fontWeight: FontWeight.bold),
              ),
            ),
            // child: Stack(
            //   children: <Widget>[
            //     Positioned(
            //         top: 60.0,
            //         left: 15.0,
            //         child: Container(
            //           height: 20.0,
            //           // width: 50.0,
            //           decoration: BoxDecoration(
            //               color: Colors.black,
            //               borderRadius: BorderRadius.circular(5.0)),
            //           child: Center(
            //               child: Text(
            //                   ("1256" == null) ? "\$ " + "0" : "\$ " + "2563",
            //                   style: TextStyle(
            //                       color: Colors.white, fontSize: 15.0))),
            //         )),
            //     Positioned(
            //         top: 85.0,
            //         left: 30.0,
            //         child: Container(
            //           width: 100.0,
            //           height: 25.0,
            //           decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.circular(5.0)),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: <Widget>[
            //               IconButton(
            //                 onPressed: () {},
            //                 icon: Icon(Icons.favorite, color: Colors.red),
            //               ),
            //               IconButton(
            //                 onPressed: () {},
            //                 icon: Icon(Icons.add, color: Colors.grey),
            //               ),
            //             ],
            //           ),
            //         )),
            //     Positioned(
            //         top: 120.0,
            //         left: 30.0,
            //         child: Directionality(
            //             textDirection: TextDirection.rtl,
            //             child: Text("prodName",
            //                 style: TextStyle(fontSize: 14.0)))),
            //     Positioned(
            //         top: 140.0,
            //         left: 15.0,
            //         // width: 200,
            //         right: 15.0,
            //         // bottom: 20.0,
            //         child: Directionality(
            //           textDirection: TextDirection.rtl,
            //           child: Text("detals", style: TextStyle(fontSize: 13.0)),
            //         )),
            //     Positioned(
            //         top: 170.0,
            //         left: 35.0,
            //         width: 30.0,
            //         height: 30.0,
            //         child: InkWell(
            //           onTap: () {},
            //           child: Container(
            //             decoration: BoxDecoration(
            //               color: carColor,
            //               borderRadius: BorderRadius.circular(7.0),
            //             ),
            //             child: Center(
            //                 child: Icon(Icons.arrow_forward,
            //                     size: 20.0, color: Colors.white)),
            //           ),
            //         )),
            //     SizedBox(height: 10.0),
            //   ],
            // )
          );
        },
        itemCount: carList.length,
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
}
