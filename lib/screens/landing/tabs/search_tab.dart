import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/utils/color_utils.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late Timer timer;
  RxDouble show = (0.0).obs;

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  String _darkMapStyle = '';
  RxBool showMarkers = true.obs;
  RxBool showPopup = false.obs;
  RxBool showLayers = false.obs;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(milliseconds: 200), (_) {
      show.value = show.value + 0.5;
      if (show.value >= 1.0) {
        timer.cancel();
      }
    });

    _loadMapStyles();
  }

  Future _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString('assets/map_style/dark_map.json');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedOpacity(
          opacity: show.value,
          duration: const Duration(milliseconds: 200),
          child: Scaffold(
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                SizedBox(
                  height: Get.height,
                  child: Image.asset(
                    "assets/images/mapImage.png",
                    fit: BoxFit.cover,
                  ),
                ),
                createMarkers(),
                searchBar(),
                Positioned(
                  child: createOtherOptions(),
                  top: Get.height * 0.75,
                  left: 50,
                ),
                popup()
              ],
            ),
          ),
        ));
  }

  searchBar() {
    return Container(
      width: Get.width,
      height: 45,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width / 1.6,
            height: 45,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: ColorUtils.white),
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Center(
              child: TextField(
                cursorColor: Colors.black54,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 3),
                    isDense: true,
                    hintText: "Search here",
                    hintStyle: const TextStyle(fontSize: 14, color: Colors.black54),
                    prefixIconConstraints: const BoxConstraints(maxWidth: 30, maxHeight: 30),
                    prefixIcon: Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 30,
                      height: 30,
                      child: Center(
                        child: Image.asset(
                          "assets/icons/search.png",
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: Get.width / 5.5,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorUtils.white),
            child: Image.asset(
              "assets/icons/filter.png",
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }

  createMarkers() {
    return Stack(
      children: [
        Positioned(
          top: 500,
          left: 100,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: showMarkers.value && !showLayers.value
                ? 60
                : showMarkers.value && showLayers.value
                    ? 30
                    : 0,
            height: showMarkers.value && !showLayers.value
                ? 40
                : showMarkers.value && showLayers.value
                    ? 40
                    : 0,
            decoration: const BoxDecoration(
              color: ColorUtils.yellow,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
            child: Center(
              child: FutureBuilder(
                  future: waitToBuild(),
                  builder: (context, snapshot) {
                    if (showLayers.value) {
                      return const Icon(
                        Icons.apartment,
                        color: ColorUtils.white,
                      );
                    } else {
                      return Text(
                        snapshot.data != null ? snapshot.data.toString() : "",
                        style: const TextStyle(fontSize: 12, color: ColorUtils.white),
                      );
                    }
                  }),
            ),
          ),
        ),
        Positioned(
          top: 500,
          left: 200,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: showMarkers.value && !showLayers.value
                ? 60
                : showMarkers.value && showLayers.value
                    ? 30
                    : 0,
            height: showMarkers.value && !showLayers.value
                ? 40
                : showMarkers.value && showLayers.value
                    ? 40
                    : 0,
            decoration: const BoxDecoration(
              color: ColorUtils.yellow,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
            child: Center(
              child: FutureBuilder(
                  future: waitToBuild(),
                  builder: (context, snapshot) {
                    if (showLayers.value) {
                      return const Icon(
                        Icons.apartment,
                        color: ColorUtils.white,
                      );
                    } else {
                      return Text(
                        snapshot.data != null ? snapshot.data.toString() : "",
                        style: const TextStyle(fontSize: 12, color: ColorUtils.white),
                      );
                    }
                  }),
            ),
          ),
        ),
        Positioned(
          top: 250,
          left: 100,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: showMarkers.value && !showLayers.value
                ? 60
                : showMarkers.value && showLayers.value
                    ? 30
                    : 0,
            height: showMarkers.value && !showLayers.value
                ? 40
                : showMarkers.value && showLayers.value
                    ? 40
                    : 0,
            decoration: const BoxDecoration(
              color: ColorUtils.yellow,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
            child: Center(
              child: FutureBuilder(
                  future: waitToBuild(),
                  builder: (context, snapshot) {
                    if (showLayers.value) {
                      return const Icon(
                        Icons.apartment,
                        color: ColorUtils.white,
                      );
                    } else {
                      return Text(
                        snapshot.data != null ? snapshot.data.toString() : "",
                        style: const TextStyle(fontSize: 12, color: ColorUtils.white),
                      );
                    }
                  }),
            ),
          ),
        ),
        Positioned(
          top: 180,
          left: 150,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: showMarkers.value && !showLayers.value
                ? 60
                : showMarkers.value && showLayers.value
                    ? 30
                    : 0,
            height: showMarkers.value && !showLayers.value
                ? 40
                : showMarkers.value && showLayers.value
                    ? 40
                    : 0,
            decoration: const BoxDecoration(
              color: ColorUtils.yellow,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
            child: Center(
              child: FutureBuilder(
                  future: waitToBuild(),
                  builder: (context, snapshot) {
                    if (showLayers.value) {
                      return const Icon(
                        Icons.apartment,
                        color: ColorUtils.white,
                      );
                    } else {
                      return Text(
                        snapshot.data != null ? snapshot.data.toString() : "",
                        style: const TextStyle(fontSize: 12, color: ColorUtils.white),
                      );
                    }
                  }),
            ),
          ),
        ),
        Positioned(
          top: 450,
          left: 330,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: showMarkers.value && !showLayers.value
                ? 60
                : showMarkers.value && showLayers.value
                    ? 30
                    : 0,
            height: showMarkers.value && !showLayers.value
                ? 40
                : showMarkers.value && showLayers.value
                    ? 40
                    : 0,
            decoration: const BoxDecoration(
              color: ColorUtils.yellow,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
            child: Center(
              child: FutureBuilder(
                  future: waitToBuild(),
                  builder: (context, snapshot) {
                    if (showLayers.value) {
                      return const Icon(
                        Icons.apartment,
                        color: ColorUtils.white,
                      );
                    } else {
                      return Text(
                        snapshot.data != null ? snapshot.data.toString() : "",
                        style: const TextStyle(fontSize: 12, color: ColorUtils.white),
                      );
                    }
                  }),
            ),
          ),
        )
      ],
    );
  }

  waitToBuild() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return "7,8 mn P";
  }

  createOtherOptions() {
    return SizedBox(
      width: Get.width / 1.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  showPopup.value = true;
                },
                child: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white38),
                  child: Center(
                      child: Image.asset(
                    "assets/icons/wallet.png",
                    color: ColorUtils.white,
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white38),
                child: Center(
                    child: Image.asset(
                  "assets/icons/direction.png",
                  color: ColorUtils.white,
                )),
              )
            ],
          ),
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white38),
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.format_align_left,
                  size: 15,
                  color: ColorUtils.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "List of variants",
                  style: TextStyle(
                    fontSize: 10,
                    color: ColorUtils.white,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  popup() {
    return Positioned(
      top: Get.height * 0.66,
      left: Get.width * 0.13,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: showPopup.value ? Get.width * 0.35 : 0,
        height: showPopup.value ? Get.width * 0.3 : 0,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: showPopup.value
            ? FutureBuilder(
                future: showPopupOptions(),
                initialData: null,
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.verified_user_rounded, color: Colors.black45, size: 15),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Cosy areas",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            showPopup.value = false;
                            showLayers.value = false;
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.account_balance_wallet_rounded, color: Colors.black45, size: 15),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Price",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                        const Row(
                          children: [
                            Icon(Icons.shopping_basket_rounded, color: Colors.black45, size: 15),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Infrastructure",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            showPopup.value = false;
                            showLayers.value = true;
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.layers_rounded, color: Colors.black45, size: 15),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Without any layer",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                })
            : const SizedBox.shrink(),
      ),
    );
  }

  Future<dynamic> showPopupOptions() async {
    await Future.delayed(const Duration(milliseconds: 1500)).then((va) {});
    return "hello";
  }
}
