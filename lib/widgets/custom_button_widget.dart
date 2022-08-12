part of 'widgets.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final ButtonStyle? style;
  final Color? primaryColor, borderColor;
  final Function() onTap;
  final TextStyle? textStyle;
  final double? width, height;
  final Widget? leading;
  final double? borderRadius;
  const CustomButtonWidget({
    Key? key,
    required this.title,
    this.style,
    this.primaryColor,
    this.borderColor,
    required this.onTap,
    this.textStyle,
    this.width,
    this.height,
    this.leading,
    this.borderRadius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: height ?? 50,
      width: width ?? Get.width,
      child: ElevatedButton(
        style: style ??
            ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              primary: primaryColor ?? mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 26),
              ),
              elevation: 5,
              side: (borderColor != null)
                  ? BorderSide(
                      color: borderColor!,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null)
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: leading,
              ),
            Text(
              title,
              style: textStyle ??
                  whiteTextFontBigBold
            ),
          ],
        ),
      ),
    );
  }
}
