import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/landing/controller/landing_controller.dart';
import 'package:real_estate_app/utils/color_utils.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  LandingController landingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: Get.width / 1.6,
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
          height: 60,
          padding: const EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(color: ColorUtils.blackShadeOne, borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    landingController.tabIndex.value = 0;
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: landingController.tabIndex.value == 0 ? ColorUtils.yellow : ColorUtils.blackShadeTwo,
                    ),
                    child: Image.asset(
                      "assets/icons/search.png",
                      color: ColorUtils.white,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    landingController.tabIndex.value = 1;
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: landingController.tabIndex.value == 1 ? ColorUtils.yellow : ColorUtils.blackShadeTwo,
                    ),
                    child: Image.asset(
                      "assets/icons/chat.png",
                      color: ColorUtils.white,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    landingController.tabIndex.value = 2;
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: landingController.tabIndex.value == 2 ? ColorUtils.yellow : ColorUtils.blackShadeTwo,
                    ),
                    child: Image.asset(
                      "assets/icons/home.png",
                      color: ColorUtils.white,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    landingController.tabIndex.value = 3;
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: landingController.tabIndex.value == 3 ? ColorUtils.yellow : ColorUtils.blackShadeTwo,
                    ),
                    child: Image.asset(
                      "assets/icons/like.png",
                      color: ColorUtils.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    landingController.tabIndex.value = 4;
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: landingController.tabIndex.value == 4 ? ColorUtils.yellow : ColorUtils.blackShadeTwo,
                    ),
                    child: Image.asset(
                      "assets/icons/profile.png",
                      color: ColorUtils.white,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
