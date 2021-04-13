import 'package:flutter/material.dart';
import 'package:prayer_production/controller/api_provider.dart';
import 'package:prayer_production/widgets/search_mosque.dart';

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  Future getList() async {
    var list_val = await PrayerProvider().getPrayerTime();
    print('the List of values is : $list_val');
    return list_val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Accueil',
          style: TextStyle(color: Colors.teal),
        ),
      ),
     // backgroundColor: Colors.white.withOpacity(.9),
      body: CardPrayerWidget(context),
    );
  }

  Widget CardPrayerWidget(context) {
    double hight = MediaQuery.of(context).size.height;
    double wight = MediaQuery.of(context).size.width;
    return ListView(
      shrinkWrap: true,
      children: [
        FutureBuilder(
            future: getList(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  elevation: 8,
                  child: Container(
                    child: Column(
                      children: [
                        Center(
                          child: ListTile(
                            leading: Icon(
                              Icons.date_range,
                              size: 48,
                            ),
                            title: Text(
                              'Aujourdhui',
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  'Date : ' + snapshot.data[10].toString() ??
                                      'null',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.refresh,
                                size: 32,
                              ),
                              onPressed: () {
                                setState(() {
                                  getList();
                                });
                              },
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Fajr',
                            style: TextStyle(fontSize: 22),
                          ),
                          trailing: Text(
                            snapshot.data[2].toString(),
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Divider(
                          color: Colors.teal,
                        ),
                        ListTile(
                          title: Text(
                            'Dohr',
                            style: TextStyle(fontSize: 22),
                          ),
                          trailing: Text(
                            snapshot.data[5].toString(),
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Divider(
                          color: Colors.teal,
                        ),
                        ListTile(
                          title: Text(
                            'Asr',
                            style: TextStyle(fontSize: 22),
                          ),
                          trailing: Text(
                            snapshot.data[6].toString(),
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Divider(
                          color: Colors.teal,
                        ),
                        ListTile(
                          title: Text(
                            'Maghrib',
                            style: TextStyle(fontSize: 22),
                          ),
                          trailing: Text(
                            snapshot.data[7].toString(),
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Divider(
                          color: Colors.teal,
                        ),
                        ListTile(
                          title: Text(
                            'Isha',
                            style: TextStyle(fontSize: 22),
                          ),
                          trailing: Text(
                            snapshot.data[8].toString(),
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
        ListPrayerWidget(context),
      ],
    );
  }

  Widget ListPrayerWidget(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double wight = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          BookPrayer(
            wight: wight,
            hight: hight,
            prayer_title: 'Fajr',
            imageasset: 'assets/images/fajr_icon.png',
          ),
          BookPrayer(
            wight: wight,
            hight: hight,
            prayer_title: 'Dohr',
            imageasset: 'assets/images/dohr_icon.png',
          ),
          BookPrayer(
            wight: wight,
            hight: hight,
            prayer_title: 'Asr',
            imageasset: 'assets/images/asr_icon.png',
          ),
          BookPrayer(
            wight: wight,
            hight: hight,
            prayer_title: 'Maghrib',
            imageasset: 'assets/images/maghrib_icon.png',
          ),
          BookPrayer(
            wight: wight,
            hight: hight,
            prayer_title: 'Ishaa',
            imageasset: 'assets/images/ichaa_icon.png',
          ),
        ],
      ),
    );
  }
}

class BookPrayer extends StatelessWidget {
  const BookPrayer({
    Key key,
    @required this.wight,
    @required this.hight,
    @required this.imageasset,
    @required this.prayer_title,
  }) : super(key: key);

  final double wight;
  final double hight;
  final String imageasset;
  final String prayer_title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: wight * .19,
      height: hight * .18,
      child: Card(
        //color: Colors.white,
        child: Column(
          children: [
            Container(
              height: hight * .09,
              width: wight * .18,
              child: Image.asset(
                  imageasset), //Image.asset('assets/images/fajr_icon.png'),

              ///  variable
            ),
            SizedBox(
              height: 16,
            ),
            Text(prayer_title),
            SizedBox(
              height: 15,
            ),
            Container(
              width: wight * .17,
              height: hight * .009,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
