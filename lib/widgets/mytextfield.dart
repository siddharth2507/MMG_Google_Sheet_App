import 'package:flutter/material.dart';
import 'package:flutter_google_sheet_example/widgets/colors_utils.dart';
import 'package:flutter_google_sheet_example/widgets/decorationutils.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool isEnable;
  final bool isRequire;
  final bool isReadOnly;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool isIconDisplay;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;
  final ValueChanged? onChanged;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmited;
  final TextInputType? textInputType;
  final int? minLines;
  final int maxLines;
  final FontWeight? fontWeight;
  final int? maxLength;
  final GestureTapCallback? onTap;
  final Widget? icone;
  final Widget? sufficicon;
  final Color? textColor;
  final Color? hintColor;
  final Color? fillColor;
  final Color? bordercolor;

  const MyTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.sufficicon,
    this.textColor,
    this.hintColor,
    this.fillColor,
    this.bordercolor,
    this.isEnable = true,
    this.isRequire = false,
    this.isReadOnly = false,
    this.isIconDisplay = true,
    this.keyboardType,
    this.textInputAction,
    this.onSubmited,
    this.textInputType = TextInputType.text,
    this.minLines,
    this.maxLines = 1,
    this.fontWeight,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.onTap,
    this.icone,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: isEnable,
      obscureText: obscureText,
      readOnly: isReadOnly,
      style: TextStyle(
        color: textColor ?? primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 15,
        letterSpacing: .0,
      ),
      textInputAction: textInputAction,
      keyboardType: textInputType,
      textCapitalization: TextCapitalization.sentences,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: DecorationUtils(context).getUnderlineInputDecoration(
          icon: icone,
          hintColor: hintColor,
          labelText: labelText,
          hintText: hintText,
          bordercolor: bordercolor,
          isRequire: isRequire,
          isEnable: isEnable,
          fillColor: fillColor,
          sufficicon: sufficicon,
          isIconDisplay: isIconDisplay),
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onSubmited,
    );
  }
}
