import 'package:flutter/material.dart';
import 'package:net_geo_app/HomeScreen/UpDownAnimationWidget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool showBottom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imageUrl),
                  fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(
                  //     Colors.white.withOpacity(0.8), BlendMode.dstATop),
                ),
              ),
              constraints: const BoxConstraints.expand(),
              child: showBottom
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.only(bottom: 40, left: 20),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black45])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Indian Museum of Graphics Design',
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Best Places for design lover in India',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (showBottom) {
                                  showBottom = false;
                                } else {
                                  showBottom = true;
                                }
                              });
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(80, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Icon(
                                Icons.more_horiz,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
            showBottom
                ? UpDownAnimationWidget(
                    isBottomToTop: true,
                    milliSeconds: 200,
                    startPosition: 300,
                    child: SingleChildScrollView(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16)),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          height: MediaQuery.of(context).size.height / 1.5,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height - 133),
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: const [
                              Text(
                                'Indian Museum of Graphics Design',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur  deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
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
          ],
        ),
      ),
    );
  }
}
