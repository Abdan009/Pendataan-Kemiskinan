import 'package:app_flutter_cocom/controller/penduduk_controller.dart';
import 'package:app_flutter_cocom/extensions/extensions.dart';
import 'package:app_flutter_cocom/models/district.dart';
import 'package:app_flutter_cocom/models/penduduk.dart';
import 'package:app_flutter_cocom/pages/assessment/detail_people_page.dart';
import 'package:app_flutter_cocom/shared/shared.dart';
import 'package:app_flutter_cocom/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ListPeoplePage extends StatefulWidget {
  const ListPeoplePage({
    Key? key,
    required this.currentLocation,
  }) : super(key: key);
  final LatLng currentLocation;

  @override
  State<ListPeoplePage> createState() => _ListPeoplePageState();
}

class _ListPeoplePageState extends State<ListPeoplePage> {
  var pendudukServices = Get.find<PendudukController>();

  @override
  void initState() {
    super.initState();
    pendudukServices.getPenduduk(widget.currentLocation,
        status: 'Belum disurvey');
    pendudukServices.getDistrict();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      titleAppBar: const Text("Daftar Penduduk"),
      onRefresh: () async {
        pendudukServices.getPenduduk(widget.currentLocation,
            status: 'Belum disurvey');
        pendudukServices.getDistrict();
      },
      body: ListView(
        children: [
          pendudukServices.obxCustom((state) {
            return Obx(
              () => Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: FormCustomWidget(
                      title: null,
                      hint: "Cari Kecamatan",
                      content: pendudukServices.selectedDistrict.value?.name,
                      arrowForward: true,
                      arrowForwardEnable: true,
                      isNotEmpty:
                          pendudukServices.selectedDistrict.value?.name != null,
                      onClear: () {
                        pendudukServices.getPenduduk(
                          widget.currentLocation,
                          status: 'Belum disurvey',
                        );
                        pendudukServices.selectedDistrict.value = null;
                      },
                      onTap: () async {
                        Get.bottomSheet(
                          SearchServiceWidget(
                            listValue: pendudukServices.listDistrict
                                .map((element) => element.name!)
                                .toList(),
                            result: (value) {
                              District selectedDistrict =
                                  pendudukServices.listDistrict.firstWhere(
                                      (element) => element.name == value);
                              pendudukServices.selectedDistrict.value =
                                  selectedDistrict;

                              pendudukServices.getPenduduk(
                                widget.currentLocation,
                                status: 'Belum disurvey',
                                idDistrict:
                                    pendudukServices.selectedDistrict.value!.id,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  (pendudukServices.listPenduduk.isEmpty)
                      ? const Center(
                          child: DataNotFoundWidget(),
                        )
                      : Column(
                          children: List.generate(
                              pendudukServices.listPenduduk.length, (index) {
                            Penduduk penduduk =
                                pendudukServices.listPenduduk[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailPeoplePage(penduduk: penduduk),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultMargin, vertical: 10),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: greyColor2,
                                      child: FaIcon(
                                        FontAwesomeIcons.user,
                                        color: mainColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            penduduk.nama!,
                                            style: blackTextFontTitleBold,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: "Jarak : ",
                                                style: blackTextFont,
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          "${penduduk.distance!.toStringAsFixed(2)} km ",
                                                      style: blackTextFontBold),
                                                  TextSpan(
                                                      text: "dari anda",
                                                      style: blackTextFont)
                                                ]),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${penduduk.alamatLengkap}",
                                            style: blackTextFont,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                ],
              ),
            );
          }, onRefreshData: () {}),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
