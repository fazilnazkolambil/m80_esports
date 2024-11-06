
import 'package:flutter/material.dart';
import 'package:m80_esports/core/const_page.dart';
import 'package:m80_esports/features/authPage/screens/login_page.dart';
import 'package:m80_esports/features/homePage/screens/home_page.dart';

import '../../core/globalVariables.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State <SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State <SplashScreen> {
  bool isLoggedIn = false;
  String? selectedCafe;
  List cafe = [];
  // getDate () async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //   selectedCafe = prefs.getString('selectedCafe');
  //   String? jsonString = prefs.getString('cafe');
  //   cafe = jsonDecode(jsonString!);
  //   setState(() {
  //
  //   });
  // }
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 2))
        .then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => isLoggedIn
        ? HomePage(cafe: cafe, selectedCafe: selectedCafe.toString())
        : const LoginPage())));
    super.initState();
  }
  @override
  Widget build (BuildContext context){
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage(ImageConst.logo),height: h *0.3,),
            const CircularProgressIndicator(color: ColorConst.textColor,)
          ],
        ),
      ),
    );
  }
}