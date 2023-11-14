import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    print("init Shop");
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(
      () {},
    );
    print("dispose Shop");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context),
      width: getWidth(context),
      alignment: Alignment.center,
      color: Colors.blue,
      child: const Text("Halaman Shop"),
    );
  }
}
