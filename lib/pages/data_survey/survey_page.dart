import 'package:app_flutter_cocom/controller/penduduk_controller.dart';
import 'package:app_flutter_cocom/models/penduduk.dart';
import 'package:app_flutter_cocom/pages/assessment/detail_people_page.dart';
import 'package:app_flutter_cocom/shared/shared.dart';
import 'package:app_flutter_cocom/theme.dart';
import 'package:app_flutter_cocom/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Survey_page extends StatefulWidget {
  const Survey_page({Key? key}) : super(key: key);

  @override
  State<Survey_page> createState() => _Survey_pageState();
}

class _Survey_pageState extends State<Survey_page> {
  final _searchController = TextEditingController();
  final pendudukController = Get.find<PendudukController>();
  var listPenduduk = List<Penduduk>.empty();
  @override
  void initState() {
    super.initState();
    listPenduduk = pendudukController.listSudahAssesment;
  }

  void search(String? value) {
    if (value != null) {
      listPenduduk = pendudukController.listSudahAssesment
          .where(
            (p0) => p0.nama!.toLowerCase().contains(
                  value.toLowerCase(),
                ),
          )
          .toList();
    }else{
       listPenduduk = pendudukController.listSudahAssesment;
    }
    setState(() {
      
    });
  }

  Widget _searching() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 70,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: kBlackColor2,
              )),
          child: TextField(
            controller: _searchController,
            autocorrect: false,
            style: blackTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
            onChanged: (value){
              search(value);
            },
            decoration: InputDecoration(
              hintText: 'Searching',
              hintStyle:
                  grey2TextBody.copyWith(fontSize: 15, fontWeight: regular),
              border: InputBorder.none,
              suffixIcon: const Icon(
                Icons.search,
              ),
            ),
          ),
        ),
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
          title: Text('Data Survey'),
          backgroundColor: kPrimaryColor,
        ),
        body: ListView(
          children: [
            _searching(),
         (listPenduduk.isEmpty)?const DataNotFoundWidget():   Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                children: List.generate(listPenduduk.length, (index) {
                  Penduduk penduduk = listPenduduk[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(DetailPeoplePage(penduduk: penduduk));
                    },
                    child: Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${penduduk.nama}",
                            style: blackTextFontTitleBold,
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
                  );
                }),
              ),
            )
          ],
        ));
  }
}
