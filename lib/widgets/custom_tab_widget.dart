part of 'widgets.dart';


class CustomTabWidget extends StatelessWidget {
  const CustomTabWidget({
    Key? key,
    this.isCurrent = false,
    required this.title,
  }) : super(key: key);

  final bool isCurrent;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
            color: (!isCurrent) ? Color(0xFFBFBFBF) : Colors.transparent),
        color:(!isCurrent) ? whiteColor:Colors.transparent,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(title),
      ),
    );
  }
}