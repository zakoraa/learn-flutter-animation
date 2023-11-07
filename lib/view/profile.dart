import 'package:flutter/material.dart';
import 'package:flutter_animation/util/media_query.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    print("init Profile");
    super.initState();
  }

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
