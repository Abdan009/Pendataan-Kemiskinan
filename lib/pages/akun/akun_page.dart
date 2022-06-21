import 'package:app_flutter_cocom/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Akun_Page extends StatefulWidget {
  const Akun_Page({Key? key}) : super(key: key);

  @override
  State<Akun_Page> createState() => _Akun_PageState();
}

class _Akun_PageState extends State<Akun_Page> {
  double _padding = 18.0;
  double _padding2 = 18.0;
  double _fontSize = 18.0;

  Widget boxKetUser() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 18),
      height: 70,
      width: double.infinity,
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Image(
            image: AssetImage('assets/foto_profile.png'),
            width: 50,
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Aldini Eka Putri',
                  style: blackTextBody.copyWith(
                    fontSize: 20,
                    fontWeight: regular,
                  ),
                ),
                Text(
                  '085311767630',
                  style: blackTextBodyTrans.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bPengaturan() {
    return GestureDetector(
      onTap: () {},
      onTapDown: (_) => setState(() {
        _padding = 20.0;
      }),
      onTapUp: (_) => setState(() {
        _padding = 18.0;
      }),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _padding),
        width: double.infinity,
        height: 60,
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
        child: Row(
          children: [
            Icon(
              Icons.settings_outlined,
              size: 22,
              color: kBlackColor.withOpacity(0.6),
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              'Pengaturan Akun',
              style: blackTextBody.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
            ),
            Spacer(),
            Icon(
              Icons.chevron_right_outlined,
              size: 30,
              color: kBlackColor.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }

  Widget bPusatBantuan() {
    return GestureDetector(
      onTap: () {},
      onTapDown: (_) => setState(() {
        _padding2 = 20.0;
      }),
      onTapUp: (_) => setState(() {
        _padding2 = 18.0;
      }),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _padding2),
        width: double.infinity,
        height: 60,
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
        child: Row(
          children: [
            Image(
              image: AssetImage('assets/tanya.png'),
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              'Pengaturan Akun',
              style: blackTextBody.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
            ),
            Spacer(),
            Icon(
              Icons.chevron_right_outlined,
              size: 30,
              color: kBlackColor.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }

  Widget bLogOut() {
    return GestureDetector(
      onTap: () {},
      onTapDown: (_) => setState(() {
        _fontSize = 17.0;
      }),
      onTapUp: (_) => setState(() {
        _fontSize = 18.0;
      }),
      child: Container(
          width: double.infinity,
          height: 60,
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
          child: Center(
              child: Text(
            'Keluar',
            style: blueTextBody.copyWith(
              fontSize: _fontSize,
              fontWeight: bold,
            ),
          ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroun2,
      appBar: AppBar(
        title: Text('Akun'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          boxKetUser(),
          bPengaturan(),
          const SizedBox(
            height: 8,
          ),
          bPusatBantuan(),
          const SizedBox(
            height: 16,
          ),
          bLogOut()
        ],
      ),
    );
  }
}
