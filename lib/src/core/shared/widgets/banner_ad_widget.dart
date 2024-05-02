import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/app_colors.dart';
import 'package:sabor_natural_app/src/presenter/home/widgets/item_for_carousel_slider_widget.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.25,
      color: AppColors.white,
      child: CarouselSlider(
        items: const [
          ItemForCarouselSlider(
            color: Colors.redAccent,
          ),
          ItemForCarouselSlider(
            color: Colors.greenAccent,
          ),
          ItemForCarouselSlider(
            color: Colors.blueAccent,
          ),
        ],
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 0.9,
        ),
      ),
    );
  }
}
