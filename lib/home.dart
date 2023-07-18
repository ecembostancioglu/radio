import 'package:flutter/material.dart';
import 'package:radio/widgets/radio_player_widget.dart';

import 'api/radio_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Center(
              child: Text('Radio FM'),
            ),
            backgroundColor: Colors.grey),
        body: FutureBuilder(
            future: RadioApi.initPlayer(context),
            builder: (context,snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  ),
                );
              }
              return const RadioPlayerWidget();
            }
        )
    );
  }
}



