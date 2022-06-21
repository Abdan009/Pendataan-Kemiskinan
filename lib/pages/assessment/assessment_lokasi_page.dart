import 'package:app_flutter_cocom/pages/assessment/assessment2_page.dart';
import 'package:app_flutter_cocom/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Assessment_Lokasi_Page extends StatefulWidget {
  const Assessment_Lokasi_Page({Key? key}) : super(key: key);

  @override
  State<Assessment_Lokasi_Page> createState() => _Assessment_Lokasi_PageState();
}

class _Assessment_Lokasi_PageState extends State<Assessment_Lokasi_Page> {
  double _margin = 100.0;

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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 21),
            color: kBackgroun,
            height: 182,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  height: 75,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: kBackgroun2,
                  ),
                  child: Row(
                    children: [
                      Image(
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
      ),
    );
  }
}
