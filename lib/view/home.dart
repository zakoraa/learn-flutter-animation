import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';
import 'package:flutter_animation/widget/global/card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _positionedImage = 0;
  final double _heightImage = 250;
  final dynamic _animationDuration = 300;
  bool _isTitleAppBarShown = false;

  void _handleScroll() {
    if (widget.scrollController.offset > 70) {
      _positionedImage = -250;
      _isTitleAppBarShown = true;
    } else {
      _positionedImage = 0;
      _isTitleAppBarShown = false;
    }
  }

  @override
  void initState() {
    widget.scrollController.addListener(
      () {
        _handleScroll();
        if (mounted) {
          setState(() {});
        }
      },
    );
    print("init Home");
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(() {});
    print("dispose Home");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(context),
      width: getWidth(context),
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: _animationDuration),
            height: _isTitleAppBarShown ? 160 : _heightImage + 30,
            width: getWidth(context),
            decoration: BoxDecoration(
                border: Border.all(
                    width: _isTitleAppBarShown ? 0.5 : 0,
                    color:
                        _isTitleAppBarShown ? Colors.grey : Colors.transparent),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: _animationDuration),
                  top: _positionedImage,
                  child: Container(
                    height: _heightImage,
                    clipBehavior: Clip.hardEdge,
                    width: getWidth(context),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          "assets/raja_ampat.jpg",
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: getWidth(context),
                          height: _heightImage,
                          color: const Color.fromARGB(95, 0, 0, 0),
                        )
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: _animationDuration),
                  top: _isTitleAppBarShown ? 100 : _heightImage - 20,
                  width: getWidth(context) * 0.9,
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 45,
                        width: getWidth(context),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 0.5, color: Colors.grey)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Color.fromARGB(255, 126, 126, 126),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Cari berdasarkan hati anda...",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 126, 126, 126)),
                                )
                              ],
                            ),
                            Icon(
                              Icons.close,
                              color: Color.fromARGB(255, 126, 126, 126),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 5,
                  child: AnimatedOpacity(
                      duration:
                          Duration(milliseconds: _isTitleAppBarShown ? 500 : 0),
                      opacity: _isTitleAppBarShown ? 1 : 0,
                      child: SafeArea(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: const Text(
                            "Selamat Datang",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardWidget(animationDuration: _animationDuration, scrollController: widget.scrollController)
          ),
        ],
      ),
    );
  }
}
