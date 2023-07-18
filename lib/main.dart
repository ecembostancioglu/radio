import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:radio/api/shared_pref.dart';
import 'package:radio/model/radio_station.dart';
import 'package:radio/providers/radio_provider.dart';

import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final radioStation = await SharedPref.getInitialRadioStation();
  runApp(MyApp(
     initialStation:radioStation,
  ));
}

class MyApp extends StatelessWidget {
  final RadioStation initialStation;
  const MyApp({required this.initialStation, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child){
         return MultiProvider(
           providers: [
             ChangeNotifierProvider(
             create: (context)=> RadioProvider(initialStation)
        ),
           ],
           child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
        ),
         );
      },
    );
  }
}
