import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          10,
        ),
        child: CarouselSlider(
          items: [
            Container(
              color: Colors.redAccent,
            ),
            Container(
              color: Colors.greenAccent,
            ),
            Container(
              color: Colors.blueAccent,
            ),
          ],
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
          ),
        ),
      ),
    );
  }
}
