// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:m80_esports/core/const_page.dart';
// import 'package:m80_esports/features/homePage/screens/price_list.dart';
// import 'package:m80_esports/features/homePage/screens/qr_page.dart';
//
// import 'home_page.dart';
//
// void main() => runApp(MaterialApp(home: BottomNavBar()));
//
// class BottomNavBar extends StatefulWidget {
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//     List <Widget> pages = const [
//     QrPage(),
//     HomePage(),
//     PriceList()
//   ];
//   int _page = 1;
//   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: CurvedNavigationBar(
//           key: _bottomNavigationKey,
//           index: 0,
//           items: <Widget>[
//             Icon(Icons.qr_code_2_outlined, size: 30,color: ColorConst.textColor,),
//             Icon(CupertinoIcons.home, size: 30,color: ColorConst.textColor),
//             Icon(Icons.list_alt, size: 30,color: ColorConst.textColor),
//           ],
//           color: ColorConst.backgroundColor,
//           buttonBackgroundColor: ColorConst.secondaryColor,
//           backgroundColor: Colors.white,
//           animationCurve: Curves.easeInOut,
//           animationDuration: Duration(milliseconds: 500),
//           onTap: (index) {
//             setState(() {
//               _page = index;
//             });
//           },
//           letIndexChange: (index) => true,
//         ),
//         body: pages[_page]
//     );
//   }
// }




import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m80_esports/core/const_page.dart';
import 'package:m80_esports/features/homePage/screens/home_page.dart';
import 'package:m80_esports/features/homePage/screens/price_list.dart';
import 'package:m80_esports/features/homePage/screens/qr_page.dart';

import '../../../core/globalVariables.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomNavBar> {
  final _pageController = PageController(initialPage: 1);
  final NotchBottomBarController _controller = NotchBottomBarController(index: 1);

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      QrPage(),
      HomePage(),
      PriceList()
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        color: ColorConst.backgroundColor,
        showLabel: true,
        textOverflow: TextOverflow.visible,
        maxLine: 1,
        shadowElevation: 5,
        kBottomRadius: 28.0,
        notchColor: ColorConst.buttons,
        removeMargins: false,
        bottomBarWidth: w * 0.5,
        showShadow: false,
        durationInMilliSeconds: 300,
        itemLabelStyle: textStyle(false),
        elevation: 1,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.qr_code_2_outlined,
              color: ColorConst.textColor,
            ),
            activeItem: Icon(
              Icons.qr_code_2_outlined,
              color: ColorConst.textColor,
            ),
            itemLabel: 'QR Code',
          ),
          BottomBarItem(
            inActiveItem: Icon(CupertinoIcons.home, color: ColorConst.textColor),
            activeItem: Icon(CupertinoIcons.home, color: ColorConst.textColor),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.list_alt,
              color: ColorConst.textColor,
            ),
            activeItem: Icon(
              Icons.list_alt,
              color: ColorConst.textColor,
            ),
            itemLabel: 'Price List',
          ),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        kIconSize: 24.0,
      )
          : null,
    );
  }
}
