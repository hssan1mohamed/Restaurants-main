import 'package:flutter/material.dart';
import 'package:untitled2/home/home_screen.dart';


class SelectGovernorateScreen extends StatelessWidget {
  const SelectGovernorateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Engez',style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Column(

        children: [
          SizedBox(height: 20,),
          Center(
            child: Text('برجاء تحديد المحافظة',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red[900],
              fontSize: 22
            ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red[50],
                        ),
                        child: const Center(child: Text('القاهرة',style: TextStyle(
                          fontWeight: FontWeight.bold,

                        ),)),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red[50],
                        ),
                        child: const Center(child: Text('الجيزة',style: TextStyle(
                          fontWeight: FontWeight.bold,

                        ),)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red[50],
                        ),
                        child: const Center(child: Text('الاسكندرية',style: TextStyle(
                          fontWeight: FontWeight.bold,

                        ),)),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red[50],
                        ),
                        child: const Center(child: Text('اسيوط',style: TextStyle(
                          fontWeight: FontWeight.bold,

                        ),)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red[50],
                        ),
                        child: const Center(child: Text('بورسعيد',style: TextStyle(
                          fontWeight: FontWeight.bold,

                        ),)),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red[50],
                        ),
                        child: const Center(child: Text('قنا',style: TextStyle(
                          fontWeight: FontWeight.bold,

                        ),)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> const Home_screen()));
              } ,
              child: Container(
                  width:  double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.red[900],
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(child: Text('التالي',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white

                  ),))
              ),
            ),
          ),
        ],
      ),
    );
  }
}