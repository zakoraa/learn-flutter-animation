import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  late ScrollController _scrollController;
  int _selectedIndex = 0;

  final List<String> _carouselImages = [
    "assets/ticket1.jpg",
    "assets/ticket2.jpg",
    "assets/ticket3.jpg",
  ];

  final List<String> _typeList = [
    "Semua",
    "Pesawat",
    "Hotel",
    "Vila & Apt.",
    "To Do",
    "Kereta Api",
    "Bus Travel",
    "Sewa Mobil",
    "Jemputan Bandara",
  ];

  @override
  void initState() {
    _scrollController = ScrollController();
    print("init Shop");
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(
      () {},
    );
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
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: getWidth(context),
                  color: const Color.fromARGB(255, 226, 236, 255),
                  child: Row(
                    children: [
                      Column(
                        children: List.generate(
                            _carouselImages.length,
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
                          itemCount: _carouselImages.length,
                          itemBuilder: (context, index, realIndex) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              _carouselImages[index],
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
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 50,
                    width: getWidth(context),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: _typeList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1, color: Colors.grey.shade500)),
                        child: Text(_typeList[index]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 0,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: getWidth(context),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 185, 185, 185)))),
                  child: const Text(
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
