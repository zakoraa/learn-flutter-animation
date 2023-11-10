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
            height: isTitleAppBarShown ? 160 : heightImage + 30,
            width: getWidth(context),
            decoration: BoxDecoration(
                border: Border.all(
                    width: isTitleAppBarShown ? 0.5 : 0,
                    color:
                        isTitleAppBarShown ? Colors.grey : Colors.transparent),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
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
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          "assets/raja_ampat.jpg",
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: getWidth(context),
                          height: heightImage,
                          color: const Color.fromARGB(95, 0, 0, 0),
                        )
                      ],
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
                  height: 20,
                ),
                itemCount: 50,
                controller: widget.scrollController,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 280,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 0.5,
                        color: Colors.grey,
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/raja.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wisata Raja Ampat",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("4.9"),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
