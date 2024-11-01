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
  List gamingSetups = [
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
  ];
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: false,
            backgroundColor: ColorConst.buttons,
            stretch: true,
            centerTitle: true,
            expandedHeight: h * 0.2,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Gaming Setups',style: textStyle(true)),
              centerTitle: true,
              titlePadding: EdgeInsets.only(bottom: h * 0.1),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.all(w * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: h * 0.5,
                    child: ListView.separated(
                        itemCount: gamingSetups.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => ContentPage(content: gamingSetups[index]))),
                            child: Container(
                              height: h * 0.07,
                              width: w * 1,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    ColorConst.buttons,
                                    ColorConst.buttons.withOpacity(0.5)
                                  ]),
                                  borderRadius: BorderRadius.circular(w * 0.03)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(),
                                  Text(gamingSetups[index].keys.first,style: textStyle(false)),
                                  const Icon(CupertinoIcons.right_chevron,color: ColorConst.textColor,)
                                ],),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(height: h * 0.02),

                    ),
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