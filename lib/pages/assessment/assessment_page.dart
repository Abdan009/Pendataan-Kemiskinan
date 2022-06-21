import 'package:app_flutter_cocom/pages/assessment/assessment2_page.dart';
import 'package:app_flutter_cocom/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Assessment_Page extends StatefulWidget {
  const Assessment_Page({Key? key}) : super(key: key);

  @override
  State<Assessment_Page> createState() => _Assessment_PageState();
}

class _Assessment_PageState extends State<Assessment_Page> {
  final _namaLengkapController = TextEditingController();
  final _nikController = TextEditingController();
  final _kksController = TextEditingController();
  final _umurController = TextEditingController();
  final _kelaminController = TextEditingController();
  final _noHpController = TextEditingController();
  final _kecController = TextEditingController();
  final _alamatController = TextEditingController();
  final _pendidikanController = TextEditingController();

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

  Widget _namaLengkap() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: kBackgroun,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nama Lengkap*',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          TextField(
            controller: _namaLengkapController,
            autocorrect: false,
            style: blackTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
            decoration: InputDecoration(
              hintText: 'Masukan nama lengkap',
              hintStyle: grey2TextBody.copyWith(
                fontSize: 15,
                fontWeight: regular,
              ),
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }

  Widget _nik() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroun,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NIK*',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            maxLines: null,
            maxLength: 60,
            controller: _nikController,
            autocorrect: false,
            style: blackTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
            decoration: InputDecoration(
              hintText: 'Masukan NIK',
              hintStyle: grey2TextBody.copyWith(
                fontSize: 15,
                fontWeight: regular,
              ),
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }

  Widget _kks() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroun,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'No. KKS (Kartu Keluarga Sejahtera)\n Jika Ada',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            maxLines: null,
            controller: _kksController,
            autocorrect: false,
            style: blackTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
            decoration: InputDecoration(
              hintText: 'Masukan nomor KKS',
              hintStyle: grey2TextBody.copyWith(
                fontSize: 15,
                fontWeight: regular,
              ),
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }

  Widget _umur() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroun,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Umur *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            maxLines: null,
            controller: _umurController,
            autocorrect: false,
            style: blackTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
            decoration: InputDecoration(
              hintText: 'Masukan umur',
              hintStyle: grey2TextBody.copyWith(
                fontSize: 15,
                fontWeight: regular,
              ),
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }

  Widget _kelamin() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroun,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jenis Kelamin *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          TextField(
            maxLines: null,
            controller: _kelaminController,
            autocorrect: false,
            style: blackTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
            decoration: InputDecoration(
              hintText: 'Masukan jenis kelamin',
              hintStyle: grey2TextBody.copyWith(
                fontSize: 15,
                fontWeight: regular,
              ),
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }

  Widget _noHp() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroun,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nomor HP *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            maxLines: null,
            controller: _noHpController,
            autocorrect: false,
            style: blackTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
            decoration: InputDecoration(
              hintText: 'Masukan nomor HP',
              hintStyle: grey2TextBody.copyWith(
                fontSize: 15,
                fontWeight: regular,
              ),
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }

  Widget _kecamatan() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroun,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Di Kecamatan mana anda tinggal *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          TextField(
            maxLines: null,
            controller: _kecController,
            autocorrect: false,
            style: blackTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
            decoration: InputDecoration(
              hintText: 'Masukan kecamatan',
              hintStyle: grey2TextBody.copyWith(
                fontSize: 15,
                fontWeight: regular,
              ),
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }

  Widget _alamat() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroun,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alamat lengkap tempat tinggal mu sekarang *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          TextField(
            maxLines: null,
            controller: _alamatController,
            autocorrect: false,
            style: blackTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
            decoration: InputDecoration(
              hintText: 'Masukan alamat lengkap',
              hintStyle: grey2TextBody.copyWith(
                fontSize: 15,
                fontWeight: regular,
              ),
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }

  Widget _pendidikan() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroun,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pendidikan terakhir anda *',
            style: blueTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
          ),
          TextField(
            maxLines: null,
            controller: _pendidikanController,
            autocorrect: false,
            style: blackTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
            decoration: InputDecoration(
              hintText: 'Masukan pendidikan terakhir',
              hintStyle: grey2TextBody.copyWith(
                fontSize: 15,
                fontWeight: regular,
              ),
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Button() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Assessment_Page2()));
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
          _namaLengkap(),
          _nik(),
          _kks(),
          _umur(),
          _kelamin(),
          _noHp(),
          _kecamatan(),
          _alamat(),
          _pendidikan(),
          _Button()
        ],
      ),
    );
  }
}
