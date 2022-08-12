part of 'widgets.dart';

class CustomAnimatedAppBar extends StatelessWidget {
  const CustomAnimatedAppBar({
    Key? key,
    this.sizeFontHeaderMax = 32,
    this.currentSizedFontHeader = 32,
    this.scrollCurrentPosition = 0,
    this.title = "",
    this.child,
    this.suffrix,
    this.showArrowBack = false,
  }) : super(key: key);

  final double sizeFontHeaderMax, currentSizedFontHeader, scrollCurrentPosition;
  final String title;
  final Widget? child, suffrix;
  final bool showArrowBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: defaultMargin)
          .copyWith(bottom: 10),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: (scrollCurrentPosition >= sizeFontHeaderMax)
            ? [
                BoxShadow(
                    offset: Offset(0, 0.5),
                    color: blackColor.withOpacity(0.2),
                    blurRadius: 5),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                if(showArrowBack)  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                    ),
                  ),
                  if(showArrowBack)    SizedBox(
                    width: 25,
                  ),
                  Text(
                    title,
                    style: greenTextFontBigBold.copyWith(
                      fontSize: currentSizedFontHeader,
                    ),
                  ),
                ],
              ),
              if (suffrix != null) suffrix!
            ],
          ),
          if (child != null) child!
        ],
      ),
    );
  }
}
