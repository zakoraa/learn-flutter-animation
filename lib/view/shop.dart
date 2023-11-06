import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context),
      width: getWidth(context),
      alignment: Alignment.center,
      color: Colors.yellow,
      child: const Text("Halaman Shop"),
    );
  }
}
