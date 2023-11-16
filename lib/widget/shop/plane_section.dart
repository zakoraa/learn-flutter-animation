import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../theme/color.dart';
import '../../util/media_query.dart';

class PlaneSection extends StatefulWidget {
  const PlaneSection({super.key});

  @override
  State<PlaneSection> createState() => _PlaneSectionState();
}

class _PlaneSectionState extends State<PlaneSection> {
  int _selectedType = 0;

  void selectType(int index) {
    _selectedType = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: CustomColor.bgBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Cocok buat rencana perjalananmu",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Cek rekomendasi yang sesuai dengan pesanan terakhirmu atau destinasi yang baru saja kamu lihat",
              style: TextStyle(
                  color: Color.fromARGB(255, 140, 139, 139),
                  fontSize: 14,
                  fontWeight: FontWeight.w100),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
            height: 280,
            width: getWidth(context),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: 6,
              itemBuilder: (context, index) => Container(
                clipBehavior: Clip.hardEdge,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          spreadRadius: 2)
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset(
                        "assets/wahana-dufan.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pintu Gerbang Utama Ancol",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Jakarta Utara",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "4.2/5 (32731 Review)",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                            maxLines: 2,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "IDR 18.720",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.redAccent),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
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
              color: const Color.fromARGB(255, 210, 226, 255),
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
      ),
    );
  }
}
