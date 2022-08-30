import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../home/home_screen.dart';

class Drawer_Screen extends StatefulWidget {
  const Drawer_Screen({Key? key}) : super(key: key);

  @override
  State<Drawer_Screen> createState() => _Drawer_ScreenState();
}

class _Drawer_ScreenState extends State<Drawer_Screen> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        isRtl: true,
        angle: 0.0,
        showShadow: true,
        menuBackgroundColor: Color(0xffa5aeb4),
        menuScreen: SafeArea(
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                child: Image.asset('images/food.png'),
              ),
              Text('FOOOOOOOD',
                  style: TextStyle(color: Colors.red, fontSize: 25)),
              SizedBox(height: 25),
              Divider(
                color: Colors.white,
              ),
              list('الصفحة الرئسية'),
              Divider(
                color: Colors.white,
              ),
              list('المطاعم'),
              Divider(
                color: Colors.white,
              ),
              list('محلات الحلويات '),
              Divider(
                color: Colors.white,
              ),
              list('المفضلة'),
              Divider(
                color: Colors.white,
              ),
              list('نبذه عن البرنامج'),
              Divider(
                color: Colors.white,
              ),
              // IconButton(
              //   padding: EdgeInsets.all(15),
              //   onPressed: () {
              //     //    ZoomDrawer.of(context)!.close();
              //   },
              //   icon: Icon(Icons.arrow_circle_left_outlined,
              //       color: Colors.white, size: 50),
              // )
            ],
          )),
        ),
        mainScreen: Home_screen());
  }

  Widget list(
    String txt,
  ) {
    return ListTile(
        leading: Text(
      txt,
      style: TextStyle(fontSize: 22, color: Colors.white),
    ));
  }
}
