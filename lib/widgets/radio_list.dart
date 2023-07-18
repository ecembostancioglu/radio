import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio/api/shared_pref.dart';
import 'package:radio/model/radio_station.dart';
import 'package:radio/providers/radio_provider.dart';
import 'package:radio/utils/radio_stations.dart';

class RadioList extends StatefulWidget {
  const RadioList({Key? key}) : super(key: key);

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  late RadioStation selectedStation;
  late RadioProvider provider;

  @override
  void initState() {
    provider = Provider.of(context,listen: false);
    selectedStation = provider.station;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RadioProvider>(context,listen: false);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: RadioStations.allStations.length,
        itemBuilder: (context,index){
        final station=RadioStations.allStations[index];
        bool isSelected = station.name == provider.station.name;
        return Container(
          decoration: BoxDecoration(
            gradient: isSelected ? LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.grey.shade700,
                ],
            ) : null,
          ),
          child: ListTile(
            leading: Image.asset(
              station.photoUrl,
              width: 60,
              height: 40,
              fit: BoxFit.fill,
            ),
            horizontalTitleGap: 10,
            title: Text(station.name),
            onTap: (){
              provider.setRadioStation(station);
              SharedPref.setStation(station);
              setState(() {
                selectedStation=station;
              });
            },
          ),
        );
        });
  }
}
