import 'package:app_flutter_cocom/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AssessmentLokasiPage extends StatefulWidget {
  const AssessmentLokasiPage({Key? key}) : super(key: key);

  @override
  State<AssessmentLokasiPage> createState() => _AssessmentLokasiPageState();
}

class _AssessmentLokasiPageState extends State<AssessmentLokasiPage> {
  double _margin = 100.0;
  LatLng? initialState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroun2,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 40,
          ),
        ),
        title: Text('Assesment Data Penduduk'),
        backgroundColor: kPrimaryColor,
      ),
      body: FutureBuilder(builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            const Spacer(),
            Container(
              padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 21),
              color: kBackgroun,
              height: 182,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding:const EdgeInsets.all(8),
                    height: 75,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Blok L1 No.18 Perumahan Griya Abadi Karya',
                                style: blackTextBody.copyWith(
                                  fontSize: 13,
                                  fontWeight: bold,
                                ),
                              ),
                              Text(
                                'Perumahan Griya Abadi Karya Blok L1 No.18, Terusan, Sindang, Indramayu',
                                style: greyTextBody.copyWith(
                                  fontSize: 12,
                                  fontWeight: regular,
                                ),
                              ),
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
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Konfirmasi Lokasi Anda',
                          style: whiteTextBody.copyWith(
                            fontSize: 18,
                            fontWeight: bold,
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
      }),
    );
  }

  Future getInitial() async {
    return true;
  }
}
