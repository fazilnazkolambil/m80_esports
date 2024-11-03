import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m80_esports/core/const_page.dart';
import 'package:m80_esports/core/globalVariables.dart';
import 'package:m80_esports/features/homePage/screens/content_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State <HomePage> createState () => _HomePageState();
}
class _HomePageState extends State <HomePage>{
  String? selectedCafe;
  List cafe = [];
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
      ]
    }
  ];

  @override
  Widget build (BuildContext context){

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            backgroundColor: ColorConst.backgroundColor,
            stretch: true,
            centerTitle: true,
            expandedHeight: h * 0.1,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(child: Text('Gaming Setups',style: textStyle(true))),
            ),
          ),
          SliverAppBar(
            floating: false,
            pinned: true,
            backgroundColor: ColorConst.backgroundColor,
            stretch: true,
            centerTitle: true,
            expandedHeight: h * 0.05,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConst.secondaryColor),
                      borderRadius: BorderRadius.circular(w * 0.03)
                  ),
                  width: w * 0.7,
                  child: DropdownButton(
                    dropdownColor: ColorConst.secondaryColor,
                    padding: EdgeInsets.symmetric(horizontal : w * 0.03),
                    hint: Text("Select Cafe",style: textStyle(false)),
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
                selectedCafe != null
                    ? TextButton(
                    onPressed: () {
                      selectedCafe = null;
                      setState(() {

                      });
                    },
                    child: const Text('Clear',style: TextStyle(
                        color: ColorConst.buttons,
                        fontWeight: FontWeight.w600
                    ))
                )
                    : const SizedBox()
              ],
            ),

          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.all(w * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selectedCafe != null
                      ? Expanded(
                    child: ListView.separated(
                        itemCount: cafe[0][selectedCafe].length,
                        itemBuilder: (context, index) {
                         return InkWell(
                            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => ContentPage(content: cafe[0][selectedCafe][index]))),
                            child: Container(
                              height: h * 0.07,
                              width: w * 1,
                              padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorConst.secondaryColor),
                                  // gradient: LinearGradient(colors: [
                                  //   ColorConst.buttons,
                                  //   ColorConst.buttons.withOpacity(0.5)
                                  // ]),
                                color: ColorConst.backgroundColor,
                                  borderRadius: BorderRadius.circular(w * 0.03),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 10,
                                    spreadRadius: 4,
                                    offset: const Offset(0, 4)
                                  )
                                ]
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(),
                                  Text(cafe[0][selectedCafe][index].keys.first,style: textStyle(false)),
                                  Icon(CupertinoIcons.right_chevron,color: ColorConst.textColor,size: w * 0.04,)
                                ],),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(height: h * 0.02),

                    ),
                  )
                      : Center(child:Text('No cafe selected!',style: textStyle(false)))
                ],
              ),
            ),
          )
          ],
      )
    );
  }
}