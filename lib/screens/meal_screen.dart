import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

class meal_screen extends StatefulWidget {
  String name;
  String meal_name;
  String location;
  String facebook;
  String whatsapp;
  String phone;
  String img;
  String price;
  String details;

  meal_screen(this.meal_name, this.name, this.price, this.location,
      this.facebook, this.whatsapp, this.phone, this.img, this.details);

  @override
  State<meal_screen> createState() => _meal_screenState();
}

class _meal_screenState extends State<meal_screen> {
  @override
  Widget build(BuildContext context) {
    final isDialOpen = ValueNotifier(false);

    Size size = MediaQuery.of(context).size;
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
          title: Text(
            widget.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red.shade900,
                fontSize: 22),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.red[900],
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.45,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              CachedNetworkImage(
                                imageUrl: widget.img,
                                fit: BoxFit.fill,
                                placeholder: (context, url) => Center(
                                    child: Image.asset('images/loading.gif')),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Positioned(child: Icon(Icons.add),bottom:0,),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: size.height * 0.60,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        color: Colors.red[900]),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: size.height * 0.57,
                    width: size.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        color: Colors.white),
                    child: ListView(
                      padding:
                          const EdgeInsets.only(right: 30, top: 20, left: 30),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.meal_name,
                              style: TextStyle(
                                  color: Colors.red.shade800,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Divider(
                          color: Colors.red.shade900,
                          height: 3,
                        ),
                        Text(
                          'تفاصيل ',
                          style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          widget.details,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.48,
                  left: size.width * 0.15,
                  child: Container(
                      height: 90,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.red[900]),
                      child: Center(
                          child: Text(widget.price + 'ج',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              )))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
