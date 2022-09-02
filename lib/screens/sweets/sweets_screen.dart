import 'package:flutter/material.dart';


class SweetsScreen extends StatelessWidget {
   SweetsScreen({Key? key}) : super(key: key);

  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('Engez',
              style: TextStyle(color: Colors.red, fontSize: 25)),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size(size.width,size.height *0.08),
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
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText:  'ابحث هنا ... ',
                      contentPadding: EdgeInsets.all(8)),

                ),
              ),
            ),

          ),
        ),
        body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context,i){
              return items();
            }
        )
    );
  }
}
Widget items(){
  return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 10,
            right: 12,
            left: 12
        ),
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
              ],      color: Colors.white,
            ),
            child:Row(
              children: [
                Container(
                  height: 130,
                  width: 120,
                  decoration: BoxDecoration(
                    //color: Colors.red,
                      borderRadius:BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('images/food.png'),
                          fit: BoxFit.cover
                      )
                  ),

                ),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Text('بلبن',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900]
                          ),),
                        Text('(وسط البلد ) ')
                      ],
                    ),
                    Text('رز بلبن - حلويات',style: TextStyle(
                        color: Colors.red
                    ),)


                  ],
                ),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
              ],

            )
        ),
      ));
}