import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  late final ScrollController _scrollController;
  double widthTab = 0;
  int selectedIndex = 0;
  bool _isScrollingDown = false;

  @override
  bool get wantKeepAlive => true;

  Map<String, List<dynamic>> tabs = {
    "Home": [Icons.home_outlined, Icons.home_rounded],
    "Shop": [Icons.shopping_cart_outlined, Icons.shopping_cart],
    "Chat": [Icons.forum_outlined, Icons.forum],
    "Profile": [Icons.person_outline, Icons.person_rounded]
  };

  void selectIndex(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    setState(() {});
  }

  double handleBarAnimation(int index) {
    switch (selectedIndex) {
      case 0:
        return 0;
      case 1:
        return widthTab;
      case 2:
        return widthTab * 2;
      case 3:
        return widthTab * 3;
      default:
        return 0;
    }
  }

  void handleScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _isScrollingDown = true;
    } else {
      _isScrollingDown = false;
    }
  }

  @override
  void initState() {
    _pageController =
        PageController(keepPage: true, viewportFraction: 1, initialPage: 0);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      handleScroll();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    widthTab = getWidth(context) * 0.9 / tabs.length;
    List<Widget> pages = [
      HomeView(scrollController: _scrollController),
      const ShopView(),
      const ChatView(),
      const ProfileView()
    ];

    return Scaffold(
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
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            bottom: _isScrollingDown ? 10 : -80,
            child: GestureDetector(
              onTap: () {
                _isScrollingDown = false;
                _scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.bounceIn);
                setState(() {});
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            bottom: _isScrollingDown ? -80 : 10,
            width: getWidth(context) * 0.9,
            height: 55,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
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
                              child: Container(
                                color: Colors.transparent,
                                width: getWidth(context) * 0.9 / tabs.length,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      index == selectedIndex
                                          ? tabs.values.elementAt(index)[1]
                                          : tabs.values.elementAt(index)[0],
                                      color: index == selectedIndex
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 146, 144, 144),
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 150),
                    bottom: 0,
                    left: 18 + handleBarAnimation(selectedIndex),
                    child: Container(
                      width: widthTab - 35,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 1),
                      decoration: BoxDecoration(
                          color: Colors.white,
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
