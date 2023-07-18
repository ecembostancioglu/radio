import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio/providers/radio_provider.dart';
import 'package:radio_player/radio_player.dart';

class RadioApi{
  static late RadioPlayer player;

  Future<void> initPlayer(BuildContext context) async{
    final provider = Provider.of<RadioProvider>(context,listen: false);
    player = RadioPlayer();
    await player.stop();
    await player.setChannel(
      title: provider.station.name,url: provider.station.streamUrl
    );

    await player.play();
  }
}