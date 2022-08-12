part of 'widgets.dart';

class PageTemplate2 extends StatelessWidget {
  const PageTemplate2({
    Key? key,
    this.suffrixAppBar,
    required this.child,
    this.appBarTitle = "",
    this.showArrowBack=false
  }) : super(key: key);
  final Widget? suffrixAppBar;
  final Widget child;
  final String appBarTitle;
  final bool showArrowBack;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 80,
              ),
              child,
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: CustomAnimatedAppBar(
              title: appBarTitle,
              suffrix: suffrixAppBar,
              showArrowBack: showArrowBack,
            ),
          ),
        ],
      ),
      
    );
  }
}
