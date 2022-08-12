part of 'widgets.dart';

class GeneralPage extends StatelessWidget {
  final Widget? titleAppBar;
  final Widget? floatingButton, bottomNavigationBar, drawer;
  final List<Widget> actionsAppBar;
  final Widget body;
  final Future<void> Function()? onRefresh;
  final Color backgroundColorAppBar, statusBarColor, customBackgroundColor;
  final bool isArrowBack;
  final Function()? onBack;

  const GeneralPage({
    Key? key,
    this.titleAppBar,
    required this.body,
    this.floatingButton,
    this.bottomNavigationBar,
    this.drawer,
    this.onRefresh,
    this.actionsAppBar = const [],
    this.backgroundColorAppBar = mainColor,
    this.isArrowBack = true,
    this.statusBarColor = whiteColor,
    this.onBack,
    this.customBackgroundColor = backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (titleAppBar == null) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: statusBarColor,
            statusBarIconBrightness: (statusBarColor == whiteColor)
                ? Brightness.dark
                : Brightness.light),
      );
    }
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: customBackgroundColor,
        appBar: (titleAppBar != null)
            ? AppBar(
                automaticallyImplyLeading: false,
                // iconTheme: const IconThemeData(color: blackColor),
                backgroundColor: backgroundColorAppBar,
                titleTextStyle: (backgroundColorAppBar != whiteColor)
                    ? whiteTextFontBigBold.copyWith(fontSize: 20)
                    : blackTextFontBigBold.copyWith(fontSize: 20, ),
                systemOverlayStyle:const SystemUiOverlayStyle(
                    statusBarColor: mainColor,
                    statusBarIconBrightness:Brightness.light,),
                title: Row(
                  children: [
                    if (isArrowBack)
                      GestureDetector(
                        onTap: () {
                          if (onBack != null) {
                            onBack!();
                          }
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 30,
                          color: (backgroundColorAppBar != whiteColor)
                              ? whiteColor
                              : blackColor,
                        ),
                      ),
                    const SizedBox(
                      width: 26,
                    ),
                    Expanded(child: titleAppBar ?? const SizedBox()),
                  ],
                ),
                bottom: PreferredSize(
                    child: Container(
                      color: dividerColor,
                      height: 1.0,
                    ),
                    preferredSize: Size.fromHeight(4.0)),
                elevation: 0,
                actions: actionsAppBar,
              )
            : null,
        drawerScrimColor: Colors.transparent,
        body: RefreshIndicator(
          onRefresh: onRefresh ?? () async {},
          color: mainColor,
          child: body,
        ),
        floatingActionButton: floatingButton,
        bottomNavigationBar: bottomNavigationBar,
        drawer: drawer,
      ),
    );
  }
}
