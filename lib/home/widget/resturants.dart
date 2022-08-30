
import 'package:flutter/material.dart';

Widget resturants(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
width: 300,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage('images/300062524_614913610000426_2772987590844193481_n.jpg'),
          fit: BoxFit.fill
        )
      ),
      child: Column(
        children: [
          Text('اسم المطعم',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,

          ),),
        ],
      ),

    ),
  );
}