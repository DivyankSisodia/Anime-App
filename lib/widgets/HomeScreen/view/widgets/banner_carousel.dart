import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeBannerCarousel extends StatelessWidget {
  const HomeBannerCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Image.asset(
          'assets/images/home_image.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Image.asset(
          'assets/images/home_banner2.jpeg',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Image.asset(
          'assets/images/home-banner3.jpeg',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Image.asset(
          'assets/images/home-banner4.jpeg',
          fit: BoxFit.fitHeight,
          height: 150,
          width: double.infinity,
        ),
        Image.asset(
          'assets/images/home_banner5.jpeg',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ],
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 0.8,
        enlargeCenterPage: false,
        viewportFraction: 9 / 9,
        autoPlayInterval: const Duration(seconds: 4),
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
