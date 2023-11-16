import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/theme/color.dart';
import 'package:flutter_animation/util/media_query.dart';
import 'package:flutter_animation/widget/shop/plane_section.dart';
import 'package:flutter_animation/widget/shop/type_section.dart';

import '../data/data.dart';

class ShopView extends StatefulWidget {
  final ScrollController scrollController;
  const ShopView({super.key, required this.scrollController});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  int _selectedIndex = 0;

  @override
  void initState() {
    print("init Shop");
    super.initState();
  }

  @override
  void dispose() {
    print("dispose Shop");
    super.dispose();
  }

  void selectIndex(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(context),
      width: getWidth(context),
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: widget.scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 97),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: getWidth(context),
                  color: CustomColor.bgBlue,
                  child: Row(
                    children: [
                      Column(
                        children: List.generate(
                            carouselImages.length,
                            (index) => Container(
                                  height: index == _selectedIndex ? 13 : 8,
                                  width: index == _selectedIndex ? 13 : 8,
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10, right: 15),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: index == _selectedIndex
                                          ? Colors.blueAccent
                                          : const Color.fromARGB(
                                              255, 183, 182, 182)),
                                )),
                      ),
                      Expanded(
                        child: CarouselSlider.builder(
                          itemCount: carouselImages.length,
                          itemBuilder: (context, index, realIndex) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              carouselImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          options: CarouselOptions(
                              onPageChanged: (index, reason) =>
                                  selectIndex(index),
                              autoPlay: true,
                              scrollDirection: Axis.vertical,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 1000),
                              enlargeCenterPage: true,
                              scrollPhysics: const BouncingScrollPhysics(),
                              viewportFraction: 1,
                              aspectRatio: 4 / 3),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TypeSection(),
                const SizedBox(
                  height: 15,
                ),
                const PlaneSection(),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 150,
                )
              ],
            ),
          ),
          Positioned(
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(15),
                width: getWidth(context),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 185, 185, 185)))),
                child: const SafeArea(
                  child: Text(
                    "Shop",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
