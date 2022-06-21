import 'package:app_flutter_cocom/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Assessment_Page5 extends StatefulWidget {
  const Assessment_Page5({Key? key}) : super(key: key);

  @override
  State<Assessment_Page5> createState() => _Assessment_Page5State();
}

// ignore: camel_case_types
class _Assessment_Page5State extends State<Assessment_Page5> {
  int _value1 = 0;
  int _value2 = 0;
  int _value3 = 0;
  int _value4 = 0;
  int _value5 = 0;

  double _margin = 100.0;

  Widget _judul() {
    return Container(
      padding: EdgeInsets.symmetric(
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
      onTap: () {},
      onTapDown: (_) => setState(() {
        _margin = 110.0;
      }),
      onTapUp: (_) => setState(() {
        _margin = 100.0;
      }),
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

  Widget _pertanyaan1() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], color: kBackgroun),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 13,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '9. Apakah anda dapat membeli pakaian 1 kali atau lebih dalam 1 tahun? *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _value1,
                    onChanged: (value) {
                      setState(() {
                        _value1 = int.parse(value.toString());
                      });
                    },
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Ya',
                    style: grey2TextBody.copyWith(
                      fontSize: 15,
                      fontWeight: regular,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: _value1,
                    onChanged: (value) {
                      setState(() {
                        _value1 = int.parse(value.toString());
                      });
                    },
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    'TIDAK',
                    style: grey2TextBody.copyWith(
                      fontSize: 15,
                      fontWeight: regular,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pertanyaan2() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], color: kBackgroun),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 13,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '10. Apakah anda hanya sanggup makan sebanyak satu kali dalam sehari? *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: _value2,
                onChanged: (value) {
                  setState(() {
                    _value2 = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                'Ya',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: _value2,
                onChanged: (value) {
                  setState(() {
                    _value2 = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                'TIDAK',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _pertanyaan3() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], color: kBackgroun),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 13,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '11. Apakah anda tidak sanggup membayar biaya pengobatan di Puskesmas/Klinik/Rumah Sakit? *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: _value3,
                onChanged: (value) {
                  setState(() {
                    _value3 = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                'Ya',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: _value3,
                onChanged: (value) {
                  setState(() {
                    _value3 = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                'TIDAK',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _pertanyaan4() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], color: kBackgroun),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 13,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '12. Berapa pendapatan anda selama satu bulan? *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: _value4,
                onChanged: (value) {
                  setState(() {
                    _value4 = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '< Rp. 1.000.000',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: _value4,
                onChanged: (value) {
                  setState(() {
                    _value4 = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                'Rp. 1.000.000 - Rp. 1.500.000',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          Row(
            children: [
              Radio(
                value: 3,
                groupValue: _value4,
                onChanged: (value) {
                  setState(() {
                    _value4 = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                'Rp. 1.500.000 - Rp. 2.000.000',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          Row(
            children: [
              Radio(
                value: 4,
                groupValue: _value4,
                onChanged: (value) {
                  setState(() {
                    _value4 = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '> Rp. 2.000.000',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _pertanyaan5() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], color: kBackgroun),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 13,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '13. Apakah anda memiliki tabungan/barang yang mudah dijual dengan minimal Rp. 500.000,- seperti sepeda motor kredit/non kredit, emas, ternak, kapal motor, atau barang modal lainnya.? *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: _value5,
                onChanged: (value) {
                  setState(() {
                    _value5 = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                'Ya',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: _value5,
                onChanged: (value) {
                  setState(() {
                    _value5 = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                'TIDAK',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
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
          icon: Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 40,
          ),
        ),
        title: Text('Assesment Data Penduduk'),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        children: [
          _judul(),
          _pertanyaan1(),
          _pertanyaan2(),
          _pertanyaan3(),
          _pertanyaan4(),
          _pertanyaan5(),
          _Button(),
        ],
      ),
    );
  }
}
