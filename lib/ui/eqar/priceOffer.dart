import 'package:flutter/material.dart';
import 'package:real_estate/apis/eqar/offerPriceApi.dart';
import 'package:real_estate/color/constColor.dart';
import 'package:real_estate/models/eqar/productModel.dart';
import 'package:real_estate/ui/announceDetails.dart';

class PriceOffer extends StatefulWidget {
  @override
  _PriceOfferState createState() => _PriceOfferState();
}

class _PriceOfferState extends State<PriceOffer> {
  bool _loading = true;
  OfferPriceApi offerPriceApi = new OfferPriceApi();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    offerPriceApi.getOfferPriceData().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("عروض الاسعار",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
      ),
      body: (_loading)
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
              itemCount: offerPriceApi.offerList.length,
              itemBuilder: (context, index) {
                return offerUI(offerPriceApi.offerList[index]);
                // offerPriceApi.offerList[index].imgUrl ??
                //     "assets/builder.jpg",
                // offerPriceApi.offerList[index].title ?? "عمارة للإيجار",
                // offerPriceApi.offerList[index].price.toString() ??
                //     "20000.000 ريال",
                // // offerList[index].desc??"811م ,تجاري , 5محل",
                // offerPriceApi.offerList[index].desc ??
                //     "طريق الامير فيصل بن بندر ,حي النرجس الرياض");
              },
            ),
    );
  }

  Widget offerUI(ProductModel productModel) {
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
                          text: productModel.title, style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: (productModel.price.toString() == "null") ? "\n" : productModel.price.toString() + "\n",
                          style: TextStyle(color: Colors.blue)),
                      // TextSpan(
                      //     text: space + "\n",
                      //     style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text:
                              (productModel.desc.length > 50) ? productModel.desc.substring(0, 50) : productModel.desc,
                          style: TextStyle(color: Colors.grey)),
                    ])),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          new AnnounceDetails(productModel)));
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
