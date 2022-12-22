import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlideContainer extends StatefulWidget {
  const SlideContainer({super.key});

  @override
  State<SlideContainer> createState() => _SlideContainerState();
}

class _SlideContainerState extends State<SlideContainer> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          enableInfiniteScroll: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          viewportFraction: 0.8,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          height: 400.0),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amber),
                child: Center(
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}
