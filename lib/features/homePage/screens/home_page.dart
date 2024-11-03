import 'package:flutter/material.dart';
import 'package:m80_esports/core/const_page.dart';
import 'package:m80_esports/core/globalVariables.dart';
import 'package:m80_esports/features/authPage/screens/login_page.dart';

class HomePage extends StatefulWidget{
  final List cafe;
  final String selectedCafe;
  const HomePage({super.key,
    required this.cafe,
    required this.selectedCafe
  });
  @override
  State <HomePage> createState () => _HomePageState();
}
class _HomePageState extends State <HomePage>{
  @override
  Widget build (BuildContext context){
    return DefaultTabController(
      length: widget.cafe[0][widget.selectedCafe].length,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: const SizedBox(),
              floating: true,
              backgroundColor: ColorConst.backgroundColor,
              // stretch: true,
              centerTitle: true,
              expandedHeight: h * 0.05,
              flexibleSpace: FlexibleSpaceBar(
                background: Center(child: Padding(
                  padding: const EdgeInsets.only(top : 50),
                  child: Text('Cafe : ${widget.selectedCafe}',style: textStyle(true)),
                )),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(w * 0.03),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                        return AlertDialog(
                          backgroundColor: ColorConst.backgroundColor,
                          title: Text('Logout',style: textStyle(true),),
                          content: Text('Are you sure you want to logout?',style: textStyle(false),),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('No')
                            ),
                            TextButton(
                                onPressed: () async {
                                  // SharedPreferences prefs = await SharedPreferences.getInstance();
                                  // prefs.setBool('isLoggedIn', false);
                                  // prefs.remove('selectedCafe');
                                  // prefs.remove('cafe');
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()),(route) => false);
                                },
                                child: const Text('Yes')
                            )
                          ],
                        );
                      },);

                    },
                      child: const Icon(Icons.logout_outlined,color: ColorConst.textColor)),
                )
              ],
            ),
            SliverAppBar(
              pinned: true,
              backgroundColor: ColorConst.backgroundColor,
              leadingWidth: w,
              leading: TabBar(
                dividerColor: ColorConst.backgroundColor,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                //indicatorPadding: const EdgeInsets.all(- 10),
                overlayColor: const WidgetStatePropertyAll(ColorConst.backgroundColor),
                indicator: BoxDecoration(
                  color: ColorConst.secondaryColor,
                  border: Border.all(color: ColorConst.textColor.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(w * 0.03)
                ),
                  tabs: List.generate(widget.cafe[0][widget.selectedCafe].length, (index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: w * 0.05,vertical: w * 0.01),
                  child: Text(widget.cafe[0][widget.selectedCafe][index].keys.first,style: textStyle(false)),
                );
              })),
              centerTitle: true,
            ),
            SliverFillRemaining(
              child: Padding(
                padding: EdgeInsets.all(w * 0.03),
                child: Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                          children: List.generate(widget.cafe[0][widget.selectedCafe].length, (i) {
                            List setups = widget.cafe[0][widget.selectedCafe][i][widget.cafe[0][widget.selectedCafe][i].keys.first];
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
              ),
            )
            ],
        )
      ),
    );
  }
}