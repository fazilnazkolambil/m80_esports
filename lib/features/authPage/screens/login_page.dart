import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m80_esports/core/const_page.dart';
import 'package:m80_esports/features/homePage/screens/cafeList_page.dart';
import 'package:m80_esports/features/authPage/screens/signUp_page.dart';
import 'package:m80_esports/features/homePage/screens/home_page.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/globalVariables.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool otpPage = false;
  bool signUpPage = false;
  String? selectedCafe;
  List cafe = [];

  loginIn(BuildContext context) {
    if (phoneNumberController.text.isEmpty) {
      toastMessage(
          context: context, label: 'Enter Phone Number!', isSuccess: false);
    } else if (phoneNumberController.text != '0123456789') {
      setState(() {
        signUpPage = true;
      });
    } else {
      setState(() {
        otpPage = true;
      });
    }
  }
  // logIn(){
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CafeList()));
  // }
  signIn(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CafeList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: const SizedBox(),
          floating: false,
          pinned: false,
          backgroundColor: ColorConst.backgroundColor,
          stretch: true,
          centerTitle: true,
          expandedHeight: h * 0.2,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Welcome to M80 Esports', style: textStyle(false)),
            centerTitle: true,
            titlePadding: EdgeInsets.only(bottom: h * 0.1),
          ),
        ),
        SliverFillRemaining(
          fillOverscroll: true,
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.all(w * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image(
                        image: const AssetImage(ImageConst.logo),
                        height: h * 0.3)),
                SizedBox(height: h * 0.03),
                Text(signUpPage
                    ? 'Create an account'
                    : otpPage
                    ? 'Enter the OTP'
                    : 'Login with Mobile number', style: textStyle(false)),
                SizedBox(height: h * 0.03),
                otpPage
                    ? const FractionallySizedBox(
                        child: Pinput(
                          length: 4,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                      )
                    : TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        readOnly: signUpPage ? true : false,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        maxLength: 10,
                        style: textStyle(false),
                        decoration: InputDecoration(
                          counterText: '',
                          prefix: Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                            child: Text('+91', style: textStyle(false)),
                          ),
                          hintText: 'Enter your Mobile number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.03),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w * 0.03),
                              borderSide: const BorderSide(
                                  color: ColorConst.textColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w * 0.03),
                              borderSide: const BorderSide(
                                  color: ColorConst.textColor)),
                        ),
                      ),
                SizedBox(height: h * 0.01),
                signUpPage
                ? TextFormField(
                  controller : nameController,
                  keyboardType: TextInputType.emailAddress,
                  style: textStyle(false),
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        borderSide: const BorderSide(color: ColorConst.textColor)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        borderSide: const BorderSide(color: ColorConst.textColor)
                    ),
                  ),
                )
                : const SizedBox(),
                SizedBox(height: h * 0.03),
                signUpPage
                    ? GestureDetector(
                  onTap: () {
                    if(nameController.text.isEmpty){
                      toastMessage(context: context, label: 'Please enter your Name!', isSuccess: false);
                    }else{
                      setState(() {
                        otpPage = true;
                        signUpPage = false;
                      });
                    }
                  },
                  child: Container(
                      width: w * 0.3,
                      height: h * 0.05,
                      decoration: BoxDecoration(
                          color: ColorConst.buttons,
                          borderRadius: BorderRadius.circular(w * 0.1)),
                      child: Center(
                          child: Text('Send OTP',
                              style: textStyle(false)))),
                )
                    : otpPage
                    ? GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences
                        .getInstance();
                    prefs.setBool('isLoggedIn', true);
                    toastMessage(
                        context: context,
                        label: 'Logged in Successfully!',
                        isSuccess: true);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CafeList()));
                  },
                  child: Container(
                      width: w * 0.3,
                      height: h * 0.05,
                      decoration: BoxDecoration(
                          color: ColorConst.buttons,
                          borderRadius: BorderRadius.circular(w * 0.1)),
                      child: Center(
                          child: Text('Verify',
                              style: textStyle(false)))),
                )
                    : GestureDetector(
                  onTap: () {
                    if(phoneNumberController.text.isEmpty){
                      toastMessage(context: context, label: 'Please enter your Mobile number!', isSuccess: false);
                    }else if(phoneNumberController.text != '0123456789'){
                      setState(() {
                        signUpPage = true;
                      });
                    }else{
                      setState(() {
                        otpPage = true;
                      });
                    }
                  },
                  child: Container(
                      width: w * 0.3,
                      height: h * 0.05,
                      decoration: BoxDecoration(
                          color: ColorConst.buttons,
                          borderRadius: BorderRadius.circular(w * 0.1)),
                      child: Center(
                          child: Text('Send OTP',
                              style: textStyle(false)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                otpPage || signUpPage
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            otpPage = false;
                            signUpPage = false;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.back,
                                color: ColorConst.textColor, size: w * 0.04),
                            const SizedBox(width: 10),
                            Text('Go back', style: textStyle(false)),
                          ],
                        ),
                      )
                    : const SizedBox(),
                SizedBox(height: h * 0.15),
                // const Divider(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     const Text('New to this app?',
                //         style: TextStyle(
                //           color: ColorConst.textColor,
                //         )),
                //     InkWell(
                //         onTap: () => Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const SignUpPage())),
                //         child: const Text('Sign Up',
                //             style: TextStyle(
                //                 color: ColorConst.buttons,
                //                 fontWeight: FontWeight.w600)))
                //   ],
                // ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
