import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    print("init Chat");
    super.initState();
  }

  @override
  void dispose() {
    print("dispose Chat");
    super.dispose();
  }

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
