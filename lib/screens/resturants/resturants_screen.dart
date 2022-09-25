import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/screens/menu_screen/menu_screen.dart';

import '../../widget/stream_widget.dart';

class ResturantsScreen extends StatefulWidget {
  String city;
  ResturantsScreen(this.city,{Key? key}) : super(key: key);

  @override
  State<ResturantsScreen> createState() => _ResturantsScreenState();
}

class _ResturantsScreenState extends State<ResturantsScreen> {
  final FocusNode _textFocusNode = FocusNode();

  TextEditingController? _textEditingController = TextEditingController();
  String _value = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          title: Text('Engez',
              style: TextStyle(color: Colors.red.shade900, fontSize: 25)),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size(size.width, size.height * 0.08),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: _textEditingController,
                  focusNode: _textFocusNode,
                  cursorColor: Colors.black,
                  onChanged: (v) {
                    setState(() {
                      _value = v.toString();
                    });
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'ابحث هنا فى جميع المحفظات ... ',
                      contentPadding: EdgeInsets.all(8)),
                ),
              ),
            ),
          ),
        ),
        body: stream('Restaurants', _value,widget.city));
  }
}
