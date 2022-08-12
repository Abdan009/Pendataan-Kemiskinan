import 'package:app_flutter_cocom/controller/pertanyaan_controller.dart';
import 'package:app_flutter_cocom/extensions/extensions.dart';
import 'package:app_flutter_cocom/models/jawaban_pertanyaan.dart';
import 'package:app_flutter_cocom/models/penduduk.dart';
import 'package:app_flutter_cocom/models/pertanyaan.dart';
import 'package:app_flutter_cocom/shared/shared.dart';
import 'package:app_flutter_cocom/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';

class Assessment_Page5 extends StatefulWidget {
  const Assessment_Page5({
    Key? key,
    required this.penduduk,
  }) : super(key: key);
  final Penduduk penduduk;
  @override
  State<Assessment_Page5> createState() => _Assessment_Page5State();
}

// ignore: camel_case_types
class _Assessment_Page5State extends State<Assessment_Page5> {
  var pertanyaanServices = Get.put(PertanyaanController());
  @override
  void initState() {
    super.initState();
    pertanyaanServices.getPertanyaan();
  }

  double _margin = 100.0;

  Widget _judul() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 23,
        vertical: 12,
      ),
      height: 70,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Data Penduduk',
            style: blackTextBody.copyWith(
              fontSize: 20,
              fontWeight: regular,
            ),
          ),
          Text(
            'Isilah data dibawah ini secara lengkap dan benar',
            style: blackTextBodyTrans.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Button() {
    return GestureDetector(
      onTap: () {
        pertanyaanServices.uploadJawaban(widget.penduduk);
      },
      child: Container(
        height: 45,
        margin: EdgeInsets.symmetric(horizontal: _margin, vertical: 20),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            'Submit',
            style: whiteTextBody.copyWith(
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _pertanyaan1({required Pertanyaan pertanyaan}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 2,
          blurRadius: 2,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ], color: kBackgroun),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 13,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${pertanyaan.isiPertanyaan}',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          Column(
              children: List.generate(
            pertanyaan.listJawaban!.length,
            (index) => Row(
              children: [
                Radio<JawabanPertanyaan?>(
                  value: pertanyaan.listJawaban![index],
                  groupValue: pertanyaan.answer,
                  onChanged: (value) {
                    debugPrint("Masuk ${value}");
                    pertanyaanServices.updateJawaban(
                        pertanyaan: pertanyaan,
                        answer: pertanyaan.listJawaban![index]);
                  },
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  '${pertanyaan.listJawaban![index].pilihanJawaban}',
                  style: grey2TextBody.copyWith(
                    fontSize: 15,
                    fontWeight: regular,
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroun2,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 40,
          ),
        ),
        title: const Text('Assesment Data Penduduk'),
        backgroundColor: kPrimaryColor,
      ),
      body: pertanyaanServices.obxCustom((state) {
        return ListView(
          children: [
            _judul(),
            Column(
              children: List.generate(
                pertanyaanServices.listPertanyaan.length,
                (index) => Obx(
                  () => _pertanyaan1(
                    pertanyaan: pertanyaanServices.listPertanyaan[index],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //Get Photo depan
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Foto Rumah Bagian Depan",
                      style: blackTextFontTitleBold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        pertanyaanServices.getPhoto(context,
                            name: 'photoDepan');
                      },
                      child: Container(
                        height: Get.width * 0.8,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          image: (pertanyaanServices.photoDepan.value != null)
                              ? DecorationImage(
                                  image: FileImage(
                                    pertanyaanServices.photoDepan.value!,
                                    
                                  ),
                                  fit: BoxFit.cover
                                )
                              : null,
                        ),
                        child: (pertanyaanServices.photoDepan.value == null)
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.image,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Tambahkan Foto"),
                                  ],
                                ),
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           const SizedBox(
              height: 15,
            ),
            //photoBelakang
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Foto Rumah Bagian Belakang",
                      style: blackTextFontTitleBold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        pertanyaanServices.getPhoto(context,
                            name: 'photoBelakang');
                      },
                      child: Container(
                        height: Get.width * 0.8,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          image: (pertanyaanServices.photoBelakang.value != null)
                              ? DecorationImage(
                                  image: FileImage(
                                    pertanyaanServices.photoBelakang.value!,
                                    
                                  ),
                                  fit: BoxFit.cover
                                )
                              : null,
                        ),
                        child: (pertanyaanServices.photoBelakang.value == null)
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.image,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Tambahkan Foto"),
                                  ],
                                ),
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           const SizedBox(
              height: 15,
            ),
            //photoKanan
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Foto Rumah Bagian Kanan",
                      style: blackTextFontTitleBold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        pertanyaanServices.getPhoto(context,
                            name: 'photoKanan');
                      },
                      child: Container(
                        height: Get.width * 0.8,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          image: (pertanyaanServices.photoKanan.value != null)
                              ? DecorationImage(
                                  image: FileImage(
                                    pertanyaanServices.photoKanan.value!,
                                    
                                  ),
                                  fit: BoxFit.cover
                                )
                              : null,
                        ),
                        child: (pertanyaanServices.photoKanan.value == null)
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.image,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Tambahkan Foto"),
                                  ],
                                ),
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           const SizedBox(
              height: 15,
            ),
            //photoKiri
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Foto Rumah Bagian Kiri",
                      style: blackTextFontTitleBold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        pertanyaanServices.getPhoto(context,
                            name: 'photoKiri');
                      },
                      child: Container(
                        height: Get.width * 0.8,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          image: (pertanyaanServices.photoKiri.value != null)
                              ? DecorationImage(
                                  image: FileImage(
                                    pertanyaanServices.photoKiri.value!,
                                    
                                  ),
                                  fit: BoxFit.cover
                                )
                              : null,
                        ),
                        child: (pertanyaanServices.photoKiri.value == null)
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.image,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Tambahkan Foto"),
                                  ],
                                ),
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           const SizedBox(
              height: 15,
            ),
            //photoRuangTamu
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Foto Ruangan Tamu",
                      style: blackTextFontTitleBold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        pertanyaanServices.getPhoto(context,
                            name: 'photoRuangTamu');
                      },
                      child: Container(
                        height: Get.width * 0.8,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          image: (pertanyaanServices.photoRuangTamu.value != null)
                              ? DecorationImage(
                                  image: FileImage(
                                    pertanyaanServices.photoRuangTamu.value!,
                                    
                                  ),
                                  fit: BoxFit.cover
                                )
                              : null,
                        ),
                        child: (pertanyaanServices.photoRuangTamu.value == null)
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.image,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Tambahkan Foto"),
                                  ],
                                ),
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           const SizedBox(
              height: 15,
            ),
            //photoRuangTidur
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Foto Ruangan Tidur",
                      style: blackTextFontTitleBold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        pertanyaanServices.getPhoto(context,
                            name: 'photoRuangTidur');
                      },
                      child: Container(
                        height: Get.width * 0.8,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          image: (pertanyaanServices.photoRuangTidur.value != null)
                              ? DecorationImage(
                                  image: FileImage(
                                    pertanyaanServices.photoRuangTidur.value!,
                                    
                                  ),
                                  fit: BoxFit.cover
                                )
                              : null,
                        ),
                        child: (pertanyaanServices.photoRuangTidur.value == null)
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.image,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Tambahkan Foto"),
                                  ],
                                ),
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           const SizedBox(
              height: 15,
            ),
            //photoKamarMandi
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Foto Kamar Mandi",
                      style: blackTextFontTitleBold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        pertanyaanServices.getPhoto(context,
                            name: 'photoKamarMandi');
                      },
                      child: Container(
                        height: Get.width * 0.8,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          image: (pertanyaanServices.photoKamarMandi.value != null)
                              ? DecorationImage(
                                  image: FileImage(
                                    pertanyaanServices.photoKamarMandi.value!,
                                    
                                  ),
                                  fit: BoxFit.cover
                                )
                              : null,
                        ),
                        child: (pertanyaanServices.photoKamarMandi.value == null)
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.image,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Tambahkan Foto"),
                                  ],
                                ),
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           const SizedBox(
              height: 15,
            ),
            //photoDapur
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Foto Dapur",
                      style: blackTextFontTitleBold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        pertanyaanServices.getPhoto(context,
                            name: 'photoDapur');
                      },
                      child: Container(
                        height: Get.width * 0.8,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          image: (pertanyaanServices.photoDapur.value != null)
                              ? DecorationImage(
                                  image: FileImage(
                                    pertanyaanServices.photoDapur.value!,
                                    
                                  ),
                                  fit: BoxFit.cover
                                )
                              : null,
                        ),
                        child: (pertanyaanServices.photoDapur.value == null)
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.image,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Tambahkan Foto"),
                                  ],
                                ),
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           const SizedBox(
              height: 15,
            ),
            //photoKks
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Foto KKS",
                      style: blackTextFontTitleBold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        pertanyaanServices.getPhoto(context,
                            name: 'photoKks');
                      },
                      child: Container(
                        height: Get.width * 0.8,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          image: (pertanyaanServices.photoKks.value != null)
                              ? DecorationImage(
                                  image: FileImage(
                                    pertanyaanServices.photoKks.value!,
                                    
                                  ),
                                  fit: BoxFit.cover
                                )
                              : null,
                        ),
                        child: (pertanyaanServices.photoKks.value == null)
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.image,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Tambahkan Foto"),
                                  ],
                                ),
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           const SizedBox(
              height: 15,
            ),

            _Button(),
          ],
        );
      }, onRefreshData: () {}),
    );
  }
}
