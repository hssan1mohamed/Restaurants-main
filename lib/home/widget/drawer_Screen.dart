import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:untitled2/screens/on_boarding/on_boarding_screen.dart';

import '../../../home/home_screen.dart';

class Drawer_Screen extends StatefulWidget {
  const Drawer_Screen({Key? key}) : super(key: key);

  @override
  State<Drawer_Screen> createState() => _Drawer_ScreenState();
}

class _Drawer_ScreenState extends State<Drawer_Screen> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: SafeArea(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/food.png'),
                        )
                      ),
                    ),
                  ),
              Expanded(
                  flex: 2,
                  child: Column(
                children: [
                  const Text('Engez',
                      style: TextStyle(color: Colors.red, fontSize: 25)),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.only(
                        right: 10,
                        left: 10
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  list('الصفحة الرئسية'),
                  const Padding(
                    padding: EdgeInsets.only(
                        right: 10,
                        left: 10
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  list('المطاعم'),
                  const Padding(
                    padding: EdgeInsets.only(
                        right: 10,
                        left: 10
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  list('محلات الحلويات '),
                  const Padding(
                    padding: EdgeInsets.only(
                        right: 10,
                        left: 10
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  list('الكافيهات'),
                  const Padding(
                    padding: EdgeInsets.only(
                        right: 10,
                        left: 10
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  list('الاعدادات'),
                  const Padding(
                    padding: EdgeInsets.only(
                        right: 10,
                        left: 10
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ],
              )),

              // IconButton(
              //   padding: EdgeInsets.all(15),
              //   onPressed: () {
              //     //    ZoomDrawer.of(context)!.close();
              //   },
              //   icon: Icon(Icons.arrow_circle_left_outlined,
              //       color: Colors.white, size: 50),
              // )
                ],
              ),
            ),
          ),
    );

  }

  Widget list(
    String txt,
  ) {
    return ListTile(
        leading: Text(
      txt,
      style: const TextStyle(fontSize: 22, color: Colors.red),
    ));
  }
}
