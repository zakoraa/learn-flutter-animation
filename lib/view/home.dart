import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ScrollController _scrollController;
  double positionedImage = 0;
  double heightImage = 300;

  void handleScroll() {
    positionedImage = positionedImage - _scrollController.offset;
    heightImage = heightImage - _scrollController.offset;
    if (positionedImage < -300) {
      positionedImage = -300;
    }
    if (positionedImage >= 0) {
      positionedImage = 0;
    }
    if (heightImage < 130) {
      heightImage = 130;
    }
    if (heightImage >= 300) {
      heightImage = 300;
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        handleScroll();
        setState(() {});
      },
    );
    print("init Home");
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    print("dispose Home");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(context),
      width: getWidth(context),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              color: Colors.white,
              height: heightImage + 50,
              width: getWidth(context),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
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
                        "assets/aot.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: heightImage - 20,
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
                              Icon(Icons.search),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Cari berdasarkan hati anda...")
                            ],
                          ),
                          Icon(Icons.close)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 5,
                      left: 0,
                      child: SafeArea(
                        child: SizedBox(
                          height: 50,
                          child: Stack(
                            clipBehavior: Clip.antiAlias,
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 10,
                                child: Container(
                                  height: 50,
                                  width: 30,
                                  transform: Matrix4.rotationZ(7),
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 14, 14, 14)),
                                ),
                              ),
                              Container(
                                height: 40,
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 24, 24, 24),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: const Text(
                                  "Selamat Datang",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: heightImage + 50),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: 50,
              controller: _scrollController,
              itemBuilder: (context, index) => Container(
                height: 200,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
