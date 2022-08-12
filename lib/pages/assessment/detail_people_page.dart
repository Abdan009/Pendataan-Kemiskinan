import 'package:app_flutter_cocom/extensions/extensions.dart';
import 'package:app_flutter_cocom/models/penduduk.dart';
import 'package:app_flutter_cocom/pages/assessment/assesment5_page.dart';
import 'package:app_flutter_cocom/shared/shared.dart';
import 'package:app_flutter_cocom/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:map_launcher/map_launcher.dart' as mapLauncher;

class DetailPeoplePage extends StatefulWidget {
  const DetailPeoplePage({
    Key? key,
    required this.penduduk,
  }) : super(key: key);
  final Penduduk penduduk;

  @override
  State<DetailPeoplePage> createState() => _DetailPeoplePageState();
}

class _DetailPeoplePageState extends State<DetailPeoplePage> {
  late GoogleMapController _controllerMap;
  var customMarkers = List<Marker>.empty().obs;

  late CameraPosition kGooglePlex;
  late BitmapDescriptor pinLocation;

  Penduduk? penduduk;

  @override
  void initState() {
    super.initState();
    penduduk = widget.penduduk;

    kGooglePlex = CameraPosition(
      target: LatLng(
        double.parse(penduduk!.longitude!),
        double.parse(penduduk!.latitude!),
      ),
      zoom: 16,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      titleAppBar: const Text("Detail Warga"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          const SizedBox(
            height: 10,
          ),
          FieldInfoWidget(
            title: "Nama Lengkap",
            body: "${penduduk!.nama}",
          ),
          FieldInfoWidget(
            title: "Tanggal Lahir",
            // body: DateTime.parse(penduduk!.tanggalLahir!).dateAndTimeLahir,
            body: DateTime.parse(penduduk!.tanggalLahir!).dateAndTimeLahir,
          ),
          FieldInfoWidget(
            title: "Jenis Kelamin",
            body: "${penduduk!.jenisKelamin}",
          ),
          FieldInfoWidget(
            title: "Agama",
            body: "${penduduk!.agama}",
          ),
          FieldInfoWidget(
            title: "Status",
            body: "${penduduk!.nameStatus}",
          ),
          FieldInfoWidget(
            title: "Pekerjaan",
            body: "${penduduk!.pekerjaan}",
          ),
          FieldInfoWidget(
            title: "Kecamatan",
            body: "${penduduk!.nameDistrict}",
          ),
          FieldInfoWidget(title: "Desa", body: "${penduduk!.nameVillage}"),
          FieldInfoWidget(
            title: "Alamat Lengkap",
            body: "${penduduk!.alamatLengkap}",
            // isDivider: false,
          ),
          FieldInfoWidget(
            title: "Koordinat",
            body: "${penduduk!.longitude},${penduduk!.latitude}",
            // isDivider: false,
          ),
          FieldInfoWidget(
            title: "Status Assessment",
            body: "${penduduk!.statusSurvey}",
            isDivider: false,
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: setCustomMapPin(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: const Color(0xFFE6E6E6), width: 2),
                    ),
                  ),
                );
              }
              if (snapshot.error != null) {
                return Center(
                  child: Text(
                    "Mengakses Maps Gagal\n\nPastikan anda telah mengaktifkan GPS dan menyetujui pengaksesan lokasi",
                    style: blackTextFont,
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return mapsWidget();
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
      bottomNavigationBar: (penduduk!.statusSurvey == 'Belum disurvey')
          ? ButtonBottomDetailItemWidget(
              onTap1: () async {
                var result = await Get.to(
                  Assessment_Page5(
                    penduduk: penduduk!,
                  ),
                );
                if (result != null) {
                  setState(() {
                    penduduk = result;
                  });
                }
              },
              onTap2: () {
                redirectToMaps();
              },
              title1: "Mulai Asessment",
              title2: "Menuju Lokasi",
            )
          : ButtonBottomDetailItemWidget(
              onTap1: () async {
                redirectToMaps();
              },
              title1: "Menuju Lokasi",
            ),
    );
  }

  setCustomMapPin() async {
    customMarkers.add(
      buildMarker(kGooglePlex.target),
    );
    return true;
  }

  Marker buildMarker(LatLng position) {
    return Marker(
      markerId: const MarkerId(
        "sourcePin",
      ),
      position: position,
      // icon: pinLocation,
    );
  }

  Widget mapsWidget() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      height: 160,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: greyColor2)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          markers: customMarkers.toSet(),
          initialCameraPosition: kGooglePlex,
          onMapCreated: (GoogleMapController controllerMap) {
            _controllerMap = controllerMap;
          },
        ),
      ),
    );
  }

  void redirectToMaps() async {
    final availableMaps = await mapLauncher.MapLauncher.installedMaps;
    await availableMaps.first.showDirections(
      destination: mapLauncher.Coords(
          kGooglePlex.target.latitude, kGooglePlex.target.longitude),
      destinationTitle: "Penerima paket",
      directionsMode: mapLauncher.DirectionsMode.driving,
    );
  }
}

class FieldInfoWidget extends StatelessWidget {
  const FieldInfoWidget({
    Key? key,
    required this.title,
    required this.body,
    this.isDivider = true,
  }) : super(key: key);
  final String title, body;
  final bool isDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: isDivider
            ? const Border(
                bottom: BorderSide(color: greyColor2),
              )
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextFontTitle,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              body,
              style: blackTextFontTitleBold,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
