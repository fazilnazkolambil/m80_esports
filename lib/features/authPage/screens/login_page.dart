import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m80_esports/core/const_page.dart';
import 'package:m80_esports/features/authPage/screens/signUp_page.dart';
import 'package:m80_esports/features/homePage/screens/home_page.dart';
import 'package:pinput/pinput.dart';
import '../../../core/globalVariables.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumberController = TextEditingController();

  bool otpPage = false;
  String? selectedCafe;
  List cafe = [];

  loginIn (BuildContext context) {
    if(phoneNumberController.text.isEmpty){
      toastMessage(context: context, label: 'Enter Phone Number!', isSuccess: false);
    }else if(phoneNumberController.text != '0123456789'){
      toastMessage(context: context, label: 'No user found!', isSuccess: false);
    } else {
      setState(() {
        otpPage = true;
      });
    }
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
            backgroundColor: ColorConst.secondaryColor ,
            stretch: true,
            centerTitle: true,
            expandedHeight: h * 0.2,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Welcome to M80 Esports',style: textStyle(false)),
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
                  Center(child: Image(image: const AssetImage(ImageConst.logo),height: h * 0.3)),
                  SizedBox(height: h * 0.03),
                  Text('Login with Mobile number',style: textStyle(false)),
                  SizedBox(height: h * 0.03),
                  otpPage
                  ? const FractionallySizedBox(
                    child: Pinput(
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  )
                  : TextFormField(
                    controller : phoneNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    maxLength: 10,
                    style: textStyle(false),
                    decoration: InputDecoration(
                      counterText: '',
                      prefix: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: w * 0.03),
                        child: Text('+91',style: textStyle(false)),
                      ),
                      hintText: 'Enter your Mobile number',
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
                  ),
                  SizedBox(height: h * 0.03),
                  InkWell(
                    onTap: () {
                      if(otpPage == false){
                        loginIn(context);
                      } else {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    backgroundColor: ColorConst.backgroundColor,
                                    title: Text('Select a cafe',style: textStyle(true),),
                                    content: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: ColorConst.secondaryColor),
                                          borderRadius: BorderRadius.circular(w * 0.03)
                                      ),
                                      width: w * 0.7,
                                      child: DropdownButton(
                                        dropdownColor: ColorConst.secondaryColor,
                                        padding: EdgeInsets.symmetric(horizontal : w * 0.03),
                                        hint: Text("Available Cafes",style: textStyle(false)),
                                        icon: Icon(CupertinoIcons.chevron_down,size: w * 0.04,),
                                        isExpanded: true,
                                        underline: const SizedBox(),
                                        style: textStyle(false),
                                        value: selectedCafe,
                                        items: gamingCafe.map((valueItem){
                                          return DropdownMenuItem(
                                            value: valueItem.keys.first,
                                            child: Text(valueItem.keys.first),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            cafe = [];
                                            selectedCafe = newValue.toString();
                                            selectedCafe == gamingCafe[0].keys.first
                                                ? cafe.add(gamingCafe[0]) : cafe.add(gamingCafe[1]);
                                          });
                                        },
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: const Text('Cancel')
                                      ),
                                      TextButton(
                                          onPressed: () async {
                                            if(selectedCafe == null){
                                              toastMessage(
                                                  context: context,
                                                  label: 'Please select a cafe!',
                                                  isSuccess: false);
                                            } else {
                                              // SharedPreferences prefs = await SharedPreferences.getInstance();
                                              // prefs.setBool('isLoggedIn', true);
                                              // prefs.setString('selectedCafe', selectedCafe.toString());
                                              // String jsonString = jsonEncode(cafe);
                                              // prefs.setString('cafe', jsonString);
                                              toastMessage(context: context, label: 'Logged in Successfully!', isSuccess: true);
                                              Navigator.push(context, MaterialPageRoute(
                                                  builder: (context) => HomePage(
                                                    cafe: cafe,
                                                    selectedCafe: selectedCafe.toString(),
                                                  )));
                                            }
                                          },
                                          child: const Text('Ok')
                                      ),
                                    ],
                                  );
                                },
                              );
                            },);

                      }
                    },
                    child: Container(
                      width: w * 0.3,
                        height: h * 0.05,
                        decoration: BoxDecoration(
                          color: ColorConst.buttons,
                          borderRadius: BorderRadius.circular(w * 0.1)
                        ),
                        child: Center(child:Text(otpPage ? 'Verify':'Send OTP',style: textStyle(false)))
                    ),
                  ),
                  const SizedBox(height: 20,),
                  otpPage
                  ? GestureDetector(
                    onTap: () {
                      setState(() {
                        otpPage = false;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.back,color: ColorConst.textColor,size: w * 0.04),
                        const SizedBox(width: 10),
                        Text('Go back',style: textStyle(false)),
                      ],
                    ),
                  )
                  : const SizedBox(),
                  SizedBox(height: h * 0.15),
                  const Divider(),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('New to this app?',style: TextStyle(
                       color: ColorConst.textColor,
                      )),
                      InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SignUpPage())),
                        child: const Text('Sign Up',style:TextStyle(
                          color: ColorConst.buttons,
                          fontWeight: FontWeight.w600
                        )))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
