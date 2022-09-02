import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class meal_screen extends StatefulWidget {
  const meal_screen({Key? key}) : super(key: key);

  @override
  State<meal_screen> createState() => _meal_screenState();
}

class _meal_screenState extends State<meal_screen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.arrow_forward_ios_outlined),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://assets-global.website-files.com/5d03b4e13011831ae4624b37/61ff6b8686c6708c070e7d41_production-meal-image-e4122aa8-0fe7-4854-b6f5-e27e0c5be918.jpeg'),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),

            // Positioned(child: Icon(Icons.add),bottom:0,),
            Positioned(
              child: Container(
                height: size.height * 0.54,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                    color: Colors.red.shade700),
              ),
              bottom: 0,
            ),
            Positioned(
              child: Container(
                height: size.height * 0.513,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                    color: Colors.white),
                child: ListView(
                  padding: EdgeInsets.only(right: 30, top: 20, left: 30),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'وجبة الكينج ',
                          style: TextStyle(
                              color: Colors.red.shade800,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Divider(
                      color: Colors.red.shade800,
                      height: 3,
                    ),
                    Text(
                      'تفاصيل ',
                      style: TextStyle(
                          color: Colors.red.shade800,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      'الوجبه تحتولى على الكثير من البطاطس و البرجر و الكثير من الكتشب ...',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              bottom: 0,
            ),
            Positioned(
              child: Container(
                  height: 90,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.red.shade700),
                  child: Center(
                      child: Text('150 ' + 'ج',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          )))),
              bottom: size.height * 0.41,
              left: size.width * 0.15,
            )
          ],
        ),
      ),
    );
  }
}
