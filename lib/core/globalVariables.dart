import 'package:flutter/material.dart';
import 'package:m80_esports/core/const_page.dart';

String version = '1.0.0';
var w;
var h;

/// TEXT STYLE
TextStyle textStyle (bool heading) {
  return TextStyle(
    color: ColorConst.textColor,
    fontSize: heading? w * 0.04 : w * 0.03,
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
          {'name' : 'PC 1', 'price' : 120, 'status' : false},
          {'name' : 'PC 2', 'price' : 120, 'status' : true},
          {'name' : 'PC 3', 'price' : 120, 'status' : false},
          {'name' : 'PC 4', 'price' : 120, 'status' : false},
          {'name' : 'PC 5', 'price' : 120, 'status' : false},
          {'name' : 'PC 6', 'price' : 120, 'status' : false},
          {'name' : 'PC 7', 'price' : 120, 'status' : false},
          {'name' : 'PC 8', 'price' : 120, 'status' : false},
          {'name' : 'PC 9', 'price' : 120, 'status' : false},
          {'name' : 'PC 10', 'price' : 120, 'status' : false},
        ]
      },
      {
        'PS5' : [
          {
            'name' : 'Projector',
            'price' : 200, 'status' : false
          },
          {
            'name' : 'TV',
            'price' : 180, 'status' : false
          },
        ]
      },
      {
        'Racing Simulator' : [
          {
            'name' : 'Simulator 1',
            'price' : 180, 'status' : false
          },
          {
            'name' : 'Simulator 2',
            'price' : 180, 'status' : false
          },
        ]
      },
    ]
  },
  {
    'Bell Road' : [
      {
        'PC Gaming' : [
          {'name' : 'PC 1', 'price' : 120, 'status' : false},
          {'name' : 'PC 2', 'price' : 120, 'status' : false},
          {'name' : 'PC 3', 'price' : 120, 'status' : false},
          {'name' : 'PC 4', 'price' : 120, 'status' : false},
          {'name' : 'PC 5', 'price' : 120, 'status' : false},
          {'name' : 'PC 6', 'price' : 120, 'status' : false},
          {'name' : 'PC 7', 'price' : 120, 'status' : false},
          {'name' : 'PC 8', 'price' : 120, 'status' : false},
          {'name' : 'PC 9', 'price' : 120, 'status' : false},
          {'name' : 'PC 10', 'price' : 120, 'status' : false},
          {'name' : 'PC 11', 'price' : 120, 'status' : false},
          {'name' : 'PC 12', 'price' : 120, 'status' : false},
        ]
      },
      {
        'PS5' : [
          {'name' : 'Projector', 'price' : 200, 'status' : false},
          {'name' : 'TV 1', 'price' : 180, 'status' : false},
          {'name' : 'TV 2', 'price' : 180, 'status' : false},
        ]
      },
      {
        'Racing Simulator' : [
          {'name' : 'Simulator 1', 'price' : 180, 'status' : false},
          {'name' : 'Simulator 2', 'price' : 180, 'status' : false},
        ]
      },
      {
        'VR' : [
          {'name' : 'VR', 'price' : 180, 'status' : false},
        ]
      },
    ]
  }
];