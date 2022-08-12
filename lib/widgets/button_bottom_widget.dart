part of 'widgets.dart';

class CustomButtonBottom extends StatelessWidget {
  const CustomButtonBottom({
    Key? key,
    required this.onTap,
    required this.title,
    this.color = mainColor,
  }) : super(key: key);

  final Function() onTap;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      highlightColor: greyColor,
      focusColor: greyColor,
      color: color,
      elevation: (color!=mainColor)?0:10,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26),
      ),
      child: SizedBox(
        height: 52,
        width: Get.width,
        child: Center(
          child: Text(
            title,
            style: whiteTextFontBigBold,
          ),
        ),
      ),
    );
  }
}