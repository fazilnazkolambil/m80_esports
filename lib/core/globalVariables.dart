import 'package:flutter/cupertino.dart';
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