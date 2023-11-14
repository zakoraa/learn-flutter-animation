import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final int animationDuration;
  final scrollController;
  const CardWidget({super.key, required this.animationDuration, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: animationDuration),
      color: Colors.white,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: 50,
        controller: scrollController,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 280,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey,
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Ink.image(
                        image: const AssetImage("assets/raja.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Wisata Raja Ampat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("4.9"),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
