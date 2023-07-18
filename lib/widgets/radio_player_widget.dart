import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:radio/providers/radio_provider.dart';
import 'package:radio/widgets/radio_list.dart';

class RadioPlayerWidget extends StatefulWidget {
  const RadioPlayerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RadioPlayerWidget> createState() => _RadioPlayerWidgetState();
}

class _RadioPlayerWidgetState extends State<RadioPlayerWidget>
    with SingleTickerProviderStateMixin{

  bool listEnabled = false;
  late AnimationController animationController;

  late Animation<Offset> radioOffset;
  late Animation<Offset> radioListOffset;

  @override
  void initState() {
   animationController = AnimationController(
     vsync: this,
   duration: const Duration(
     milliseconds: 500
   ));
    super.initState();
   radioListOffset= Tween(
       begin: const Offset(0,1),
       end: Offset.zero)
        .animate(CurvedAnimation(
       parent: animationController,
        curve: Curves.easeOut));

   radioOffset= Tween(
       begin: const Offset(0,0.3),
       end: Offset.zero)
       .animate(CurvedAnimation(
       parent: animationController,
       curve: Curves.easeOut));

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SlideTransition(
            position:radioOffset,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(6.h),
                  child: SizedBox(
                    height: ScreenUtil().screenHeight*0.24,
                    width: ScreenUtil().screenWidth,
                    child: Consumer<RadioProvider>(
                      builder: ((context,value,child){
                        return Image.asset(value.station.photoUrl,
                          fit:BoxFit.cover);
                      }),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset('assets/img.png')),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: (){
                          setState(() {
                            listEnabled=!listEnabled;
                          });
                          switch(animationController.status){
                            case AnimationStatus.dismissed:
                              animationController.forward();
                              break;
                            case AnimationStatus.completed:
                              animationController.reverse();
                              break;
                            default:
                          }
                        },
                        color: listEnabled ? Colors.amber : Colors.black,
                        icon: Icon(Icons.list,size: 30)),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.pause)),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.volume_up)),
                  ],
                ),
              ],
            ),
          ),
        ),
        SlideTransition(
          position: radioListOffset,
          child: Container(
            height: 420,
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
                ),
                RadioList()
              ],
            ),
          ),
        )
      ],
    );
  }
}