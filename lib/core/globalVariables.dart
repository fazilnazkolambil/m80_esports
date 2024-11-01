import 'package:flutter/material.dart';
import 'package:m80_esports/core/const_page.dart';

var w;
var h;

/// TEXT STYLE
TextStyle textStyle (bool heading) {
  return TextStyle(
    color: ColorConst.textColor,
    fontSize: heading? w * 0.05 : w * 0.03,
    fontWeight: heading ? FontWeight.w600 : null,
  );
}

/// TOAST MESSAGE
toastMessage({
  required BuildContext context,
  required String label,
  required bool isSuccess,
}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(label),
    backgroundColor: isSuccess ? ColorConst.successAlert : ColorConst.errorAlert,
    duration: const Duration(seconds: 2),
    shape: const OutlineInputBorder(),
  ));
}