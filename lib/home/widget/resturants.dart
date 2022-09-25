
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget resturants(String name,String img, ){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child:Stack(
      children: [
        Container(
        width: 250,
          height: 180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: img,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      Center(child: Image.asset('images/loading.gif',)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ],
            ),
          ),
        ),
        Opacity(
          opacity: 0.9,
          child: Container(
            margin: const EdgeInsets.only(
              top: 120,
              right: 5

            ),
            height: 50,
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
                  children:
                  [
                    Text(name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.red.shade900
                    ),
                    ),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,color: Colors.blue,)
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}