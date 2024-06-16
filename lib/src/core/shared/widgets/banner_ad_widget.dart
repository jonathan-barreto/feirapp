import 'package:carousel_slider/carousel_slider.dart';
import 'package:feirapp/src/core/shared/constants/app_assets.dart';
import 'package:feirapp/src/presenter/home/widgets/item_for_carousel_slider_widget.dart';
import 'package:flutter/material.dart';

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
      color: Theme.of(context).colorScheme.primary,
      child: CarouselSlider(
        items: const [
          ItemForCarouselSlider(
            image: AppAssets.bannerAd1,
          ),
          ItemForCarouselSlider(
            image: AppAssets.bannerAd2,
          ),
          ItemForCarouselSlider(
            image: AppAssets.bannerAd3,
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
