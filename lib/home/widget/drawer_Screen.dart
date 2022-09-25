import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:untitled2/screens/cafe/cafe.dart';
import 'package:untitled2/screens/on_boarding/on_boarding_screen.dart';
import 'package:untitled2/screens/resturants/resturants_screen.dart';
import 'package:untitled2/screens/sweets/sweets_screen.dart';

import '../../../home/home_screen.dart';
import '../../screens/select_Governorates/selectGovernorates.dart';

class Drawer_Screen extends StatefulWidget {
  String city;
  Drawer_Screen(this.city,{Key? key}) : super(key: key);

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
                   Text('Engez',
                      style: TextStyle(color: Colors.red.shade900, fontSize: 25,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 25),

                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ResturantsScreen(widget.city)));
                      },
                      child: list('المطاعم')),
                  const Padding(
                    padding: EdgeInsets.only(
                        right: 10,
                        left: 10
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>
                        SweetsScreen(widget.city)));
                      },
                      child: list('محلات الحلويات ')),
                  const Padding(
                    padding: EdgeInsets.only(
                        right: 10,
                        left: 10
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        CafeScreen(widget.city)));
                      },
                      child: list('الكافيهات')),
                  const Padding(
                    padding: EdgeInsets.only(
                        right: 10,
                        left: 10
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                        SelectGovernorateScreen(widget.city)));
                      },
                      child: list('الاعدادات')),

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
      style:  TextStyle(fontSize: 22, color: Colors.red.shade900,
      fontWeight: FontWeight.bold
      ),
    ));
  }
}
