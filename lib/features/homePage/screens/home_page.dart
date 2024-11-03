import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m80_esports/core/const_page.dart';
import 'package:m80_esports/core/globalVariables.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State <HomePage> createState () => _HomePageState();
}
class _HomePageState extends State <HomePage>{

  String? selectedCafe;
  List cafe = [];


  @override
  Widget build (BuildContext context){

    return DefaultTabController(
      length: selectedCafe != null ? cafe[0][selectedCafe].length : 0,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: const SizedBox(),
              floating: false,
              pinned: false,
              backgroundColor: ColorConst.backgroundColor,
              stretch: true,
              centerTitle: true,
              expandedHeight: h * 0.05,
              flexibleSpace: FlexibleSpaceBar(
                background: Center(child: Text('Gaming Setups',style: textStyle(true))),
              ),
            ),
            SliverAppBar(
              leading: const SizedBox(),
              floating: true,
              pinned: false,
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
            selectedCafe != null ?
            SliverAppBar(
              leading: const SizedBox(),
              floating: true,
              pinned: true,
              backgroundColor: ColorConst.backgroundColor,
              expandedHeight: h * 0.05,
              bottom: TabBar(
                dividerColor: ColorConst.backgroundColor,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorPadding: const EdgeInsets.all(- 10),
                overlayColor: const WidgetStatePropertyAll(ColorConst.backgroundColor),
                indicator: BoxDecoration(
                  color: ColorConst.secondaryColor,
                  border: Border.all(color: ColorConst.textColor.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(w * 0.03)
                ),
                  tabs: List.generate(cafe[0][selectedCafe].length, (index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: Text(cafe[0][selectedCafe][index].keys.first,style: textStyle(false)),
                );
              })),
            )
                :const SliverAppBar(
              leading: SizedBox(),
              backgroundColor: ColorConst.backgroundColor,
            ),
            SliverFillRemaining(
              child: Padding(
                padding: EdgeInsets.all(w * 0.03),
                child: selectedCafe != null
                    ? Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                          children: List.generate(cafe[0][selectedCafe].length, (i) {
                            List setups = cafe[0][selectedCafe][i][cafe[0][selectedCafe][i].keys.first];
                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: h * 0.2,
                                    width: w,
                                    padding: EdgeInsets.all(w * 0.03),
                                    margin: EdgeInsets.all(w * 0.03),
                                    decoration: BoxDecoration(
                                      color: ColorConst.secondaryColor,
                                        borderRadius: BorderRadius.circular(w * 0.03),
                                        border: Border.all(color: ColorConst.textColor.withOpacity(0.5)),
                                        // gradient: LinearGradient(colors: [
                                        //   ColorConst.buttons,
                                        //   ColorConst.secondaryColor
                                        // ])
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(image: AssetImage(ImageConst.logo),width: w * 0.3),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(setups[index]['name'],style: textStyle(true)),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  height: h * 0.035,
                                                  width: w * 0.2,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(w * 0.04),
                                                      color: ColorConst.buttons
                                                  ),
                                                  child: Center(child:Text('Start',style : textStyle(false))),
                                                ),
                                                SizedBox(width: w * 0.04,),
                                                InkWell(
                                                  onTap: () {
                                                    toastMessage(
                                                        context: context,
                                                        label: 'Booking will be available soon!',
                                                        isSuccess: false
                                                    );
                                                  },
                                                  child: Container(
                                                    height: h * 0.035,
                                                    width: w * 0.2,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(w * 0.04),
                                                        color: ColorConst.buttons
                                                    ),
                                                    child: Center(child:Text('Book',style : textStyle(false))),
                                                  ),
                                                ),
                                              ],
                                            )

                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(height: h * 0.01),
                                itemCount: setups.length
                            );
                          },)
                      ),
                    )
                  ],
                )
                    : Center(child:Text('No cafe selected!',style: textStyle(false)))
              ),
            )
            ],
        )
      ),
    );
  }
}