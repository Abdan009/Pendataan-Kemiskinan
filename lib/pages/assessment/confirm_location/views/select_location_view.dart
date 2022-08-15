import 'package:app_flutter_cocom/pages/assessment/list_people_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../shared/shared.dart';
import '../../../../theme.dart';
import '../../../../widgets/widgets.dart';
import '../controllers/select_location_controller.dart';

class SelectLocationView extends GetView<SelectLocationController> {
  const SelectLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      body: SafeArea(
        child: FutureBuilder(
          future: controller.setCustomMapPin(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: Get.height,
                width: Get.width,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: mainColor,
                  ),
                ),
              );
            }
            return GetBuilder<SelectLocationController>(
              builder: (controller) {
                return Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.hybrid,
                            zoomControlsEnabled: false,
                            initialCameraPosition:
                                controller.currentLocation.value!,
                            // markers: controller.customMarkers.toSet(),
                            onMapCreated: (GoogleMapController controllerMap) {
                              controller.controllerMap = controllerMap;
                            },
                            onCameraMove: (CameraPosition cameraPosition) {
                              controller.currentLocation.value = cameraPosition;
                              // controller.searchAddress();
                              controller.isSync.value = true;
                              controller.update();
                            },
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                FaIcon(
                                  FontAwesomeIcons.locationDot,
                                  size: 40,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 21),
                      color: kBackgroun,
                      // height: 182,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            // height: 75,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: kBackgroun2,
                            ),
                            child: Row(
                              children: [
                                const Image(
                                  image: AssetImage('assets/map.png'),
                                  width: 34,
                                  height: 34,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(
                                        () => Text(
                                          controller.fullAddressName.value,
                                          style: blackTextBody.copyWith(
                                            fontSize: 13,
                                            fontWeight: bold,
                                          ),
                                        ),
                                      ),
                                      // Text(
                                      //   'Perumahan Griya Abadi Karya Blok L1 No.18, Terusan, Sindang, Indramayu',
                                      //   style: greyTextBody.copyWith(
                                      //     fontSize: 12,
                                      //     fontWeight: regular,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: double.infinity,
                            height: 47,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: kPrimaryColor,
                            ),
                            child: InkWell(
                              onTap: () {
                                if (controller.isSync.value) {
                                  controller.searchAddress();
                                } else {
                                  Get.to(
                                    () => ListPeoplePage(
                                      currentLocation: controller
                                          .currentLocation.value!.target,
                                    ),
                                  );
                                }
                              },
                              child: Obx(
                                () => Center(
                                  child: Text(
                                    (controller.isSync.value)
                                        ? "Refresh"
                                        : 'Konfirmasi Lokasi Anda',
                                    style: whiteTextBody.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
