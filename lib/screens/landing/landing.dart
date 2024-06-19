import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/landing/tabs/home_tab.dart';
import 'package:real_estate_app/screens/landing/widgets/bottom_bar/bottom_bar.dart';
import 'package:real_estate_app/screens/landing/controller/landing_controller.dart';
import 'package:real_estate_app/screens/landing/tabs/search_tab.dart';
import 'package:real_estate_app/utils/color_utils.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  LandingController landingController = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size(0, 0),
          child: Obx(() => AppBar(
                toolbarHeight: 0,
                backgroundColor: landingController.tabIndex.value == 0 ? Colors.transparent : ColorUtils.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: landingController.tabIndex.value == 0 ? Colors.transparent : ColorUtils.white,
                  statusBarIconBrightness: landingController.tabIndex.value == 0 ? Brightness.light : Brightness.dark,
                ),
              ))),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Obx(() => renderWidget()),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomBar(),
            )
          ],
        ),
      ),
    );
  }

  Widget renderWidget() {
    switch (landingController.tabIndex.value) {
      case 0:
        return const SearchTab();

      case 2:
        return const HomeTab();

      default:
        return Container();
    }
  }
}
