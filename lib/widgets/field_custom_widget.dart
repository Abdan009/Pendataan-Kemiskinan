part of 'widgets.dart';

class FieldCustomWidget extends StatefulWidget {
  final String? title, hint, subTitle;
  final bool obscureText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final double height;
  final double? width;
  final int? maxLine, maxLength;
  final List<TextInputFormatter>? inputFormater;
  final TextInputType? typeKeyboard;
  final TextAlign? align;
  final bool isCurrency, isShadow;
  final TextStyle? style;
  final TextStyle? styleHint, styleTitle;
  final String? Function(String?)? validator;
  final String? errorText, prefixText;

  final Function(String)? onChange;
  final Color? primaryColor;
  final Widget? suffixIcon;
  final bool enabled;
  final Widget? descSelectionInput;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;
  final BoxDecoration? boxDecoration;
  final Function(String)? onFieldSubmitted;

  const FieldCustomWidget({
    Key? key,
    this.title,
    this.subTitle,
    required this.hint,
    required this.controller,
    this.height = 50,
    this.width,
    this.obscureText = false,
    this.prefixIcon,
    this.maxLine = 1,
    this.inputFormater,
    this.typeKeyboard,
    this.align,
    this.isCurrency = false,
    this.style,
    this.onChange,
    this.primaryColor,
    this.suffixIcon,
    this.enabled = true,
    this.descSelectionInput,
    this.textInputAction,
    this.backgroundColor,
    this.boxDecoration,
    this.onFieldSubmitted,
    this.styleHint,
    this.styleTitle,
    this.maxLength,
    this.isShadow = true,
    this.validator,
    this.errorText,
    this.prefixText,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FieldCustomWidgetState createState() => _FieldCustomWidgetState();
  static bool validateStructurePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}

class _FieldCustomWidgetState extends State<FieldCustomWidget> {
  bool? isObscureText;

  @override
  void initState() {
    super.initState();
    isObscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: widget.primaryColor ?? mainColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (widget.title != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title!,
                  style: widget.styleTitle ??
                      blackTextFont.copyWith(
                        color: Color(0xFF666666),
                      ),
                ),
                if (widget.subTitle != null)
                  Text(
                    widget.subTitle!,
                    style: greyTextFont,
                  ),
              ],
            ),
          if (widget.title != null) const SizedBox(height: 5.0),
          Container(
            alignment: Alignment.topLeft,
            // height:
            //     (widget.errorText != null) ? widget.height + 10 : widget.height,
            width: widget.width,
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.prefixIcon != null)
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: widget.prefixIcon,
                  ),
                Expanded(
                  child: Center(
                    child: TextFormField(
                      controller: widget.controller,

                      textInputAction: widget.textInputAction,

                      maxLength:
                          (widget.maxLength != null) ? widget.maxLength : null,
                      style: widget.style ?? blackTextFontTitle,
                      obscureText: isObscureText!,
                      textAlign: widget.align ?? TextAlign.start,
                      cursorColor: mainColor,
                      enabled: widget.enabled,
                      onChanged: widget.onChange,
                      cursorHeight: 20,
                      showCursor: true,
                      // autofocus: true,
                      maxLines: widget.maxLine,
                      validator: widget.validator,
                      textAlignVertical: TextAlignVertical.bottom,
                      onFieldSubmitted: widget.onFieldSubmitted,

                      keyboardType: !widget.isCurrency
                          ? ((widget.typeKeyboard == null)
                              ? (widget.maxLine! > 1)
                                  ? TextInputType.multiline
                                  : TextInputType.text
                              : widget.typeKeyboard)
                          : const TextInputType.numberWithOptions(),
                      inputFormatters: ((widget.inputFormater != null)
                          ? widget.inputFormater
                          : null),
                      decoration: InputDecoration(
                        isDense: true,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: mainColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: mainColor),
                        ),
                        hintText: widget.hint,
                        errorText: widget.errorText,
                        hintStyle: widget.styleHint ?? greyTextFontTitle,
                        errorStyle: redTextFont,
                        // prefixText: widget.prefixText,
                        prefixStyle: blackTextFontTitle,
                        prefixIcon: (widget.prefixText != null)
                            ? Text(
                                widget.prefixText!,
                                style: blackTextFontTitle,
                              )
                            : null,
                        prefixIconConstraints: BoxConstraints(),
                      ),
                    ),
                  ),
                ),
                if (widget.suffixIcon != null || widget.obscureText)
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: (widget.suffixIcon != null)
                        ? widget.suffixIcon
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText!;
                              });
                            },
                            child: Icon(
                              !isObscureText!
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: greyColor,
                            ),
                          ),
                  ),
              ],
            ),
          ),
          if (widget.descSelectionInput != null)
            Container(
              margin: const EdgeInsets.only(
                top: 5,
              ),
              child: widget.descSelectionInput,
            ),
        ],
      ),
    );
  }
}
