
import 'package:flutter/material.dart';

Widget resturants(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child:Stack(
      children: [
        Container(
        width: 250,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: const AssetImage('images/300062524_614913610000426_2772987590844193481_n.jpg'),
              fit: BoxFit.fill
            )
          ),
        ),
        Opacity(
          opacity: 0.7,
          child: Container(
            margin: const EdgeInsets.only(
              top: 90,
              right: 5

            ),
            height: 80,
            width: 240,
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: const [
                    Text('حضرموت عنتر',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.red
                    ),
                    ),
                    Text('(زهراء المعادي)',
                    style: TextStyle(
                      color: Colors.black
                    ),
                    )
                  ],
                ),
                Row(
                  children:  [
                    const Icon(Icons.star_rate,size: 20,color: Colors.green,),
                    const Icon(Icons.star_rate,size: 20,color: Colors.green,),
                    const Icon(Icons.star_rate,size: 20,color: Colors.green,),
                    const Icon(Icons.star_rate,size: 20,color: Colors.green,),
                    const Spacer(),
                    IconButton(onPressed: (){},
                        icon: const Icon(Icons.arrow_forward_ios,color: Colors.blue,))
                  ],
                )
                
                
              ],
            ),
          ),
        )
      ],
    ),
  );
}