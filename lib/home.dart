import 'package:flutter/material.dart';
import 'package:radio/widgets/radio_player_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Radio FM'),
        ),
          backgroundColor: Colors.grey),
      body: RadioPlayerWidget()
    );
  }
}


