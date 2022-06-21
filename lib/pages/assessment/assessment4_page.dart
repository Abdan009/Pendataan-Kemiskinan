import 'package:app_flutter_cocom/pages/assessment/assesment5_page.dart';
import 'package:app_flutter_cocom/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Assessment_Page4 extends StatefulWidget {
  const Assessment_Page4({Key? key}) : super(key: key);

  @override
  State<Assessment_Page4> createState() => _Assessment_Page4State();
}

// ignore: camel_case_types
class _Assessment_Page4State extends State<Assessment_Page4> {
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
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Assessment_Page5()));
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
            '5. Sumber penerangan rumah anda terbuat dari apa? *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          DropdownSearch<String>(
            items: ["cocom", "atika", " nur"],
            selectedItem: "Pilih",
          )
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
            '6. Sumber air minum anda dirumah berasal dari? *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          DropdownSearch<String>(
            items: ["cocom", "atika", " nur"],
            selectedItem: "Pilih",
          )
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
            '7. Bahan bakar untuk memasak sehari-hari dirumah anda menggunakan? *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          DropdownSearch<String>(
            items: ["cocom", "atika", " nur"],
            selectedItem: "Pilih",
          )
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
            '8. Berapa kali anda mengkonsumsi daging/susu/ayam/telur dalam seminngu? *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          DropdownSearch<String>(
            items: ["cocom", "atika", " nur"],
            selectedItem: "Pilih",
          )
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
          _Button(),
        ],
      ),
    );
  }
}
