import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/utils/color_utils.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  RxInt counter1 = 0.obs;
  RxInt counter2 = 0.obs;

  late Timer timer1;
  late Timer timer2;

  @override
  void initState() {
    super.initState();

    timer1 = Timer.periodic(const Duration(milliseconds: 1), (_) {
      counter1.value = counter1.value + 1;
      if (counter1.value == 1034) {
        timer1.cancel();
      }
    });

    timer2 = Timer.periodic(const Duration(milliseconds: 1), (_) {
      counter2.value = counter2.value + 1;
      if (counter2.value == 2122) {
        timer2.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              gradient: RadialGradient(
            center: Alignment.centerRight,
            radius: 1.1,
            colors: [
              ColorUtils.yellow.withOpacity(0.5),
              ColorUtils.yellow.withOpacity(0.05),
            ],
          )),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AnimationLimiter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  topBar(),
                  const SizedBox(
                    height: 20,
                  ),
                  welcomeText(),
                  const SizedBox(
                    height: 20,
                  ),
                  counterBoxes(),
                  const SizedBox(
                    height: 20,
                  ),
                  propertiesList()
                ]),
          )),
        )
      ],
    );
  }

  topBar() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Get.width * 0.4,
              height: 30,
              decoration: BoxDecoration(color: ColorUtils.white, borderRadius: BorderRadius.circular(10)),
              child: const Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: ColorUtils.yellowShadeOne,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Saint Petersburg",
                    style: TextStyle(fontSize: 12, color: ColorUtils.yellowShadeOne),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset("assets/images/dummy.jpeg"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  welcomeText() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi, Marina", style: TextStyle(fontSize: 20, color: ColorUtils.yellowShadeOne)),
          Text("let's select your perfect place", style: TextStyle(fontSize: 40, color: ColorUtils.black))
        ],
      ),
    );
  }

  counterBoxes() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: Get.width / 2.2,
            width: Get.width / 2.2,
            decoration: const BoxDecoration(color: ColorUtils.yellow, shape: BoxShape.circle),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  "BUY",
                  style: TextStyle(fontSize: 14, color: ColorUtils.white, fontWeight: FontWeight.w600),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Text(
                          counter1.toString(),
                          style: const TextStyle(fontSize: 36, color: ColorUtils.white, fontWeight: FontWeight.w700),
                        )),
                    const Text(
                      "Offers",
                      style: TextStyle(fontSize: 12, color: ColorUtils.white, fontWeight: FontWeight.w400),
                    ),
                  ],
                ))
              ],
            ),
          ),
          Container(
            height: Get.width / 2.2,
            width: Get.width / 2.2,
            decoration: BoxDecoration(color: ColorUtils.white, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  "RENT",
                  style: TextStyle(fontSize: 14, color: ColorUtils.yellowShadeOne, fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                            counter2.value.toString(),
                            style: const TextStyle(fontSize: 36, color: ColorUtils.yellowShadeOne, fontWeight: FontWeight.w700),
                          )),
                      const Text(
                        "Offers",
                        style: TextStyle(fontSize: 12, color: ColorUtils.yellowShadeOne, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  propertiesList() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: ColorUtils.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )),
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/room1.webp",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 200,
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/room2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                height: 200,
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/room1.webp",
                    fit: BoxFit.cover,
                  ),
                ),
              )),
            ],
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
