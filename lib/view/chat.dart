import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context),
      width: getWidth(context),
      alignment: Alignment.center,
      color: Colors.red,
      child: const Text("Halaman Chat"),
    );
  }
}
