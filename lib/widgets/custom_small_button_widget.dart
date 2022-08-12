part of 'widgets.dart';

class CustomSmallButtonWidget extends StatelessWidget {
  const CustomSmallButtonWidget({
    Key? key,
    required this.onTap,
    this.title ="",
    this.padding,
    this.textStyle,
    this.backgroundColor,
    this.child,
    this.borderColor
  }) : super(key: key);
  final Function() onTap;
  final String? title;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Color? backgroundColor, borderColor;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: backgroundColor??whiteColor,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(26.5)),
        side:(backgroundColor==null)? BorderSide(
          color:borderColor?? mainColor,
        ):null,
        padding: padding,
        onPrimary: greyColor,
      ),
      onPressed: onTap,
      child: (child==null)? Text(
        title!,
        style:textStyle?? greenTextFontBold.copyWith(fontSize: 10),
      ):child,
    );
  }
}
