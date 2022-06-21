import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double dMargin = 16.0;
double dRadius = 17.0;

Color kPrimaryColor = const Color(0xff318CE7);
Color kBackgroun = const Color(0xffFFFFFF);
Color kBackgroun2 = const Color(0xffDADADA);
Color kBlackColor = const Color(0xff000000);
Color kBlackColor2 = const Color(0xff8A8A8A);
Color kGrey = const Color(0xff707070);
Color kGreyColor = Color.fromARGB(255, 173, 173, 173);
Color kPlaceholdedrButtonColor = const Color(0xff9E9E9E);
Color kRedColor = const Color(0xffFF0000);
Color ktransparantColor = Colors.transparent;

TextStyle blackTextUtama = GoogleFonts.merriweather(
  color: kBlackColor,
);
TextStyle blackTextUtamaTransparan = GoogleFonts.merriweather(
  color: kBlackColor.withOpacity(0.6),
);
TextStyle whiteTextUtama = GoogleFonts.merriweather(
  color: kBackgroun,
);
TextStyle redTextUtama = GoogleFonts.merriweather(
  color: kRedColor,
);
TextStyle whiteTextBody = GoogleFonts.openSans(
  color: kBackgroun,
);
TextStyle blackTextBody = GoogleFonts.openSans(
  color: kBlackColor,
);
TextStyle blackTextBodyTrans = GoogleFonts.openSans(
  color: kBlackColor.withOpacity(0.6),
);
TextStyle greyTextBody = GoogleFonts.openSans(
  color: kGrey,
);
TextStyle grey2TextBody = GoogleFonts.openSans(
  color: kBlackColor2,
);
TextStyle blueTextBody = GoogleFonts.openSans(
  color: kPrimaryColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
