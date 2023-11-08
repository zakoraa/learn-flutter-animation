import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    print("init Home");
    super.initState();
  }

  @override
  void dispose() {
    print("dispose Home");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(context),
      width: getWidth(context),
      child: SingleChildScrollView(
        physics: const RangeMaintainingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 350,
              width: getWidth(context),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: SizedBox(
                      height: 300,
                      width: getWidth(context),
                      child: Image.asset(
                        "assets/aot.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 300 - 20,
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
                                      color:
                                          Color.fromARGB(255, 224, 223, 223)),
                                ),
                              ),
                              Container(
                                height: 40,
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: const Text(
                                  "Selamat Datang",
                                  style: TextStyle(
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
            const SizedBox(
              height: 1000,
            )
          ],
        ),
      ),
    );
  }
}
