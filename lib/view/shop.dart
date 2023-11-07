import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  @override
  void initState() {
    print("init Shop");
    super.initState();
  }

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
