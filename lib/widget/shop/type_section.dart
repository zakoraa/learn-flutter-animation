import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../theme/color.dart';
import '../../util/media_query.dart';

class TypeSection extends StatefulWidget {
  const TypeSection({super.key});

  @override
  State<TypeSection> createState() => _TypeSectionState();
}

class _TypeSectionState extends State<TypeSection> {
  int _selectedType = 0;

  void selectType(int index) {
    _selectedType = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            "Kuy, cek promo sebelum berpergian",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          width: getWidth(context),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: typeList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => selectType(index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: index == _selectedType
                        ? CustomColor.bgBlue
                        : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1,
                        color: index == _selectedType
                            ? Colors.blueAccent
                            : Colors.grey.shade500)),
                child: Text(
                  typeList[index],
                  style: TextStyle(
                      color: index == _selectedType
                          ? Colors.blueAccent
                          : Colors.black),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: getWidth(context),
          height: 150,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: imageList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              clipBehavior: Clip.hardEdge,
              width: 330,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Image.asset(
                imageList[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: CustomColor.bgBlue,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {},
              splashColor: const Color.fromARGB(255, 124, 206, 244),
              splashFactory: InkRipple.splashFactory,
              child: Container(
                width: getWidth(context),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Lihat semua promo",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.blueAccent),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
