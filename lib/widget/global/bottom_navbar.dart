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

  int selectedIndex = 0;

  void selectIndex(int index) {
    selectedIndex = index;
    setState(() {});
  }

  double handleBarAnimation(int index) {
    switch (selectedIndex) {
      case 0:
        return 0;
      case 1:
        return 86;
      case 2:
        return 86 * 2 + 3;
      case 3:
        return 86 * 3 + 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  blurRadius: 3,
                  spreadRadius: 3,
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
                          width: 70,
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
              duration: const Duration(milliseconds: 100),
              bottom: 0,
              left: 20 + handleBarAnimation(selectedIndex),
              child: Container(
                width: 70,
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
