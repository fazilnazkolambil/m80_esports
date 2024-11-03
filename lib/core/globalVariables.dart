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

/// GAMING CAFE
List gamingCafe = [
  {
    'Vidhyaranyapura' : [
      {
        'PC Gaming' : [
          {'name' : 'PC 1', 'price' : 120},
          {'name' : 'PC 2', 'price' : 120},
          {'name' : 'PC 3', 'price' : 120},
          {'name' : 'PC 4', 'price' : 120},
          {'name' : 'PC 5', 'price' : 120},
          {'name' : 'PC 6', 'price' : 120},
          {'name' : 'PC 7', 'price' : 120},
          {'name' : 'PC 8', 'price' : 120},
          {'name' : 'PC 9', 'price' : 120},
          {'name' : 'PC 10', 'price' : 120},
        ]
      },
      {
        'PS5' : [
          {
            'name' : 'Projector',
            'price' : 200
          },
          {
            'name' : 'TV',
            'price' : 180
          },
        ]
      },
      {
        'Racing Simulator' : [
          {
            'name' : 'Simulator 1',
            'price' : 180
          },
          {
            'name' : 'Simulator 2',
            'price' : 180
          },
        ]
      },
    ]
  },
  {
    'Bell Road' : [
      {
        'PC' : [
          {'name' : 'PC 1', 'price' : 120},
          {'name' : 'PC 2', 'price' : 120},
          {'name' : 'PC 3', 'price' : 120},
          {'name' : 'PC 4', 'price' : 120},
          {'name' : 'PC 5', 'price' : 120},
          {'name' : 'PC 6', 'price' : 120},
          {'name' : 'PC 7', 'price' : 120},
          {'name' : 'PC 8', 'price' : 120},
          {'name' : 'PC 9', 'price' : 120},
          {'name' : 'PC 10', 'price' : 120},
          {'name' : 'PC 11', 'price' : 120},
          {'name' : 'PC 12', 'price' : 120},
        ]
      },
      {
        'PS5' : [
          {'name' : 'Projector', 'price' : 200},
          {'name' : 'TV 1', 'price' : 180},
          {'name' : 'TV 2', 'price' : 180},
        ]
      },
      {
        'Racing Simulator' : [
          {'name' : 'Simulator 1', 'price' : 180},
          {'name' : 'Simulator 2', 'price' : 180},
        ]
      },
      {
        'VR' : [
          {'name' : 'VR', 'price' : 180},
        ]
      },
    ]
  }
];