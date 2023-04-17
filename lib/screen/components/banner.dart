import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/dept/hotels.dart';
import 'package:food_donation/dept/merriage.dart';
import 'package:food_donation/dept/public_event.dart';
import 'package:food_donation/dept/resturants.dart';
import 'package:food_donation/utils/constant.dart';
// import 'package:food_donation/utils/utils.dart';

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({Key? key}) : super(key: key);

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  List imageList = [
    {"id": 1, "image_path": 'images/logo.jpg'},
    {"id": 2, "image_path": 'images/Banner1.jpg'},
    {"id": 3, "image_path": 'images/Banner2.webp'},
    {"id": 4, "image_path": 'images/Banner3.jpg'},
    {"id": 5, "image_path": 'images/Banner4.webp'},
    {"id": 6, "image_path": 'images/Banner5.jpg'},
  ];
  final CarouselController carouselController = CarouselController();

  int currIndex = 0;

  int currentAd = 0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double smallAdDimension = screenSize.width / 3.5;
    //Image and gradient
    // return GestureDetector(
    //   onHorizontalDragEnd: (_) {
    //     if (currentAd == largeAds.length - 1) {
    //       //currentAd = -1;
    //       setState(() {
    //         currentAd = 0;
    //       });
    //     } else {
    //       setState(() {
    //         currentAd++;
    //       });
    //     }
    //   },
    //   child: Column(
    //     children: [
    //       Stack(
    //         children: [
    //           SizedBox(
    //             width: double.infinity,
    //             child: Image.network(
    //               largeAds[currentAd],
    //             ),
    //           ),
    //           Positioned(
    //             bottom: 0,
    //             child: Container(
    //               width: screenSize.width,
    //               height: screenSize.height / 8,
    //               decoration: BoxDecoration(
    //                 gradient: LinearGradient(
    //                   colors: [
    //                     Colors.white,
    //                     Colors.white.withOpacity(0.000001)
    //                   ],
    //                   begin: Alignment.bottomCenter,
    //                   end: Alignment.topCenter,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //       Container(
    //         height: smallAdDimension,
    //         width: screenSize.width,
    //         color: Colors.white,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             getSmallAdWidget(
    //               index: 0,
    //               side: smallAdDimension,
    //             ),
    //             getSmallAdWidget(
    //               index: 1,
    //               side: smallAdDimension,
    //             ),
    //             getSmallAdWidget(
    //               index: 2,
    //               side: smallAdDimension,
    //             ),
    //             getSmallAdWidget(
    //               index: 3,
    //               side: smallAdDimension,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                print(currIndex);
              },
              child: CarouselSlider(
                items: imageList
                    .map(
                      (item) => Image.asset(
                        item['image_path'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: false,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: screenSize.width,
                height: screenSize.height / 8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0.000001),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 150,
          width: screenSize.width,
          color: Colors.white,
          // color: Colors.amber,
          child: SingleChildScrollView(
            //itemCount: categoriesList.length,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Hotels(),
                      ),
                    );
                  },
                  child: getSmallAdWidget(
                    index: 0,
                    side: smallAdDimension,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Resturants(),
                      ),
                    );
                  },
                  child: getSmallAdWidget(
                    index: 1,
                    side: smallAdDimension,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PublicEvents(),
                      ),
                    );
                  },
                  child: getSmallAdWidget(
                    index: 2,
                    side: smallAdDimension,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Merriages(),
                      ),
                    );
                  },
                  child: getSmallAdWidget(
                    index: 3,
                    side: smallAdDimension,
                  ),
                ),
                // getSmallAdWidget(
                //   index: 0,
                //   side: smallAdDimension,
                // ),
                // getSmallAdWidget(
                //   index: 1,
                //   side: smallAdDimension,
                // ),
                // getSmallAdWidget(
                //   index: 2,
                //   side: smallAdDimension,
                // ),
                // getSmallAdWidget(
                //   index: 3,
                //   side: smallAdDimension,
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getSmallAdWidget({required int index, required double side}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: side,
        width: side,
        decoration: ShapeDecoration(
          color: Colors.white,
          shadows: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 8),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(side * 0.2),
                  child: Image.network(
                    smallAds[index],
                    height: side * 0.7,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    adItemNames[index],
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
