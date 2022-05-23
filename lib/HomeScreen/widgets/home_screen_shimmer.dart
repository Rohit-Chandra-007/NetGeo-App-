import 'package:flutter/material.dart';
import 'package:net_geo_app/HomeScreen/widgets/custom_shimmer_effect.dart';

class HomeScreenShimmer extends StatelessWidget {
  const HomeScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: 'net_geo',
                        child: Image.asset(
                          'assets/images/net_geo.png',
                          width: 120,
                          height: 32,
                        ),
                      ),
                      const CustomShimmerEffect(
                        child: CircleAvatar(
                          radius: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomShimmerEffect(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 42,
                        width: 80,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 38,
                        width: 70,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 38,
                        width: 70,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 38,
                        width: 55,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomShimmerEffect(
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 9 / 13,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: 6,
                      itemBuilder: (BuildContext ctx, index) {
                        return CustomShimmerEffect(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
