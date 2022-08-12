import 'package:app_flutter_cocom/controller/penduduk_controller.dart';
import 'package:app_flutter_cocom/extensions/extensions.dart';
import 'package:app_flutter_cocom/pages/akun/akun_page.dart';
import 'package:app_flutter_cocom/pages/assessment/confirm_location/bindings/select_location_binding.dart';
import 'package:app_flutter_cocom/pages/assessment/confirm_location/views/select_location_view.dart';
import 'package:app_flutter_cocom/pages/data_survey/survey_page.dart';
import 'package:app_flutter_cocom/shared/shared.dart';
import 'package:app_flutter_cocom/theme.dart';
import 'package:app_flutter_cocom/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  final pendudukController = Get.put(PendudukController());
  final pages = [
    const HomeSelect(),
    const Akun_Page(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pendudukController.getInitData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: pendudukController.obxCustom(
        (state) => pages[pageIndex],
        onRefreshData: () {
          pendudukController.getInitData();
        },
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: kBackgroun,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 40,
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? Container(
                    width: 41,
                    height: 41,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kBlackColor.withOpacity(0.2),
                    ),
                    child: Icon(
                      Icons.home,
                      color: kBlackColor,
                      size: 25.0,
                    ),
                  )
                : Container(
                    width: 41,
                    height: 41,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kBlackColor.withOpacity(0.2),
                    ),
                    child: Icon(
                      Icons.home,
                      color: kBlackColor.withOpacity(0.5),
                      size: 25.0,
                    ),
                  ),
          ),
          IconButton(
              iconSize: 40,
              enableFeedback: false,
              onPressed: () {
                Get.to(
                  () => SelectLocationView(),
                  binding: SelectLocationBinding(),
                );
              },
              icon: Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kBlackColor.withOpacity(0.2),
                ),
                child: Icon(
                  Icons.assignment_outlined,
                  color: kBlackColor.withOpacity(0.5),
                  size: 25.0,
                ),
              )),
          IconButton(
              iconSize: 40,
              enableFeedback: false,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Survey_page(),
                  ),
                );
              },
              icon: Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kBlackColor.withOpacity(0.2),
                ),
                child: Icon(
                  Icons.dns_rounded,
                  color: kBlackColor.withOpacity(0.5),
                  size: 25.0,
                ),
              )),
          IconButton(
            iconSize: 40,
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? Container(
                    width: 41,
                    height: 41,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kBlackColor.withOpacity(0.2),
                    ),
                    child: Icon(
                      LineAwesomeIcons.user,
                      color: kBlackColor,
                      size: 25.0,
                    ),
                  )
                : Container(
                    width: 41,
                    height: 41,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kBlackColor.withOpacity(0.2),
                    ),
                    child: Icon(
                      LineAwesomeIcons.user,
                      color: kBlackColor.withOpacity(0.5),
                      size: 25.0,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class HomeSelect extends StatefulWidget {
  const HomeSelect({Key? key}) : super(key: key);

  @override
  State<HomeSelect> createState() => _HomeSelectState();
}

class _HomeSelectState extends State<HomeSelect> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final pendudukController = Get.find<PendudukController>();

  List<String> imgList = [
    'https://assets.pikiran-rakyat.com/crop/0x4:750x420/x/photo/2021/11/18/3325698051.png',
    'https://www.kabarcirebon.com/wp-content/uploads/2021/02/1-HL-BUPATI-INDRAMAYU-NINA-AGUSTINA-DAN-LUCKY-HAKIM-scaled.jpg',
    'https://harianlenteraindonesia.co.id/wp-content/uploads/2022/01/IMG-20220102-WA0001.jpg',
    'https://images.solopos.com/2015/12/Kartu-Keluarga-Sejahtera-KKS-Kartu-Indonesia-Pintar-KIP-dan-Kartu-Indonesia-Sehat-KIS.-Dewi-Fajriani.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroun2,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 80,
            width: double.infinity,
            color: kPrimaryColor,
            child: Row(
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 82,
                  height: 82,
                )
              ],
            ),
          ),
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                viewportFraction: 1,
                onPageChanged: (index, carouseLReason) {
                  print(index);
                  setState(() {
                    _current = index;
                  });
                },
                enlargeCenterPage: true,
              ),
              items: imgList
                  .map(
                    (item) => Container(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.network(item,
                                  fit: BoxFit.cover, width: 1000.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Sudah Assesment",
                            style: greyTextFont,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => Text(
                              "${pendudukController.listSudahAssesment.length}",
                              style:
                                  blackTextFontBigBold.copyWith(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "warga",
                            style: greyTextFont,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Belum Assesment",
                            style: greyTextFont,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => Text(
                              "${pendudukController.listBelumAssesment.length}",
                              style:
                                  blackTextFontBigBold.copyWith(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "warga",
                            style: greyTextFont,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: CustomButtonWidget(
              title: "Mulai Assessment",
              onTap: () {
                Get.to(
                  () => SelectLocationView(),
                  binding: SelectLocationBinding(),
                );
              },
            ),
          ),
          Container(
            color: kBackgroun,
          ),
        ],
      ),
    );
  }
}
