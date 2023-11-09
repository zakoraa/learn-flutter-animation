import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double positionedImage = 0;
  double heightImage = 250;
  dynamic animationDuration = 300;
  bool isTitleAppBarShown = false;

  void handleScroll() {
    if (widget.scrollController.offset > 70) {
      positionedImage = -250;
      isTitleAppBarShown = true;
    } else {
      positionedImage = 0;
      isTitleAppBarShown = false;
    }
  }

  @override
  void initState() {
    widget.scrollController.addListener(
      () {
        handleScroll();
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
            duration: Duration(milliseconds: animationDuration),
            color: Colors.white,
            height: isTitleAppBarShown ? 160 : heightImage + 50,
            width: getWidth(context),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: animationDuration),
                  top: positionedImage,
                  child: Container(
                    height: heightImage,
                    clipBehavior: Clip.hardEdge,
                    width: getWidth(context),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Image.asset(
                      "assets/sasageyo.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: animationDuration),
                  top: isTitleAppBarShown ? 100 : heightImage - 20,
                  width: getWidth(context) * 0.9,
                  child: Container(
                    height: 45,
                    width: getWidth(context),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
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
                                  color: Color.fromARGB(255, 126, 126, 126)),
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
                Positioned(
                  top: 0,
                  left: 5,
                  child: AnimatedOpacity(
                      duration:
                          Duration(milliseconds: isTitleAppBarShown ? 500 : 0),
                      opacity: isTitleAppBarShown ? 1 : 0,
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
                isTitleAppBarShown
                    ? Positioned(
                        bottom: 0,
                        child: Container(
                          height: 0.5,
                          width: getWidth(context),
                          color: Colors.grey,
                        ))
                    : const SizedBox.shrink()
              ],
            ),
          ),
          Expanded(
            child: AnimatedContainer(
              duration: Duration(milliseconds: animationDuration),
              color: Colors.white,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: 50,
                controller: widget.scrollController,
                itemBuilder: (context, index) => Container(
                  height: 200,
                  color: const Color.fromARGB(255, 203, 203, 203),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
