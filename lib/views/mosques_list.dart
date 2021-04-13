import 'package:flutter/material.dart';
import 'package:prayer_production/views/resarvation_prayer.dart';

class MosquesList extends StatefulWidget {
  final List<dynamic> list_mosques;
  MosquesList({this.list_mosques});
  @override
  _MosquesListState createState() => _MosquesListState();
}

class _MosquesListState extends State<MosquesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.teal,
        title: Text('Mosques List'),
      ),
      body: ListMosques(),
    );
  }

  Widget ListMosques() {
    return Container(
      child: ListView.builder(
          itemCount: widget.list_mosques.length ?? 5,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: Card(
                elevation: 6,
                child: ListTile(
                  leading: Image.asset('assets/images/prayer_mosque.png'),
                  title: Text(widget.list_mosques[i].designation.toString()),
                  subtitle: Row(
                    children: [
                      Text(widget.list_mosques[i].adresse.toString()),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      /// save into favorite List
                    },
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingPrayer(
                          mosque_name: widget.list_mosques[i].designation ?? 'Mosque',
                          id : widget.list_mosques[i].id ?? '10',
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
    );
  }
}