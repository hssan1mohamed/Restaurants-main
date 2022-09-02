import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:untitled2/home/widget/Carousel.dart';
import 'package:untitled2/home/widget/drawer_Screen.dart';
import 'package:untitled2/home/widget/resturants.dart';
import 'package:untitled2/screens/cafe/cafe.dart';
import 'package:untitled2/screens/resturants/resturants_screen.dart';
import 'package:untitled2/screens/sweets/sweets_screen.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        leading: Builder(
          builder: (context)=> IconButton(
            onPressed: (){
             Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu,color: Colors.black,),
          ),
        ),
        backgroundColor: Color(0xfff2f2f2),
        elevation: 0,
        title: Text('Engez',
            style: TextStyle(color: Colors.red, fontSize: 25)),
        centerTitle: true,

      ),
      drawer: Drawer_Screen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Carousel(),
          SizedBox(
            height: 15,
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=> ResturantsScreen()));
                  },
                  child: Row(
                    children: const [
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
            physics: const BouncingScrollPhysics(),
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=> SweetsScreen()));
                  },
                  child: Row(
                    children: const [
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
            physics: const BouncingScrollPhysics(),
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
                  'الكافيهات',
                  style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=> CafeScreen()));
                  },
                  child: Row(
                    children: const [
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
            physics: const BouncingScrollPhysics(),
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
