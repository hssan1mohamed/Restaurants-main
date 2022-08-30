

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
CarouselController buttonCarouselController = CarouselController();


final List<String> images=[
  'images/300062524_614913610000426_2772987590844193481_n.jpg',
  'images/300419847_1210478389498210_4030693771040821545_n.jpg',
  'images/300769377_1455199998279886_2652025127988417816_n.jpg'

];

Widget Carousel(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child:CarouselSlider(
          items: images.map((e) => ClipRect(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(e,width: 1050,height: 350
                  ,fit: BoxFit.cover
                  ,),

              ],
            ),
          )).toList(),
        carouselController: buttonCarouselController,
        options: CarouselOptions(
            autoPlay: true,
            reverse: false,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 2,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal

          )
      )

    ),
  );



}
