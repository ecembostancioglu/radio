import 'package:flutter/material.dart';
import 'package:radio/utils/radio_stations.dart';

class RadioList extends StatelessWidget {
  const RadioList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: RadioStations.allStations.length,
        itemBuilder: (context,index){
        final station=RadioStations.allStations[index];
        return ListTile(
          leading: Image.asset(
            station.photoUrl,
            width: 60,
            height: 40,
            fit: BoxFit.fill,
          ),
          horizontalTitleGap: 10,
          title: Text(station.name),
        );
        });
  }
}
