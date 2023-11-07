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
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: getHeight(context),
      width: getWidth(context),
      alignment: Alignment.center,
      color: Colors.white,
      child: const Text("Halaman Home"),
    );
  }
}
