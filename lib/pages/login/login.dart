import 'package:app_flutter_cocom/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ignore: prefer_final_fields
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  double _padding = 0.0;
  double _click = 0.0;
  double _click2 = 0.0;
  double _click3 = 0.0;

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Container(
        height: 241,
        width: 241,
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo.png'),
          ),
        ),
      );
    }

    Widget boxUserName() {
      return Container(
          color: kBackgroun,
          height: 45,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 41),
          padding: const EdgeInsets.symmetric(horizontal: 18),
          // ignore: prefer_const_literals_to_create_immutables
          child: TextField(
            controller: _usernameController,
            autocorrect: false,
            style: blackTextUtama.copyWith(fontSize: 14, fontWeight: bold),
            decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: blackTextUtamaTransparan.copyWith(
                    fontSize: 14, fontWeight: bold),
                border: InputBorder.none,
                icon: const Image(
                  image: AssetImage('assets/icon_user.png'),
                  width: 20,
                  height: 20,
                )),
          ));
    }

    Widget boxPassword() {
      return Container(
          color: kBackgroun,
          height: 45,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 41),
          padding: const EdgeInsets.symmetric(horizontal: 18),
          // ignore: prefer_const_literals_to_create_immutables
          child: TextField(
            controller: _passwordController,
            autocorrect: false,
            obscureText: true,
            style: blackTextUtama.copyWith(fontSize: 14, fontWeight: bold),
            decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: blackTextUtamaTransparan.copyWith(
                    fontSize: 14, fontWeight: bold),
                border: InputBorder.none,
                icon: const Image(
                  image: AssetImage('assets/lock.png'),
                  width: 20,
                  height: 20,
                )),
          ));
    }

    Widget button() {
      return Container(
        height: 45,
        child: GestureDetector(
          onTap: () {},
          onTapDown: (_) => setState(() {
            _padding = 2.0;
            // _click = 1.0;
          }),
          onTapUp: (_) => setState(() {
            _padding = 0.0;
            // _click = 0.0;
          }),
          child: AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: 41),
            padding: EdgeInsets.all(_padding),
            duration: const Duration(milliseconds: 100),
            child: Container(
              margin: EdgeInsets.only(top: _click),
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kRedColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/arrow_right.png'),
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Login',
                    style:
                        whiteTextUtama.copyWith(fontSize: 16, fontWeight: bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget fotter() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Belum punya akun ?',
                style:
                    whiteTextUtama.copyWith(fontSize: 14, fontWeight: regular),
              ),
              GestureDetector(
                onTap: () {},
                onTapDown: (_) => setState(() {
                  _click2 = 0.2;
                }),
                onTapUp: (_) => setState(() {
                  _click2 = 0.0;
                }),
                child: Padding(
                  padding: EdgeInsets.only(top: _click2),
                  child: Text(
                    '   Daftar disini',
                    style: redTextUtama.copyWith(
                        fontSize: 14, fontWeight: regular),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Atau',
            style: whiteTextUtama.copyWith(fontSize: 14, fontWeight: regular),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            onTapDown: (_) => setState(() {
              _click3 = 0.2;
            }),
            onTapUp: (_) => setState(() {
              _click3 = 0.0;
            }),
            child: Padding(
              padding: EdgeInsets.only(top: _click3),
              child: Text(
                'Lupa Kata Sandi',
                style: redTextUtama.copyWith(fontSize: 14, fontWeight: regular),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            logo(),
            boxUserName(),
            const SizedBox(
              height: 19,
            ),
            boxPassword(),
            const SizedBox(
              height: 19,
            ),
            button(),
            const SizedBox(
              height: 36,
            ),
            fotter()
          ],
        ),
      )),
    );
  }
}
