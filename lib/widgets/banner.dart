import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:store/constants.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
    int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
                  Container(
            // color: kGreyColor,
            child: CarouselSlider(
                items: [
                  SliderCard(
                    title: "Light up your world",
                    image: '../assets/banner/plant1.jpg',
                    press: () {},
                  ),
                  SliderCard(
                    title: "Light up your soul",
                    image: '../assets/banner/plant2.jpg',
                    press: () {},
                  ),
                  SliderCard(
                    title: "Light up your mind",
                    image: '../assets/banner/plant3.jpg',
                    press: () {},
                  ),
                  SliderCard(
                    title: "Light up your life",
                    image: '../assets/banner/plant4.jpg',
                    press: () {},
                  ),
                  // Image.asset('../assets/banner/plant1.jpg'),
                  // Image.asset('../assets/banner/plant2.jpg'),
                  // Image.asset('../assets/banner/plant3.jpg'),
                  // Image.asset('../assets/banner/plant4.jpg'),
                ],
                options: CarouselOptions(
                  
                  height: 500,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int p, CarouselPageChangedReason) {
                    setState(() {
                      index=p;

                    });
                  },
                )),
          ),
           DotsIndicator(
  dotsCount: 4,
  position: index.toDouble(),
  decorator: DotsDecorator(
    activeColor: kPrimaryColor.withOpacity(0.5),
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
           ),
       
      ],
    );
  }
}

class SliderCard extends StatelessWidget {
  const SliderCard({
    super.key,
    required this.title,
    required this.image,
    required this.press,
  });
  final String title, image;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      color: kGreyColor,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                      Text(
                        title,
                        textScaleFactor: 1.5,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      InkWell(
                        onTap: press,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: const BoxDecoration(color: Colors.black),
                          child: const Text(
                            "Shop now",
                            style: TextStyle(
                                color: kWhiteColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                                    ],
                                  ),
                  ),
               
              ],
            ),
          ),
          SizedBox(width: 15,),
          Expanded(child: Image.asset(image)),
        ],
      ),
    );
  }
}
