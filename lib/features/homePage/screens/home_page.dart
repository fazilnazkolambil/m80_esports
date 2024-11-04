import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build (BuildContext context){
    return DefaultTabController(
      length: widget.cafe[0][widget.selectedCafe].length,
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: ColorConst.secondaryColor,
          width: w * 0.7,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.03,horizontal: w * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: const AssetImage(ImageConst.logo),
                    radius: w * 0.07,
                  ),
                  title: Text('UserName',style:textStyle(true)),
                  subtitle: Text(widget.selectedCafe,style: textStyle(false),),
                ),
                Text('Income',style: textStyle(true)),
                Text('Bookings',style: textStyle(true)),
                Text('Attendance/Presence',style: textStyle(true)),
                Text('Directory',style: textStyle(true)),
                Text('Settings',style: textStyle(true)),
                const SizedBox(),
                GestureDetector(
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
                    child: Row(
                      children: [
                        const Icon(Icons.logout_outlined,color: ColorConst.textColor),
                        const SizedBox(width: 10,),
                        Text('Sign out',style: textStyle(false)),
                      ],
                    )),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('M80 Esports',style: textStyle(true)),
                      Text('App version : $version',style:textStyle(false))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              leading: Builder(
                builder: (context) {
                  return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(Icons.menu,color: ColorConst.textColor,)
                  );
                }
              ),
              floating: true,
              backgroundColor: ColorConst.backgroundColor,
              surfaceTintColor: Colors.green,
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
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.notifications_outlined,color: ColorConst.textColor,),
                      SizedBox(width: 10),
                      Icon(Icons.account_balance_wallet_outlined,color: ColorConst.textColor,)
                    ],
                  ),
                )
              ],
            ),
            SliverAppBar(
              pinned: true,
              backgroundColor: ColorConst.backgroundColor,
              leadingWidth: w,
              foregroundColor: Colors.green,
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
                  child: Text(widget.cafe[0][widget.selectedCafe][index].keys.first,style: textStyle(true)),
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
                              controller: _scrollController,
                              physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: h * 0.2,
                                    width: w,
                                    padding: EdgeInsets.all(w * 0.03),
                                    margin: EdgeInsets.only(left : w * 0.01,right : w * 0.01,bottom: h * 0.02),
                                    decoration: BoxDecoration(
                                      color: ColorConst.secondaryColor,
                                        borderRadius: BorderRadius.circular(w * 0.03),
                                        border: Border.all(color:setups[index]['status']
                                            ? ColorConst.errorAlert
                                            : ColorConst.textColor.withOpacity(0.5)
                                        ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image(image: const AssetImage(ImageConst.logo),width: w * 0.3),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(setups[index]['name'],style: textStyle(true)),
                                            setups[index]['status']
                                            ? Expanded(
                                              child: Column(
                                                mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Start time : ${DateFormat.jm().format(DateTime.now())}',style: textStyle(false)),
                                                  Text('Play time : 1:30 hrs',style: textStyle(false),),
                                                  Text('Total Amount : 150/-',style: textStyle(false)),
                                                  Container(
                                                    height: h * 0.035,
                                                    width: w * 0.2,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(w * 0.04),
                                                        color: ColorConst.errorAlert
                                                    ),
                                                    child: Center(child:Text('End',style : textStyle(false))),
                                                  )
                                                ],
                                              ),
                                            )
                                            : Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap : (){

                                                  },
                                                  child: Container(
                                                    height: h * 0.035,
                                                    width: w * 0.2,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(w * 0.04),
                                                        color: ColorConst.buttons
                                                    ),
                                                    child: Center(child:Text('Start',style : textStyle(false))),
                                                  ),
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