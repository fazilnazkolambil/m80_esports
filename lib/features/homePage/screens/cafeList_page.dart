import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:m80_esports/core/const_page.dart';
import 'package:m80_esports/features/homePage/screens/bottom_nav.dart';
import 'package:http/http.dart' as http;

import '../../../core/globalVariables.dart';

class CafeList extends StatefulWidget {
  const CafeList({super.key});
  @override
  State<CafeList> createState() => _CafeListState();
}

class _CafeListState extends State<CafeList> {
  List images = [
    'assets/images/GC 1.jpg',
    'assets/images/GC 2.jpg',
    'assets/images/GC 3.jpg'
  ];

  Future<void> getOrganisations() async {
    final url = '$api/listOrganisations';
    final headers = {
      'Content-Type': 'application/json',
      'x-api-key': apiKey,
    };

    final body = jsonEncode({"command": "listOrganisations", "next_token": ""});

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('Organisations List: ${response.body}');
      } else {
        print(
            'Failed to retrieve organisations: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      print('Error during API call: $error');
    }
  }

  @override
  void initState() {
    getOrganisations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return bgAnime(
        widget: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.backgroundColor,
        leading: SizedBox(),
        title: Text('Select Cafe', style: textStyle(true)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return Image(image: AssetImage(images[index]));
              },
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  enableInfiniteScroll: true)),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: gamingCafe.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    cafe.clear();
                    setState(() {
                      selectedCafe = gamingCafe[index].keys.first;
                      cafe.add(gamingCafe[index]);
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavBar()));
                  },
                  child: Container(
                    height: h * 0.15,
                    width: w,
                    margin: EdgeInsets.all(w * 0.05),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(w * 0.05),
                        boxShadow: [
                          BoxShadow(
                            color: ColorConst.successAlert.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ]),
                    child: Center(
                        child: Text(
                      gamingCafe[index].keys.first,
                      style: textStyle(false),
                    )),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
