part of 'shared.dart';

var googlePlace = GooglePlace("AIzaSyCXEykmj3RsEDFNBrLCmA-lmxKCWqT-zCI");

const double defaultMargin = 24;

const Color mainColor2 = Color(0xFF3DC057);
const Color  mainColor= Colors.blue;
const Color whiteColor = Color(0xFFFFFFFF);
const Color redColor = Color(0xFFFF4747);
const Color blueColor = Color(0xFF0099FF);

const Color backgroundColor = Color(0xFFFFFFFF);
// const Color backgroundColor = Color(0xFFf5f5f5);

const Color blackColor = Colors.black;
const Color greyColor = Color(0xFF808080);
const Color greyColor2 = Color(0xFFE6E6E6);
const Color greyColor3 = Color(0xFF666666);
const Color greyColor4 = Color(0xFFBFBFBF);

const Color accentColor1 = Color(0xFFEAEFFB);
const Color accentColor2 = Color(0xFFFFB800);
const Color accentColor3 = Color(0xFFFF860D);
const Color dividerColor = Color(0xFFFEDEDED);
Color accentColor4 = Colors.grey[400]!;

// Test Text
TextStyle textOpenSans = GoogleFonts.openSans()
    .copyWith(color: blackColor, fontWeight: FontWeight.w500, fontSize: 12);
TextStyle textPlayFair = GoogleFonts.playfairDisplay()
    .copyWith(color: blackColor, fontWeight: FontWeight.w500, fontSize: 12);

// Text Normal-Body
TextStyle whiteTextFont = GoogleFonts.roboto()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);
TextStyle blackTextFont = GoogleFonts.roboto()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12);
TextStyle greenTextFont = GoogleFonts.roboto()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500, fontSize: 12);
TextStyle redTextFont = GoogleFonts.roboto()
    .copyWith(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 12);
TextStyle greyTextFont = GoogleFonts.roboto()
    .copyWith(color: greyColor, fontWeight: FontWeight.w500, fontSize: 12);

// Text Title
TextStyle whiteTextFontTitle = GoogleFonts.roboto()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14);
TextStyle blackTextFontTitle = GoogleFonts.roboto()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14);
TextStyle greenTextFontTitle = GoogleFonts.roboto()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500, fontSize: 14);
TextStyle redTextFontTitle = GoogleFonts.roboto()
    .copyWith(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 14);
TextStyle greyTextFontTitle = GoogleFonts.roboto()
    .copyWith(color: greyColor, fontWeight: FontWeight.w500, fontSize: 14);

// Text Big
TextStyle whiteTextFontBig = GoogleFonts.roboto()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);
TextStyle blackTextFontBig = GoogleFonts.roboto()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18);
TextStyle greenTextFontBig = GoogleFonts.roboto()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500, fontSize: 18);
TextStyle redTextFontBig = GoogleFonts.roboto()
    .copyWith(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 18);
TextStyle greyTextFontBig = GoogleFonts.roboto()
    .copyWith(color: greyColor, fontWeight: FontWeight.w500, fontSize: 18);

// Bold
// Text Normal-Body
TextStyle whiteTextFontBold = GoogleFonts.roboto()
    .copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12);
TextStyle blackTextFontBold = GoogleFonts.roboto()
    .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12);
TextStyle greenTextFontBold = GoogleFonts.roboto()
    .copyWith(color: mainColor, fontWeight: FontWeight.bold, fontSize: 12);
TextStyle redTextFontBold = GoogleFonts.roboto()
    .copyWith(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12);
TextStyle greyTextFontBold = GoogleFonts.roboto()
    .copyWith(color: greyColor, fontWeight: FontWeight.bold, fontSize: 12);

// Text Title
TextStyle whiteTextFontTitleBold = GoogleFonts.roboto()
    .copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);
TextStyle blackTextFontTitleBold = GoogleFonts.roboto()
    .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14);
TextStyle greenTextFontTitleBold = GoogleFonts.roboto()
    .copyWith(color: mainColor, fontWeight: FontWeight.bold, fontSize: 14);
TextStyle redTextFontTitleBold = GoogleFonts.roboto()
    .copyWith(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14);
TextStyle greyTextFontTitleBold = GoogleFonts.roboto()
    .copyWith(color: greyColor, fontWeight: FontWeight.bold, fontSize: 14);

// Text Big
TextStyle whiteTextFontBigBold = GoogleFonts.roboto()
    .copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
TextStyle blackTextFontBigBold = GoogleFonts.roboto()
    .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);
TextStyle greenTextFontBigBold = GoogleFonts.roboto()
    .copyWith(color: mainColor, fontWeight: FontWeight.bold, fontSize: 18);
TextStyle redTextFontBigBold = GoogleFonts.roboto()
    .copyWith(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18);
TextStyle greyTextFontBigBold = GoogleFonts.roboto()
    .copyWith(color: greyColor, fontWeight: FontWeight.bold, fontSize: 18);

TextStyle whiteNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.white);

    
TextStyle blackNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.black);
