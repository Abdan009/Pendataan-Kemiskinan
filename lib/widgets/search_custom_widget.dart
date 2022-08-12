part of 'widgets.dart';

class SearchCustomWidget extends StatefulWidget {
  const SearchCustomWidget({
    Key? key,
    required this.controller,

    this.hint ="Apa yang anda cari?" , 
    this.isShadow=true,
    this.backgroundColor=whiteColor,
    this.height =45,
    this.onSubmitted,
    this.onTapSendIcon,

  }) : super(key: key);

  final TextEditingController? controller;
  final String hint;
  final bool isShadow;
  final Color backgroundColor;
  final double height;
  final Function(String)? onSubmitted;
  final Function()? onTapSendIcon;
  @override
  State<SearchCustomWidget> createState() => _SearchCustomWidgetState();
}

class _SearchCustomWidgetState extends State<SearchCustomWidget> {
  bool isValue = false;
  @override
  Widget build(BuildContext context) {
    return  FieldCustomWidget(
        height: widget.height,
        hint: widget.hint,
        controller: widget.controller,
        backgroundColor:widget.backgroundColor,
        isShadow: widget.isShadow,
        onFieldSubmitted: widget.onSubmitted,
        onChange: (value){
          setState(() {
            isValue = (value.trim().isNotEmpty);
          });
        },
        prefixIcon: const Icon(
          Icons.search,
          color: greyColor,
        ),
        suffixIcon: (isValue)?  InkWell(
          onTap: (widget.onTapSendIcon==null)?(){}:widget.onTapSendIcon,
          child: const Icon(Icons.send, color: mainColor,),
        ):null,
      );
  }
}