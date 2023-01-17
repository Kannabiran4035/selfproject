import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GridComponent extends StatelessWidget {
  GridComponent({super.key});

  // List image = [
  //   "https://img.freepik.com/premium-psd/special-offer-3d-megaphone-box-flash-sale-up-50-off_363450-893.jpg?w=740",
  //   "https://as1.ftcdn.net/v2/jpg/03/13/66/88/1000_F_313668868_PjtPd0e77e1BtfkxvWieCKeY6vedGQeW.jpg",
  //   "https://www.bigbasket.com/media/uploads/banner_images/hp_m_bcd_cheese_460px-020122.jpg",
  //   "https://www.bigbasket.com/media/uploads/banner_images/hp_c_YXTT6571_460_1jan23.jpg",
  //   "https://www.bigbasket.com/media/uploads/banner_images/hp_wedding-brida_EP_1600x460px-020122.jpg",
  //   "https://www.bigbasket.com/media/uploads/banner_images/hp_wedding-brida_EP_1600x460px-020122.jpg"
  // ];

  List image = [
    "https://www.bigbasket.com/media/uploads/banner_images/hp_topstrip_m_251122_01.png",
    "https://www.bigbasket.com/media/uploads/banner_images/hp_topstrip_m_251122_02.png",
    "https://www.bigbasket.com/media/uploads/banner_images/hp_topstrip_m_251122_03.png",
    "https://www.bigbasket.com/media/uploads/banner_images/hp_topstrip_m_251122_04.png",
    "https://www.bigbasket.com/media/uploads/banner_images/hp_topstrip_m_251122_05.png",
    "https://www.bigbasket.com/media/uploads/banner_images/hp_topstrip_m_251122_06.png"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: false,
          itemCount: image.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: 150,
              child: Image(image: NetworkImage(image[index])),
            );
          }),
    );
  }
}
