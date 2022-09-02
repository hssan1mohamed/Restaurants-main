import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled2/screens/meal_screen.dart';

class Menu_screen extends StatefulWidget {
  const Menu_screen({Key? key}) : super(key: key);

  @override
  State<Menu_screen> createState() => _Menu_screenState();
}

class _Menu_screenState extends State<Menu_screen> {
  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget cat(){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: size.height * 0.05,
          width: size.width * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.red)),
          child: Center(child: Text('بيتزا',style: TextStyle(color: Colors.red,fontSize: 18),)),),
      )
      ;
    }


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Engez',
            style: TextStyle(color: Colors.red.shade800, fontSize: 25)),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.15),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: _textEditingController,
                    focusNode: _textFocusNode,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'ابحث هنا ... ',
                        contentPadding: EdgeInsets.all(8)),
                  ),
                ),
                SizedBox(height: size.height*0.02,),
                SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      cat(),
                      cat(),
                      cat(),
                      cat(),
                      cat(),
                      cat(),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, i) {
            return items(context);
          }),
    );
  }

  Widget items(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 10, right: 12, left: 12),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => meal_screen())),
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
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://assets-global.website-files.com/5d03b4e13011831ae4624b37/61ff6b8686c6708c070e7d41_production-meal-image-e4122aa8-0fe7-4854-b6f5-e27e0c5be918.jpeg'),
                          fit: BoxFit.cover)),
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
                          'وجبه الكينج',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900]),
                        ),
                        Text('مندي - مشويات')
                      ],
                    ),
                    Text(
                      '(التجمع الخامس) ' + 'حضرموت عنتر',
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      '150' + 'ج',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red[900]),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      radius: 15,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ))),
                )
              ],
            )),
      ),
    ));
  }
}
