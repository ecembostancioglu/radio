import '../model/radio_station.dart';

class RadioStations{
  static List<RadioStation> allStations=[
    RadioStation(
        name: 'Radio ZET',
        streamUrl: 'https://zt.cdn.eurozet.pl/zet-tun.mp3',
        photoUrl: 'assets/zet.png'),
    RadioStation(
        name: 'Power FM',
        streamUrl: 'http://51.255.235.165:5052/live',
        photoUrl: 'assets/power.jpeg'),
  ];
}

// Radio(
//         name: 'Techno FM',
//         streamUrl: 'http://stream.techno.fm/radio320.mp3',
//         photoUrl: ''),
//     Radio(
//         name: 'Germany FM',
//         streamUrl: 'http://stream.task.gda.pl:8000/rgl',
//         photoUrl: ''),