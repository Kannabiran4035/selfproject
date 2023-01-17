import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CarouselTwo extends StatelessWidget {
  CarouselTwo({super.key});
  List image = [
    // "https://img.freepik.com/premium-psd/special-offer-3d-megaphone-box-flash-sale-up-50-off_363450-893.jpg?w=740",
    "https://as1.ftcdn.net/v2/jpg/03/13/66/88/1000_F_313668868_PjtPd0e77e1BtfkxvWieCKeY6vedGQeW.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/hp_m_bcd_cheese_460px-020122.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/hp_c_YXTT6571_460_1jan23.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/hp_wedding-brida_EP_1600x460px-020122.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/hp_wedding-brida_EP_1600x460px-020122.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List.generate(
            image.length,
            (index) => Center(
                  child: Image(
                      image: NetworkImage(image[index]), fit: BoxFit.fitWidth),
                )),
        options: CarouselOptions(
            height: 150,
            autoPlay: true,
            animateToClosest: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            pageSnapping: true,
            enlargeFactor: 170));
  }
}
