import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_production/controller/api_provider.dart';
import 'package:prayer_production/models/servicesbymosque_model.dart';

class BookingPrayer extends StatefulWidget {
  final String mosque_name;
  final String id;
  BookingPrayer({this.mosque_name, this.id});
  @override
  _BookingPrayerState createState() => _BookingPrayerState();
}

class _BookingPrayerState extends State<BookingPrayer> {
  bool _can_booking = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white.withOpacity(.9),
      appBar: AppBar(
        //backgroundColor: Colors.teal,
        title: Text('Resarvation'),
        actions: [
//          IconButton(
//              icon: Icon(Icons.get_app),
//              onPressed: () async {
//              /// Test Api telecharge Info Mosques
//              await PrayerProvider().PostToGetServices(
//               id_mosque: widget.id,
//              );
//          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          //height: MediaQuery.of(context).size.height * .2,
          //width: MediaQuery.of(context).size.width * 1,
          child: Column(
            //shrinkWrap: true,
            children: [
              SizedBox(
                height: 12,
              ),
              Text(widget.mosque_name.toString(), style: TextStyle(fontSize: 16),),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child:
                FutureBuilder<List<Data>>(
                  future: PrayerProvider().PostToGetServices(id_mosque: widget.id),
                  builder: (context, snapshot){
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,/// u should change by list get it from method
                        itemBuilder: (context,i){
                          //double opacity = 1/i;
                          return Container(
                            //color: Colors.teal,
                            height: MediaQuery.of(context).size.height * .08,
                            width: MediaQuery.of(context).size.width * .15,
                            child: Image.network('https://allocomcompany.com/prayer_organizer/images/services/${snapshot.data[i].logo}'),
                          );
                        });
                  },
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                //color: Colors.lightGreenAccent,
                height: MediaQuery.of(context).size.height * .6,
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  children: [
                    Card(
                      color: Colors.red.withOpacity(.7),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text('Groupe1'),
                          trailing: Text('0'),
                          leading: IconButton(
                            icon: !_can_booking ? Icon(Icons.beenhere) : Container(),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.greenAccent.withOpacity(.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text('Groupe1'),
                          trailing: Text('0'),
                          leading: IconButton(
                            icon: !_can_booking ? Icon(Icons.beenhere) : Container(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
