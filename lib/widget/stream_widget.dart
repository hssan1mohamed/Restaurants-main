import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/menu_screen/menu_screen.dart';

Widget stream(String cat, String _value,String city) {
  // Obtain shared preferences.
  return StreamBuilder(
      stream:_value==''? FirebaseFirestore.instance
          .collection(cat).where('city',isEqualTo: city).snapshots():FirebaseFirestore.instance
          .collection(cat).where('name', isGreaterThanOrEqualTo: _value).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Center(child: Image.asset('images/loading.gif'));
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return  Center(child: Image.asset('images/loading.gif'));
          default:
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                itemBuilder: (context, i) {
                  String name = (snapshot.data! as QuerySnapshot).docs[i]['name'];
                  String img = (snapshot.data! as QuerySnapshot).docs[i]['img'];
                  String id_rest = (snapshot.data! as QuerySnapshot).docs[i].id;
                  String location = (snapshot.data! as QuerySnapshot).docs[i]['location'];
                  String facebook = (snapshot.data! as QuerySnapshot).docs[i]['facebook'];
                  String whatsapp = (snapshot.data! as QuerySnapshot).docs[i]['whatsapp'];
                  String phone = (snapshot.data! as QuerySnapshot).docs[i]['phone'];
                  String address = (snapshot.data! as QuerySnapshot).docs[i]['address'];
                  return resturant_name(name, img,id_rest,location, facebook,whatsapp,phone ,address);
                });
        }
      });
}

Widget resturant_name(String name, String img,String id_rest,String location,String facebook,String whatsapp, String phone,String address) {
  return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 12, left: 12),
        child: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Menu_screen(name,id_rest,location,facebook,whatsapp,phone,address)));
            },
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 130,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl: img,
                              fit: BoxFit.fill,
                              placeholder: (context, url) =>
                                  Center(child: Image.asset('images/loading.gif')),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[900]),
                            ),
                          ],
                        ),
                        Text(
                          address,
                          style: TextStyle(color: Colors.red),
                          maxLines: 1,
                          textScaleFactor: 0.7,
                          softWrap: true,
                        )
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
                  ],
                )),
          ),
        ),
      ));
}
