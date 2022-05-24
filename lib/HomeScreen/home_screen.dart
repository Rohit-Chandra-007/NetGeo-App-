import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:net_geo_app/HomeScreen/city_screen.dart';
import 'package:net_geo_app/HomeScreen/widgets/home_screen_shimmer.dart';
import 'package:page_transition/page_transition.dart';

import 'widgets/FadeInOutAnimationWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  bool isShimmer = true;
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          isShimmer = false;
        });
      },
    );
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  List imageList = [
    'assets/images/card1.png',
    'assets/images/card2.png',
  ];

  List cityImageList = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
    'assets/images/image5.png',
    'assets/images/image1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: isShimmer
              ? const HomeScreenShimmer()
              : FadeInOutAnimationWidget(
                  isFadeIn: true,
                  milliSeconds: 200,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/net_geo.png',
                                width: 120,
                                height: 32,
                              ),
                              const CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      'https://cdn.pixabay.com/photo/2015/03/03/20/42/man-657869_1280.jpg'))
                            ],
                          ),
                        ),
                      ),
                      TabBar(
                          controller: tabController,
                          indicatorColor: Colors.transparent,
                          isScrollable: true,
                          unselectedLabelColor: Colors.grey,
                          unselectedLabelStyle: const TextStyle(
                              fontFamily: 'TT Norms Pro',
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                          labelColor: Colors.black,
                          labelStyle: const TextStyle(
                            fontFamily: 'TT Norms Pro',
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          tabs: const [
                            Tab(text: 'Guides'),
                            Tab(text: 'Stories'),
                            Tab(text: 'Videos'),
                            Tab(
                              text: 'Social',
                            ),
                            Tab(
                              text: 'News',
                            )
                          ]),
                      Expanded(
                        child: TabBarView(
                            controller: tabController,
                            children: <Widget>[
                              WorldWidget(
                                  imageList: imageList,
                                  cityImageList: cityImageList),
                              WorldWidget(
                                  imageList: imageList,
                                  cityImageList: cityImageList),
                              WorldWidget(
                                  imageList: imageList,
                                  cityImageList: cityImageList),
                              WorldWidget(
                                  imageList: imageList,
                                  cityImageList: cityImageList),
                              WorldWidget(
                                  imageList: imageList,
                                  cityImageList: cityImageList),
                            ]),
                      )
                      // Image.asset(
                      //   'assets/images/net_geo.png',
                      // )
                    ],
                  ),
                ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}

class WorldWidget extends StatelessWidget {
  const WorldWidget({
    Key? key,
    required this.imageList,
    required this.cityImageList,
  }) : super(key: key);

  final List imageList;
  final List cityImageList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CarouselSlider.builder(
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return InkWell(
              onTap: (() {
                String image = imageList[index];
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        alignment: Alignment.center,
                        child: CityScreen(
                          imageUrl: image,
                        )));
              }),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [Colors.transparent,Colors.black]),
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      imageList[index],
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'EGYPT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'TT Norms Pro',
                                  fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              'assets/images/egypt.png',
                              height: 24,
                              width: 24,
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child: Column(
                        children: const [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Giza',
                              style: TextStyle(
                                  fontFamily: 'TT Norms Pro',
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: 24),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Complete Guide',
                              style: TextStyle(
                                  fontFamily: 'TT Norms Pro',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 180,
            viewportFraction: 1,
          ),
          itemCount: imageList.length,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 9 / 13,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: cityImageList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          cityImageList[index],
                        ),
                      ),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'NEW DELHI',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'TT Norms Pro',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Image.asset(
                                    'assets/images/india.png',
                                    height: 24,
                                    width: 24,
                                  )
                                ]),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 25),
                              child: Text(
                                'India',
                                style: TextStyle(
                                    fontFamily: 'TT Norms Pro',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ),
                          )
                        ]),
                  );
                }),
          ),
        )
      ],
    );
  }
}
