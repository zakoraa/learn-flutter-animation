import 'package:flutter/material.dart';

class ListViewCardWidget extends StatefulWidget {
  final int animationDuration;
  final ScrollController scrollController;
  const ListViewCardWidget(
      {super.key,
      required this.animationDuration,
      required this.scrollController});

  @override
  State<ListViewCardWidget> createState() => _ListViewCardWidgetState();
}

class _ListViewCardWidgetState extends State<ListViewCardWidget> {
  bool startAnimation = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startAnimation = true;
      setState(() {});
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: widget.animationDuration),
      color: Colors.white,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: 50,
        controller: widget.scrollController,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000 + (index * 200)),
            transform: Matrix4.translationValues(
                startAnimation ? 0 : MediaQuery.of(context).size.width, 0, 0),
            height: 280,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 0.5,
                  color: Colors.grey,
                )),
            child: Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                onTap: () {},
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
