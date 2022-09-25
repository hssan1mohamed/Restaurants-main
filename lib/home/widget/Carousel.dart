

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
CarouselController buttonCarouselController = CarouselController();

//
// final List<String> images=[
//   'images/download.jpg',
//   'images/images.jpg',
//   'images/images-1.jpg'
//
// ];
Widget Carousel1() {
  return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('images').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Center(child: Image.asset('images/loading.gif'));
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return  Center(child: Image.asset('images/loading.gif'));
          default:
            return CarouselSlider.builder(
              itemCount: (snapshot.data! as QuerySnapshot).docs.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                String img =
                (snapshot.data! as QuerySnapshot).docs[itemIndex]['img'];
                return  ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: img,
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            Center(child: Image.asset('images/loading.gif')),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ],
                  ),
                );
              },
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
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

              ),
            );
        }
      });
}
// Widget Carousel(){
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       width: double.infinity,
//       margin: const EdgeInsets.all(2),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child:CarouselSlider(
//           items: images.map((e) => Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20)
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   Image.asset(e,width: 1050,height: 350
//                     ,fit: BoxFit.fill
//                     ,),
//
//                 ],
//               ),
//             ),
//           )).toList(),
//         carouselController: buttonCarouselController,
//         options: CarouselOptions(
//           scrollPhysics: const BouncingScrollPhysics(),
//             autoPlay: true,
//             reverse: false,
//             enableInfiniteScroll: true,
//             enlargeCenterPage: true,
//             viewportFraction: 0.9,
//             aspectRatio: 2.0,
//             initialPage: 2,
//             autoPlayInterval: const Duration(seconds: 2),
//             autoPlayAnimationDuration: const Duration(seconds: 1),
//             autoPlayCurve: Curves.fastOutSlowIn,
//             scrollDirection: Axis.horizontal
//
//           ),
//
//       )
//
//     ),
//   );
//
//
//
// }
