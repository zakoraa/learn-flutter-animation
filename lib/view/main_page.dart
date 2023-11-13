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
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late final TabController _tabController;
  late final ScrollController _scrollController;
  double _widthTab = 0;
  int _selectedIndex = 0;
  double _iconSize = 25;
  bool _isScrollingDown = false;

  @override
  bool get wantKeepAlive => true;

  final Map<String, List<dynamic>> _tabs = {
    "Home": [Icons.home_outlined, Icons.home_rounded],
    "Shop": [Icons.shopping_cart_outlined, Icons.shopping_cart],
    "Chat": [Icons.forum_outlined, Icons.forum],
    "Profile": [Icons.person_outline, Icons.person_rounded]
  };

  void _selectIndex(int index) {
    _selectedIndex = index;
    _tabController.animateTo(_selectedIndex,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    setState(() {});
  }

  double _handleBarAnimation(int index) {
    switch (_selectedIndex) {
      case 0:
        return 0;
      case 1:
        return _widthTab;
      case 2:
        return _widthTab * 2;
      case 3:
        return _widthTab * 3;
      default:
        return 0;
    }
  }

  void _handleScroll() {
    if (_scrollController.offset == 0 ||
        _scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
      _isScrollingDown = false;
    } else {
      _isScrollingDown = true;
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _handleScroll();
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
    _widthTab = getWidth(context) * 0.9 / _tabs.length;
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
          TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            viewportFraction: 1,
            controller: _tabController,
            children: List.generate(_tabs.length, (index) => pages[index]),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            bottom: _isScrollingDown ? 10 : -80,
            child: GestureDetector(
              onTap: () {
                _scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.ease);
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
                        _tabs.length,
                        (index) => GestureDetector(
                              onTapUp: (details) {
                                _iconSize = 25;
                                setState(() {});
                              },
                              onTapDown: (details) {
                                _iconSize = 20;
                                _selectIndex(index);
                              },
                              onTapCancel: () {
                                _iconSize = 25;
                                setState(() {});
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: getWidth(context) * 0.9 / _tabs.length,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      index == _selectedIndex
                                          ? _tabs.values.elementAt(index)[1]
                                          : _tabs.values.elementAt(index)[0],
                                      grade: 20,
                                      color: index == _selectedIndex
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 146, 144, 144),
                                      size: index == _selectedIndex
                                          ? _iconSize
                                          : 25,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                  ),
                  AnimatedPositioned(
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 150),
                    bottom: 0,
                    left: 18 + _handleBarAnimation(_selectedIndex),
                    child: Container(
                      width: _widthTab - 35,
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
