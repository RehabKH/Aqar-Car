import 'package:flutter/material.dart';
import 'package:real_estate/apis/carApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/models/carModel.dart';
import 'package:real_estate/models/carTypeModel.dart';
import 'package:real_estate/ui/announceDetails.dart';
import 'package:real_estate/ui/cars/addCar.dart';
import 'package:real_estate/ui/cars/advertisingDetails.dart';
import 'package:real_estate/ui/cars/commonUI.dart';
// import 'package:real_estate/ui/commonUI.dart';

class Cars extends StatefulWidget {
  @override
  _CarsState createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  CarTypeModel selectedType;
  List<CarTypeModel> carsTypeModel = [
    new CarTypeModel("تيوتا", false),
    new CarTypeModel("مرسيدس", false),
    new CarTypeModel("كيا", false),
    new CarTypeModel("BMW", true),
    new CarTypeModel("تيوتا", false),
  ];
  CarApi carApi = new CarApi();
  CommonCARUI commonCARUI = new CommonCARUI();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carApi.getAllCars().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "سيارات",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => new AddCar()));
                  })
          ],
          backgroundColor: carColor2,
        ),
        body: (_loading)
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: CircularProgressIndicator(
                  backgroundColor: color,
                )),
              )
            :
            //  Column(
            //   children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       buildPlaceContainer("منطقة الرياض", false),
            //       buildPlaceContainer("منطقة الرياض", true),
            //       buildPlaceContainer("منطقة الرياض", false),
            //       buildPlaceContainer("منطقة الرياض", false),
            //     ],
            //   ),
            // ),
            Container(
                height: MediaQuery.of(context).size.height ,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: carApi.carList.length,
                  itemBuilder: (context, index) {
                    return offerUI(carApi.carList[index]);
                    // "assets/builder.jpg",
                    // productApi.productList[index].title??"عمارة للإيجار",
                    // productApi.productList[index].price.toString()??"20000.000 ريال",
                    // "811م ,تجاري , 5محل",
                    // productApi.productList[index].desc??"طريق الامير فيصل بن بندر ,حي النرجس الرياض");
                  },
                ),
              ));

    //   ],
    // );
  }

  Widget offerUI(CarModel carModel) {
    // String img, String name, String price, String space, String desc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 100.0,
          width: 150.0,
          child: Image(
            image: AssetImage("assets/builder.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        SizedBox(
          width: 150.0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(children: [
                      TextSpan(
                          text: carModel.titleAr + "\n",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: carModel.price.toString() + "\n",
                          style: TextStyle(color: Colors.blue)),
                      TextSpan(
                          text: (carModel.descAr != null )
                              ? carModel.descAr.substring(0, 5)
                              : "" + "\n",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: carModel.descAr,
                          style: TextStyle(color: Colors.grey)),
                    ])),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          new AdvertisingDetails(carModel: carModel)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    color: carColor2,
                    child: Center(
                      child: Text(
                        "المزيد",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget carsBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 30.0,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: ListView.builder(
                  itemCount: carsTypeModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return carTypeRow(carsTypeModel[index].title,
                        carsTypeModel[index].isSelected, carsTypeModel[index]);
                  }),
            ),
          ),
        ),
        listViewBody()
      ],
    );
  }

  Widget carTypeRow(String carType, bool isSelected, CarTypeModel currentType) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedType = currentType;
            });
          },
          child: Container(
            height: 30.0,
            width: 80.0,
            decoration: BoxDecoration(
                color:
                    (selectedType == currentType) ? Colors.pink : Colors.white,
                border: Border.all(color: Colors.grey[300])),
            child: Center(
              child: Text(
                carType,
                style: TextStyle(
                    color: (selectedType == currentType)
                        ? Colors.white
                        : Colors.pink),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5.0,
        )
      ],
    );
  }

  Widget listViewBody() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: MediaQuery.of(context).size.height - 210.0,
        child: ListView.builder(itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => new AdvertisingDetails()));
            },
            child: Card(
              elevation: 0.5,
              child: ListTile(
                // enabled: true,
                // dense: true,
                title: Text(
                  "title",
                  style: TextStyle(color: Colors.pink),
                ),
                subtitle: SizedBox(
                  width: 250.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "قبل 5 دقايق",
                        style: TextStyle(color: Colors.pink),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          commonCARUI.buildIconColumn(
                              "اتصال", Icons.phone, Colors.green),
                          // SizedBox(
                          //   height: 30.0,
                          //   width: 50.0,
                          //   child: commonCARUI.buildIconColumn(
                          //       "اتصال", Icons.phone, Colors.green),
                          // ),
                          commonCARUI.buildIconColumn(
                              "مراسلة", Icons.email, Colors.blue),
                          commonCARUI.buildIconColumn(
                              "أضف للمفضلة", Icons.star_border, Colors.orange),
                        ],
                      )
                    ],
                  ),
                ),
                isThreeLine: true,
                // contentPadding: EdgeInsets.all(10.0),

                trailing: Image(
                  height: 350.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/car.jpg"),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
