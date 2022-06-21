import 'package:app_flutter_cocom/pages/assessment/assessment3_page.dart';
import 'package:app_flutter_cocom/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Assessment_Page2 extends StatefulWidget {
  const Assessment_Page2({Key? key}) : super(key: key);

  @override
  State<Assessment_Page2> createState() => _Assessment_Page2State();
}

// ignore: camel_case_types
class _Assessment_Page2State extends State<Assessment_Page2> {
  double _margin = 100.0;
  int _value = 0;

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

  Widget _inputRadioButton() {
    return Container(
      color: kBackgroun,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 23,
        vertical: 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pekerjaan anda saat ini *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'Pelajar/Mahasiswa',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'POLRI/TNI',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Radio(
                value: 3,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'PNS/ASN',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Radio(
                value: 4,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'Swasta',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Radio(
                value: 5,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'Wiraswasta',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Radio(
                value: 6,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'Tenaga Medis',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Radio(
                value: 7,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'Petani/Buruh/Tukang',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Radio(
                value: 8,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'Pensiunan',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Radio(
                value: 9,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'Tidak Bekerja',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Radio(
                value: 10,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'Yang lain: .................................................',
                style: grey2TextBody.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Button() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Assessment_Page3()));
      },
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
            'Next',
            style: whiteTextBody.copyWith(
              fontSize: 18,
              fontWeight: bold,
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
          _inputRadioButton(),
          _Button(),
        ],
      ),
    );
  }
}
