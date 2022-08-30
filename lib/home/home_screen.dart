import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:untitled2/home/widget/Carousel.dart';
import 'package:untitled2/home/widget/resturants.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: Color(0xfff2f2f2),
        elevation: 0,
        title: Text('FOOOOOOOD',
            style: TextStyle(color: Colors.red, fontSize: 25)),
        centerTitle: true,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: GestureDetector(
        //       onTap: () {
        //         ZoomDrawer.of(context)!.open();
        //       },
        //       child: SizedBox(
        //         height: 30,
        //         width: 30,
        //         child: Image.asset(
        //           'images/menus.png',
        //         ),
        //       ),
        //     ),
        //   )
        //   ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ZoomDrawer.of(context)!.open();
        },
        child: Icon(Icons.arrow_forward_ios_outlined),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Carousel(),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'اختار المحافظة',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.red[900]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'القاهرة',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_circle_down,
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'المطاعم',
                  style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'عرض الكل ',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.blue,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                resturants(),
                resturants(),
                resturants(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'الحلويات',
                  style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'عرض الكل ',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.blue,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                resturants(),
                resturants(),
                resturants(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
