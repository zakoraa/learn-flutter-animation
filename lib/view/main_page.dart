import 'package:flutter/material.dart';
import 'package:flutter_animation/view/chat.dart';
import 'package:flutter_animation/view/home.dart';
import 'package:flutter_animation/view/profile.dart';
import 'package:flutter_animation/view/shop.dart';

import '../theme/color.dart';
import '../util/media_query.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with AutomaticKeepAliveClientMixin {
  late final PageController _pageController;
  double widthTab = 0;
  int selectedIndex = 0;

  @override
  bool get wantKeepAlive => true;

  List<Widget> pages = [
    const HomeView(),
    const ShopView(),
    const ChatView(),
    const ProfileView()
  ];

  Map<String, List<dynamic>> tabs = {
    "Home": [Icons.home_outlined, Icons.home_rounded],
    "Shop": [Icons.shopping_cart_outlined, Icons.shopping_cart],
    "Chat": [Icons.forum_outlined, Icons.forum],
    "Profile": [Icons.person_outline, Icons.person_rounded]
  };

  void selectIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );

    setState(() {});
  }

  double handleBarAnimation(int index, double widthTab) {
    switch (selectedIndex) {
      case 0:
        return 0;
      case 1:
        return this.widthTab;
      case 2:
        return this.widthTab * 2;
      case 3:
        return this.widthTab * 3;
      default:
        return 0;
    }
  }

  @override
  void initState() {
    _pageController =
        PageController(keepPage: true, viewportFraction: 1, initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    widthTab = getWidth(context) * 0.9 / tabs.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation"),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: pages.length,
            controller: _pageController,
            onPageChanged: (value) {
              selectedIndex = value;
              setState(() {});
            },
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),
          Positioned(
            bottom: 20,
            width: getWidth(context) * 0.9,
            height: 70,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 2,
                        offset: Offset(0, 2),
                        color: CustomColor.shadowColor)
                  ]),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        tabs.length,
                        (index) => GestureDetector(
                              onTap: () {
                                selectIndex(index);
                              },
                              child: SizedBox(
                                width: getWidth(context) * 0.9 / tabs.length,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      index == selectedIndex
                                          ? tabs.values.elementAt(index)[1]
                                          : tabs.values.elementAt(index)[0],
                                      color: index == selectedIndex
                                          ? Colors.black
                                          : const Color.fromARGB(
                                              255, 113, 113, 113),
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      tabs.keys.elementAt(index),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: index == selectedIndex
                                              ? FontWeight.bold
                                              : FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                            )),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 150),
                    bottom: 0,
                    left: 18 + handleBarAnimation(selectedIndex, widthTab),
                    child: Container(
                      width: widthTab - 35,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 1),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
