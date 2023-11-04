import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';
import 'package:flutter_animation/widget/global/bottom_navbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation"),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Container(
            height: getHeight(context),
            width: getWidth(context),
            alignment: Alignment.center,
            color: Colors.white,
            child: const Text("Halaman 1"),
          ),
          const BottomNavbar()
        ],
      ),
    );
  }
}
