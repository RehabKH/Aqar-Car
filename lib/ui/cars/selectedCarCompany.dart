import 'package:flutter/material.dart';
import 'package:real_estate/apis/carApi.dart';
import 'package:real_estate/models/carModel.dart';
import 'package:real_estate/ui/cars/advertisingDetails.dart';

class SelectedCarCompany extends StatefulWidget {
  final List<CarModel> allParents;
  String selectedCarCompany;

  SelectedCarCompany(this.allParents,this.selectedCarCompany);
  @override
  _SelectedCarCompanyState createState() => _SelectedCarCompanyState();
}

class _SelectedCarCompanyState extends State<SelectedCarCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedCarCompany),
      ),
      body: carPageBody(),
    );
  }

  bool loading = false;
  CarApi carApi = new CarApi();
  TextEditingController searchController = new TextEditingController();
  Widget carPageBody() {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        gridView()
      ],
    );
  }

  Widget gridView() {
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
                height: MediaQuery.of(context).size.height - 110,
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
                            widget.allParents[index].titleAr ?? "",
                            style: TextStyle(
                                color: _color, fontWeight: FontWeight.bold),
                          ),
                          Text(
                             widget.allParents[index].descAr ?? "",
                            style: TextStyle(color: _color),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          InkWell(
                            onTap: () {
                              carApi
                                  .getCarCompanyByID(
                                       widget.allParents[index].id.toString())
                                  .then((value) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        new AdvertisingDetails(
                                            carModel: value)));
                              });
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
                  itemCount:  widget.allParents.length,
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
}
