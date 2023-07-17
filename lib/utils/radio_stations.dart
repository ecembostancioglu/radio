import '../model/radio.dart';

class RadioStations{
  static List<Radio> allStations=[
    Radio(
        name: 'Radio ZET',
        streamUrl: 'https://zt.cdn.eurozet.pl/zet-tun.mp3',
        photoUrl: ''),
    Radio(
        name: 'Power FM',
        streamUrl: 'http://51.255.235.165:5052/live',
        photoUrl: ''),
    Radio(
        name: 'Techno FM',
        streamUrl: 'http://stream.techno.fm/radio320.mp3',
        photoUrl: ''),
    Radio(
        name: 'Germany FM',
        streamUrl: 'http://stream.task.gda.pl:8000/rgl',
        photoUrl: ''),

  ];
}