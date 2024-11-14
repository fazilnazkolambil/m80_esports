import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m80_esports/core/const_page.dart';
import 'package:m80_esports/features/homePage/screens/cafeList_page.dart';
import 'package:m80_esports/models/user_model.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/globalVariables.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController otp_controller = TextEditingController();

  bool otpPage = false;
  bool signUpPage = false;
  bool isLoading = false;
  var countryCode;
  String? selectedOrg;

  Map a = {};

  Future<void> getCurrentUserDetails() async {
    setState(() {
      isLoading = true;
    });
    // final url = '$api/getCurrentUserDetails';
    final url = '$api/userLogin';
    final headers = {
      'Content-Type': 'application/json',
      'x-api-key': apiKey,
    };
    final body = jsonEncode({
      // "contact_number": phoneNumberController.text,
      "contact_number": '+919487022511',
    });

    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(response.body);

    // if (response.statusCode == 200) {
    //   final responseData = jsonDecode(response.body);
    //   if (responseData['errorMessage'] ==
    //       'User With Phone Number ${phoneNumberController.text} Not Found!!') {
    //     setState(() {
    //       signUpPage = true;
    //       isLoading = false;
    //     });
    //   } else {
    //     setState(() {
    //       otpPage = true;
    //       isLoading = false;
    //     });
    //     if (responseData['Data']['Items'][0]['part_of_organisation'] == true) {
    //       organisation = UserModel.fromJson(
    //           responseData['Data']['Items'][0] as Map<String, dynamic>);
    //     } else {}
    //   }
    // } else {
    //   print(
    //       'Failed to retrieve user details: ${response.statusCode} - ${response.body}');
    // }
  }

  Future<void> sendOTP() async {
    setState(() {
      isLoading = true;
    });
    final url = '$api/UserSignUp';
    final headers = {'Content-Type': 'application/json', 'x-api-key': apiKey};
    final body = jsonEncode({
      "user_name": nameController.text,
      "contact_number": phoneNumberController.text,
      "country_code": countryCode.toString()
    });
    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        print(response.body);
        setState(() {
          otpPage = true;
          isLoading = false;
        });
      } else {
        toastMessage(
            context: context, label: 'SignUp failed!', isSuccess: false);
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  Future<void> verifyOTP() async {
    setState(() {
      isLoading = true;
    });
    final url = '$api/listOrganisations';
    final headers = {
      'Content-Type': 'application/json',
      'x-api-key': apiKey,
    };

    final body = jsonEncode({"command": "listOrganisations", "next_token": ""});

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    backgroundColor: ColorConst.backgroundColor,
                    title: Text(
                      'Select an Organisation',
                      style: textStyle(true),
                    ),
                    content: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorConst.textColor),
                          borderRadius: BorderRadius.circular(w * 0.03)),
                      width: w * 0.7,
                      child: DropdownButton(
                        dropdownColor: ColorConst.secondaryColor,
                        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                        hint: Text("Available Organisations",
                            style: textStyle(false)),
                        icon: Icon(
                          CupertinoIcons.chevron_down,
                          size: w * 0.04,
                        ),
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: textStyle(false),
                        value: selectedOrg,
                        items: gamingCafe.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem.keys.first,
                            child: Text(valueItem.keys.first),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {});
                        },
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel')),
                      TextButton(
                          onPressed: () async {
                            if (selectedOrg == null) {
                              toastMessage(
                                  context: context,
                                  label: 'Please select a cafe!',
                                  isSuccess: false);
                            } else {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool('isLoggedIn', true);
                              toastMessage(
                                  context: context,
                                  label: 'Logged in Successfully!',
                                  isSuccess: true);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CafeList()));
                            }
                          },
                          child: const Text('Ok')),
                    ],
                  );
                },
              );
            });
      } else {
        setState(() {
          isLoading = false;
        });
        toastMessage(
            context: context, label: 'Something went wrong', isSuccess: false);
      }
    } catch (error) {
      print('Error during API call: $error');
    }
  }

  Future<void> getOrganisations() async {}

  @override
  Widget build(BuildContext context) {
    final phoneValidation = RegExp(r"[0-9]{10}");
    return bgAnime(
      widget: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.1),
                Center(
                    child: Image(
                        image: const AssetImage(ImageConst.logo),
                        height: h * 0.3)),
                SizedBox(height: h * 0.03),
                Text(
                    signUpPage
                        ? 'Create an account'
                        : otpPage
                            ? 'Enter the OTP'
                            : 'Login with Mobile number',
                    style: textStyle(false)),
                SizedBox(height: h * 0.03),
                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  readOnly: signUpPage || otpPage ? true : false,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  validator: (value) {
                    if (!phoneValidation.hasMatch(value!)) {
                      return 'Enter a valid Phone number';
                    } else {
                      return null;
                    }
                  },
                  maxLength: 10,
                  style: textStyle(false),
                  decoration: InputDecoration(
                    counterText: '',
                    prefixIcon: CountryCodePicker(
                      initialSelection: "+91",
                      onInit: (value) {
                        countryCode = value;
                      },
                      onChanged: (value) {
                        countryCode = value;
                        print(countryCode);
                      },
                      hideMainText: false,
                      showFlag: false,
                      barrierColor: Colors.black.withOpacity(0),
                      textStyle: textStyle(false),
                    ),
                    hintText: 'Enter your Mobile number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        borderSide:
                            const BorderSide(color: ColorConst.textColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        borderSide:
                            const BorderSide(color: ColorConst.textColor)),
                  ),
                ),
                SizedBox(height: h * 0.03),

                /// CHECK USER BUTTON
                if (signUpPage == false && otpPage == false)
                  isLoading
                      ? CircularProgressIndicator(color: ColorConst.textColor)
                      : GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              if (countryCode == null) {
                                toastMessage(
                                    context: context,
                                    label: 'Please select your country code!',
                                    isSuccess: false);
                              } else if (phoneNumberController.text.isEmpty) {
                                toastMessage(
                                    context: context,
                                    label: 'Please enter your Mobile number!',
                                    isSuccess: false);
                              } else {
                                getCurrentUserDetails();
                              }
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
                signUpPage
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.emailAddress,
                            style: textStyle(false),
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
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
                          SizedBox(height: h * 0.02),
                          otpPage
                              ? FractionallySizedBox(
                                  child: Pinput(
                                  controller: otp_controller,
                                  length: 4,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                ))
                              : const SizedBox(),
                          SizedBox(height: h * 0.02),

                          /// SIGNUP BUTTON
                          isLoading
                              ? CircularProgressIndicator(
                                  color: ColorConst.textColor)
                              : otpPage
                                  ? GestureDetector(
                                      onTap: () async {
                                        if (otp_controller.text.isEmpty) {
                                          toastMessage(
                                              context: context,
                                              label: 'Enter the OTP',
                                              isSuccess: false);
                                        } else {
                                          verifyOTP();
                                        }
                                      },
                                      child: Container(
                                          width: w * 0.3,
                                          height: h * 0.05,
                                          decoration: BoxDecoration(
                                              color: ColorConst.buttons,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      w * 0.1)),
                                          child: Center(
                                              child: Text('Verify',
                                                  style: textStyle(false)))),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        if (nameController.text.isEmpty) {
                                          toastMessage(
                                              context: context,
                                              label: 'Please enter your Name!',
                                              isSuccess: false);
                                        } else {
                                          sendOTP();
                                        }
                                      },
                                      child: Container(
                                          width: w * 0.3,
                                          height: h * 0.05,
                                          decoration: BoxDecoration(
                                              color: ColorConst.buttons,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      w * 0.1)),
                                          child: Center(
                                              child: Text('Send OTP',
                                                  style: textStyle(false)))),
                                    )
                        ],
                      )
                    : otpPage
                        ? FractionallySizedBox(
                            child: Pinput(
                            controller: otp_controller,
                            length: 4,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          ))
                        : const SizedBox(),
                SizedBox(height: h * 0.03),

                /// LOGIN BUTTON
                if (otpPage == true && signUpPage == false)
                  isLoading
                      ? CircularProgressIndicator(
                          color: ColorConst.textColor,
                        )
                      : GestureDetector(
                          onTap: () async {
                            if (otp_controller.text.isEmpty) {
                              toastMessage(
                                  context: context,
                                  label: 'Enter the OTP',
                                  isSuccess: false);
                            } else {
                              verifyOTP();
                            }
                          },
                          child: Container(
                              width: w * 0.3,
                              height: h * 0.05,
                              decoration: BoxDecoration(
                                  color: ColorConst.buttons,
                                  borderRadius: BorderRadius.circular(w * 0.1)),
                              child: Center(
                                  child:
                                      Text('Verify', style: textStyle(false)))),
                        ),
                SizedBox(
                  height: h * 0.03,
                ),
                if (otpPage == true || signUpPage == true)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        otpPage = false;
                        signUpPage = false;
                        nameController.clear();
                        otp_controller.clear();
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.back,
                          color: ColorConst.textColor,
                        ),
                        SizedBox(
                          width: w * 0.03,
                        ),
                        Text('Go back', style: textStyle(false))
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
