import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m80_esports/core/const_page.dart';
import '../../../core/globalVariables.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: false,
            backgroundColor: ColorConst.buttons,
            // title: Text('Login',style: textStyle(true)),
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
                  TextFormField(
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
                  Container(
                    width: w * 0.3,
                      height: h * 0.05,
                      decoration: BoxDecoration(
                        color: ColorConst.buttons,
                        borderRadius: BorderRadius.circular(w * 0.1)
                      ),
                      child: Center(child:Text('Send OTP',style: textStyle(false)))
                  ),
                  SizedBox(height: h * 0.3),
                  Text('Login with social accounts',style: textStyle(false)),
                  SizedBox(height: h * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: w * 0.12,
                        width: w * 0.18,
                        padding: EdgeInsets.all(w * 0.02),
                        decoration: BoxDecoration(
                          color: ColorConst.backgroundColor,
                            borderRadius: BorderRadius.circular(w * 0.03),
                            border: Border.all(color: ColorConst.textColor)
                        ),
                        child: SvgPicture.asset(IconConst.googleLogo),
                      ),
                      Container(
                        height: w * 0.12,
                        width: w * 0.18,
                        padding: EdgeInsets.all(w * 0.02),
                        decoration: BoxDecoration(
                          color: ColorConst.backgroundColor,
                            borderRadius: BorderRadius.circular(w * 0.03),
                            border: Border.all(color: ColorConst.textColor)
                        ),
                        child: SvgPicture.asset(IconConst.facebookLogo),
                      ),
                      Container(
                        height: w * 0.12,
                        width: w * 0.18,
                        padding: EdgeInsets.all(w * 0.02),
                        decoration: BoxDecoration(
                          color: ColorConst.backgroundColor,
                            borderRadius: BorderRadius.circular(w * 0.03),
                            border: Border.all(color: ColorConst.textColor)
                        ),
                        child: SvgPicture.asset(IconConst.appleLogo,color: Colors.white,),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
