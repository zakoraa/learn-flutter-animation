import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';
import 'package:flutter_animation/widget/global/card.dart';

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
  void dispose() {
    print("dispose Shop");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context),
      width: getWidth(context),
     
    );
  }
}
