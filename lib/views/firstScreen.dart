import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:self_project/components/providerExample.dart';
import 'package:self_project/model/productList.dart';

class FirstScreen extends StatefulWidget {
  var data;
  FirstScreen({super.key, this.data});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  double _width = 100;

  double _height = 100;

  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(10);

  Color _color = Colors.green;

  bool _visible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data);
  }

  late Product product = widget.data;
  @override
  Widget build(BuildContext context) {
    Product collectedData = context.read<SelectedProduct>().datas;
    return SafeArea(
      child: Builder(builder: (context) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                final random = Random();
                _width = random.nextInt(100).toDouble();
                _height = random.nextInt(100).toDouble();
                _color = Color.fromRGBO(
                  random.nextInt(256),
                  random.nextInt(256),
                  random.nextInt(256),
                  1,
                );
                _borderRadiusGeometry =
                    BorderRadius.circular(random.nextInt(100).toDouble());
                _visible = !_visible;
              });
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 10,
                // ),
                // AnimatedContainer(
                //   alignment: Alignment.center,
                //   width: _width,
                //   height: _height,
                //   decoration: BoxDecoration(
                //     color: _color,
                //     borderRadius: _borderRadiusGeometry,
                //   ),
                //   duration: Duration(seconds: 1),
                //   curve: Curves.fastOutSlowIn,
                //   child: Text(context.read<SelectedProduct>().datas.title),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // AnimatedOpacity(
                //   opacity: _visible ? 1.0 : 0.0,
                //   duration: Duration(seconds: 1),
                //   child: Container(
                //     height: 100,
                //     width: 100,
                //     color: _color,
                //     child: Text("Animated Opacity"),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                CarouselSlider(
                    items: List.generate(
                        collectedData.images.length,
                        (index) => Center(
                              child: Image(
                                  image: NetworkImage(
                                      collectedData.images[index])),
                            )),
                    options: CarouselOptions(
                        animateToClosest: true, autoPlay: false, height: 400)),
                Text("${collectedData.brand} - ${collectedData.title}"),
                Text("Price - ${collectedData.price}"),
                Text("Discount - ${collectedData.discountPercentage}"),
                Text("Description - ${collectedData.description}")
              ],
            ),
          ),
        );
      }),
    );
  }
}
