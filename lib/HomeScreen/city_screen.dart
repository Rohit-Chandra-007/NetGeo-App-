import 'package:flutter/material.dart';

import 'package:net_geo_app/HomeScreen/UpDownAnimationWidget.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  // late AnimationController controller;
  // late Animation animation;

  List cityImageList = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
    'assets/images/image5.png',
    'assets/images/image1.png',
  ];

  @override
  void initState() {
    // controller = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 500));
    // animation = Tween<double>(begin: 1800, end: 375)
    //     .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut)
    //       ..addListener(() {
    //         setState(() {});
    //       }));
    // controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            // height: animation.value,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  widget.imageUrl,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.topCenter,
              height: 65,
              child: Center(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.star,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          ),
          UpDownAnimationWidget(
            isBottomToTop: true,
            milliSeconds: 400,
            startPosition: 400,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "EGYPT",
                      style: TextStyle(
                          color: Color.fromARGB(255, 70, 69, 69),
                          fontSize: 32,
                          fontFamily: 'TT Norms Pro',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "Complete Guide".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontFamily: 'TT Norms Pro',
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cityImageList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  cityImageList[index],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Food',
                            style: TextStyle(
                                fontFamily: 'TT Norms Pro',
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset(
                                    cityImageList[0],
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset(
                                    cityImageList[1],
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset(
                                    cityImageList[2],
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset(
                                    cityImageList[3],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 30,
                    child: Row(
                      children: [
                        const Text(
                          'What to see',
                          style: TextStyle(
                              fontFamily: 'TT Norms Pro',
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Container(
                              width: 48,
                              height: 24,
                              child: const Center(
                                  child: Text(
                                '24',
                                style: TextStyle(
                                  fontFamily: 'TT Norms Pro',
                                ),
                              )),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(24)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
