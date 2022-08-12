part of 'widgets.dart';

class ButtonNavBarWidget extends StatelessWidget {
  const ButtonNavBarWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.prefixWidget,
  }) : super(key: key);
  final String title;
  final Function() onTap;
  final Widget? prefixWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin)
          .copyWith(bottom: 24, top: 10),
      decoration: BoxDecoration(color: whiteColor, boxShadow: [
        // BoxShadow(
        //   offset: Offset(0, -2),
        //   color: blackColor.withOpacity(0.2),
        //   blurRadius: 5
        // )
      ]),
      child: Row(
        children: [
          if (prefixWidget != null) prefixWidget!,
          Expanded(
            child: CustomButtonBottom(
              title: title,
              onTap: onTap,
              color: mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
