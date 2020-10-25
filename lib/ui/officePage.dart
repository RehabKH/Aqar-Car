import 'package:flutter/material.dart';
import 'package:real_estate/apis/eqar/officeApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/ui/addOffice.dart';
import 'package:real_estate/ui/commonUI.dart';

class OfficePage extends StatefulWidget {
  @override
  _OfficePageState createState() => _OfficePageState();
}

class _OfficePageState extends State<OfficePage> {
  CommonUI commonUI = new CommonUI();
  TextEditingController searchController = new TextEditingController();
  bool loading = true;
  OfficeApi officeApi = new OfficeApi();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    officeApi.getOfficeData().then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المكاتب والمعارض",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: color,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => new AddOffice()));
            },
            tooltip: "اضافة مكتب/معرض جديد",
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              commonUI.searchRow(searchController, context),
              SizedBox(
                width: 15.0,
              ),
              // commonUI.buildAddOfficeRow(context),
            ],
          ),
          SizedBox(height: 10.0),
          (loading)
              ? Container(
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
                )
              : Container(
                  height: MediaQuery.of(context).size.height - 140.0,
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
                              officeApi.officeList[index].title ?? "",
                              style: TextStyle(
                                  color: carColor, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              officeApi.officeList[index].phone ?? "",
                              style: TextStyle(color: color),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 200,
                                color: color,
                                child: Center(
                                  child: Text(
                                    "تفاصيل",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: officeApi.officeList.length,
                    //_allCompanies.length,
                    // primary: false,
                    padding: const EdgeInsets.only(left: 20, right: 20.0),
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5.0,
                      //for height of card
                      childAspectRatio: 0.6,
                      //for horizontal space
                      mainAxisSpacing: 8.0,
                    ),
                  ),
                  //             child: ListView.separated(
                  //                 separatorBuilder: (context, index) {
                  //                   return Divider();
                  //                 },
                  //                 itemCount: officeApi.officeList.length,
                  //                 itemBuilder: (context, index) {
                  //                    return Container(
                  //           // height: 400.0,

                  //   height: MediaQuery.of(context).size.height /3 -20.0,
                  //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(400.0)),
                  //   child:
                  // );
                  //                 },
                  //               ),
                ),
        ],
      ),
    );
  }
}
