import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.h),
            child: SizedBox(
              height: ScreenUtil().screenHeight*0.25,
              width: ScreenUtil().screenWidth,
              child: Align(
                alignment: Alignment.topCenter,
                  child: Image.asset('assets/img.png')),
            ),
          ),
        ],
      )
    );
  }
}
