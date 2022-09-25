import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:untitled2/screens/meal_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widget/stream_widget.dart';

class Menu_screen extends StatefulWidget {
  String name;
  String id_rest;
  String location;
  String facebook;
  String whatsapp;
  String phone;
  String address;

  Menu_screen(this.name, this.id_rest, this.location, this.facebook,
      this.whatsapp, this.phone, this.address);

  @override
  State<Menu_screen> createState() => _Menu_screenState();
}

class _Menu_screenState extends State<Menu_screen> {
  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController = TextEditingController();
  String _value = '';

  @override
  Widget build(BuildContext context) {
    final isDialOpen = ValueNotifier(false);
    Size size = MediaQuery.of(context).size;
    // Widget cat() {
    //   return Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Container(
    //       height: size.height * 0.05,
    //       width: size.width * 0.2,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(20),
    //           border: Border.all(color: Colors.red)),
    //       child: Center(
    //           child: Text(
    //         'بيتزا',
    //         style: TextStyle(color: Colors.red, fontSize: 18),
    //       )),
    //     ),
    //   );
    // }

    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: SpeedDial(
            openCloseDial: isDialOpen,
            backgroundColor: Colors.red.shade900,
            overlayOpacity: 0.4,
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                child: IconButton(
                  onPressed: () async {
                    String phone = widget.phone;
                    launch('tel://$phone');
                  },
                  icon: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                ),
                label: 'اتصال',
                backgroundColor: Colors.green,
              ),
              SpeedDialChild(
                  child: IconButton(
                    onPressed: () {
                      launch(widget.location);
                    },
                    icon: Icon(
                      Icons.location_on_rounded,
                      color: Colors.amber,
                    ),
                  ),
                  label: 'الموقع'),
              SpeedDialChild(
                  child: IconButton(
                    onPressed: () {
                      launch(widget.whatsapp);
                    },
                    icon: Icon(
                      Icons.whatsapp,
                      color: Colors.green,
                    ),
                  ),
                  label: 'واتس اب'),
              SpeedDialChild(
                  child: IconButton(
                    onPressed: () {
                      launch(widget.facebook);
                    },
                    icon: Icon(
                      Icons.facebook,
                      color: Colors.blue,
                    ),
                  ),
                  label: ' فيسبوك'),
            ],
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.red.shade900,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(widget.name,
                style: TextStyle(color: Colors.red.shade800, fontSize: 25)),
            centerTitle: true,
            // bottom: PreferredSize(
            //   preferredSize: Size(size.width, size.height * 0.15),
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Column(
            //       children: [
            //         Container(
            //           decoration: BoxDecoration(
            //               color: Colors.red.shade50,
            //               borderRadius: BorderRadius.circular(20)),
            //           child: TextField(
            //             controller: _textEditingController,
            //             focusNode: _textFocusNode,
            //             cursorColor: Colors.black,
            //             decoration: const InputDecoration(
            //                 border: InputBorder.none,
            //                 focusedBorder: InputBorder.none,
            //                 enabledBorder: InputBorder.none,
            //                 errorBorder: InputBorder.none,
            //                 disabledBorder: InputBorder.none,
            //                 prefixIcon: Icon(Icons.search),
            //                 hintText: 'ابحث هنا ... ',
            //
            //                 contentPadding: EdgeInsets.all(8)),
            //             onChanged: (v){
            //               setState(() {
            //                 _value=v;
            //               });
            //             },
            //           ),
            //         ),
            //         SizedBox(
            //           height: size.height * 0.02,
            //         ),
            //         SingleChildScrollView(
            //           scrollDirection: Axis.horizontal,
            //           child: Row(
            //             children: [
            //               cat(),
            //               cat(),
            //               cat(),
            //               cat(),
            //               cat(),
            //               cat(),
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ),
          body: streamItem('menu', _value)),
    );
  }

  Widget streamItem(String cat, String _value) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(cat)
            .where('shop', isEqualTo: widget.id_rest)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(child: Image.asset('images/loading.gif'));
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: Image.asset('images/loading.gif'));
            default:
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                  itemBuilder: (context, i) {
                    String name =
                        (snapshot.data! as QuerySnapshot).docs[i]['name'];
                    String img =
                        (snapshot.data! as QuerySnapshot).docs[i]['img'];
                    String details =
                        (snapshot.data! as QuerySnapshot).docs[i]['details'];
                    String price =
                        (snapshot.data! as QuerySnapshot).docs[i]['price'];
                    return items(context, name, img, price, details);
                  });
          }
        });
  }

  Widget items(BuildContext context, String name, String img, String price,
      String details) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(top: 10, right: 12, left: 12),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => meal_screen(
                name,
                widget.name,
                price,
                widget.location,
                widget.facebook,
                widget.whatsapp,
                widget.phone,
                img,
                details))),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
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
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red[900]),
                    ),
                    Text(
                      price + ' ج ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red[900]),
                    ),
                  ],
                ),
                Spacer(),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                      child: Icon(
                    Icons.arrow_forward_ios,
                    //size: 25,
                  )),
                )
              ],
            )),
      ),
    ));
  }
}
