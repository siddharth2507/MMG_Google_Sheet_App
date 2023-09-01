import 'package:flutter/material.dart';

class DecorationUtils {
  BuildContext context;

  DecorationUtils(this.context);

  InputDecoration getUnderlineInputDecoration({
    String? labelText = "",
    String? hintText = "",
    bool isRequire = false,
    bool isEnable = true,
    bool isIconDisplay = true,
    final Color? bordercolor,
    final Color? hintColor,
    final Color? fillColor,
    Widget? icon,
    Widget? sufficicon,
  }) {
    return InputDecoration(
      prefixIcon: icon,
      suffixIcon: sufficicon,
      fillColor: fillColor ?? Colors.white,
      filled: true,
      isDense: true,
      errorMaxLines: 3,
      contentPadding: isIconDisplay
          ? EdgeInsets.symmetric(horizontal: 20, vertical: 15)
          : EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      labelText: labelText,
      hintText: hintText,
      counterText: "",
      labelStyle: TextStyle(
        color: Color(0xFF868687),
      ),
      hintStyle: TextStyle(color: hintColor ?? Color(0xFF868687)),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: bordercolor ?? Colors.white, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: bordercolor ?? Colors.white, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: bordercolor ?? Colors.white, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: Color(0xFFFF0000), width: 1),
      ),
      errorStyle: TextStyle(
        letterSpacing: .5,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: Color(0xFFFF0000), width: 0.0),
      ),
    );
  }
}
