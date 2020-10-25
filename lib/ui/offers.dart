import 'package:flutter/material.dart';
import 'package:real_estate/apis/eqarTermsApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/models/eqar/productModel.dart';
import 'package:real_estate/models/offerModel.dart';
import 'package:real_estate/ui/announceDetails.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  // List<OfferModel> offerList = new List<OfferModel>();
  EqarApi eqarApi = new EqarApi();
  bool loading = true;
  @override
  void initState() {
    super.initState();
    eqarApi.getOffersData().then((value) {
      setState(() {
       
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("عروض مميزة",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
      ),
      body: (loading)
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
          : ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: eqarApi.offerList.length,
              itemBuilder: (context, index) {
                return offerUI(eqarApi.offerList[index]);
                // offerList[index].imgUrl ?? "assets/builder.jpg",
                // offerList[index].title ?? "عمارة للإيجار",
                // offerList[index].price.toString() ?? "20000.000 ريال",
                // // offerList[index].desc??"811م ,تجاري , 5محل",
                // offerList[index].desc ??
                //     "طريق الامير فيصل بن بندر ,حي النرجس الرياض");
              },
            ),
    );
  }

  Widget offerUI(ProductModel item) {
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
          width: 10.0,
        ),
        SizedBox(
          width: 200.0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(children: [
                      TextSpan(
                          text: item.title, style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: (item.price.toString() == "null") ? "\n" : item.price.toString() + "\n",
                          style: TextStyle(color: Colors.blue)),
                      // TextSpan(
                      //     text: space + "\n",
                      //     style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text:
                              (item.desc.length > 50) ? item.desc.substring(0, 50) : item.desc,
                          style: TextStyle(color: Colors.grey)),
                    ])),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => new AnnounceDetails(item)));
                },
                child: Center(
                  child: Text("...المزيد"),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
