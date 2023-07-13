import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.pause)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.volume_up)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: ScreenUtil().scaleHeight*0.4,
              width: ScreenUtil().screenWidth,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40)
                )
            ),
            child: Column(
              children: [
                 Padding(
                     padding: EdgeInsets.all(8.h),
                     child:Text('Radio List',
                       style: TextStyle(
                           fontSize: 24,
                       fontWeight: FontWeight.bold),
                     )
                 ),
                Divider(
                  color: Colors.black,
                  indent: 30,
                  endIndent: 30,
                )
              ],
            ),
            ),
          )
        ],
      )
    );
  }
}
