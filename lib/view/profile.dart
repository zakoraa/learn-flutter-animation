import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context),
      width: getWidth(context),
      alignment: Alignment.center,
      color: Colors.green,
      child: const Text("Halaman Profile"),
    );
  }
}
