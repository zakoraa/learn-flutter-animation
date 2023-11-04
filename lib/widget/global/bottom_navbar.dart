import 'package:flutter/material.dart';
import 'package:flutter_animation/theme/color.dart';
import 'package:flutter_animation/util/media_query.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  Map<String, List<dynamic>> tabs = {
    "Home": [Icons.home_outlined, Icons.home_rounded],
    "Shop": [Icons.shop_outlined, Icons.shop_rounded],
    "Chat": [Icons.chat_outlined, Icons.chat_rounded],
    "Profile": [Icons.person_outline, Icons.person_rounded]
  };
  double widthTab = 0;
  int selectedIndex = 0;

  void selectIndex(int index) {
    selectedIndex = index;
    setState(() {});
  }

  double handleBarAnimation(int index, double widthTab) {
    switch (selectedIndex) {
      case 0:
        return 0;
      case 1:
        return this.widthTab;
      case 2:
        return this.widthTab * 2;
      case 3:
        return this.widthTab * 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    widthTab = getWidth(context) * 0.9 / tabs.length;
    return Positioned(
      bottom: 20,
      width: getWidth(context) * 0.9,
      height: 70,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                  color: CustomColor.shadowColor)
            ]),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  tabs.length,
                  (index) => GestureDetector(
                        onTap: () => selectIndex(index),
                        child: SizedBox(
                          width: getWidth(context) * 0.9 / tabs.length,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                index == selectedIndex
                                    ? tabs.values.elementAt(index)[1]
                                    : tabs.values.elementAt(index)[0],
                                color: index == selectedIndex
                                    ? Colors.black
                                    : const Color.fromARGB(255, 113, 113, 113),
                                size: 30,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                tabs.keys.elementAt(index),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: index == selectedIndex
                                        ? FontWeight.bold
                                        : FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      )),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 150),
              bottom: 0,
              left: 18 + handleBarAnimation(selectedIndex, widthTab),
              child: Container(
                width: widthTab - 35,
                height: 5,
                margin: const EdgeInsets.only(bottom: 1),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
