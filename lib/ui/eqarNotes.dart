import 'package:flutter/material.dart';
import 'package:real_estate/color/constColor.dart';

class EqarNotes extends StatefulWidget {
  @override
  _EqarNotesState createState() => _EqarNotesState();
}

class _EqarNotesState extends State<EqarNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("مدونة عقار",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
      ),
      body: Column(
        children: [
          SizedBox(height: 10.0,),
          Container(
            height: 20.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                      width: 50.0,
                      child: Text(
                        "الديكور",
                        style: TextStyle(color: Colors.grey),
                      ));
                }),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 120.0,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _buildItem(
                      "assets/builder.jpg",
                      "تعرف ع حي الياسمين بمدينة الرياض",
                      DateTime.daysPerWeek.toString(),
                      " The Wikimedia Foundation is the nonprofit that hosts Wikipedia and our other free knowledge projects. We want to make it easier for everyone to share what they know. To do this, we keep Wikipedia and Wikimedia sites fast, reliable, and available to all. We protect the values and policies that allow free knowledge to thrive. We build new features and tools to make it easy to read, edit, and share from the Wikimedia sites. Above all, we support the communities of volunteers around the world who edit, improve, and add knowledge across Wikimedia projects");
                }),
          )
        ],
      ),
    );
  }

  Widget _buildItem(String imgUrl, String title, String date, String desc) {
    return Card(
      elevation: 0.6,
      child: Column(
        children: [
          Image(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            image: AssetImage(imgUrl),
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(date)
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(desc),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> new ))
              },
              child: Text("المزيد<<",style: TextStyle(color: Colors.grey),)),
          )
        ],
      ),
    );
  }
}
