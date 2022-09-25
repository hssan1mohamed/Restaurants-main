import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:untitled2/home/widget/Carousel.dart';
import 'package:untitled2/home/widget/drawer_Screen.dart';
import 'package:untitled2/home/widget/resturants.dart';
import 'package:untitled2/screens/cafe/cafe.dart';
import 'package:untitled2/screens/menu_screen/menu_screen.dart';
import 'package:untitled2/screens/sweets/sweets_screen.dart';

import '../screens/resturants/resturants_screen.dart';

class Home_screen extends StatefulWidget {
  String city;
   Home_screen(this.city,{Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  bool isConnected=false;
  StreamSubscription ?sub ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sub= Connectivity().onConnectivityChanged.listen((event) {
      setState((){
        isConnected=(event!= ConnectivityResult.none);
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    sub?.cancel();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Color(0xfff2f2f2),
        elevation: 0,
        title: Text('Engez',
            style: TextStyle(color: Colors.red.shade900, fontSize: 25)),
        centerTitle: true,
      ),
      drawer: Drawer_Screen(widget.city),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              width: double.infinity,
              height: !isConnected ? 200: 0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('images/mm.jpg'),
                  fit: BoxFit.fill
                )
              ),
            ),
          ),
          Carousel1(),
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
                        builder: (context) => ResturantsScreen(widget.city)));
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
          getData('Restaurants'),
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
                        builder: (context) => SweetsScreen(widget.city)));
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
          getData('Sweets'),
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CafeScreen(widget.city)));
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
          getData('cafes'),
        ],
      ),
    );
  }

  Widget getData(String type) {
    return Container(
      height: 190,
      width: double.infinity,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(type).where('city',isEqualTo: widget.city).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData)
              return Center(child: Image.asset('images/loading.gif'));
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: Image.asset('images/loading.gif'));
              default:
                return ListView.builder(
                    // padding: EdgeInsets.only(left: 15, right: 15),
                    itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) {
                      String name =
                          (snapshot.data! as QuerySnapshot).docs[i]['name'];
                      String img =
                          (snapshot.data! as QuerySnapshot).docs[i]['img'];
                      String id_rest =
                          (snapshot.data! as QuerySnapshot).docs[i].id;
                      String location =
                          (snapshot.data! as QuerySnapshot).docs[i]['location'];
                      String facebook =
                          (snapshot.data! as QuerySnapshot).docs[i]['facebook'];
                      String whatsapp =
                          (snapshot.data! as QuerySnapshot).docs[i]['whatsapp'];
                      String phone =
                          (snapshot.data! as QuerySnapshot).docs[i]['phone'];
                      String address =
                          (snapshot.data! as QuerySnapshot).docs[i]['address'];
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Menu_screen(
                                    name,
                                    id_rest,
                                    location,
                                    facebook,
                                    whatsapp,
                                    phone,
                                    address)));
                          },
                          child: resturants(name, img));
                    });
            }
          }),
    );
  }
}
