part of 'widgets.dart';


class CustomTileWidget extends StatelessWidget {
  const CustomTileWidget({
    Key? key,
    required this.body,
    required this.title,
    this.titleStyle,
    this.bodyStyle,
  }) : super(key: key);
  final String title, body;
  final TextStyle? titleStyle, bodyStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: titleStyle ?? blackTextFont,
        ),
        Text(
          body,
          style: bodyStyle ?? blackTextFont,
        ),
      ],
    );
  }
}
