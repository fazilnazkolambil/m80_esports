import 'package:flutter/material.dart';
import 'package:m80_esports/core/const_page.dart';
import 'package:m80_esports/features/homePage/screens/home_page.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'core/globalVariables.dart';
import 'features/authPage/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: ColorConst.backgroundColor,
          // textTheme:  GoogleFonts.orbitronTextTheme(),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}


