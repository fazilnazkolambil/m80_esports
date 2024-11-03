import 'package:flutter/material.dart';

import '../../../core/const_page.dart';
import '../../../core/globalVariables.dart';

class ContentPage extends StatefulWidget{
  final Map content;
  const ContentPage({super.key, required this.content});
  @override
  State <ContentPage> createState () => _ContentPageState();
}
class _ContentPageState extends State<ContentPage>{
  bool isStarted = false;
  @override
  Widget build(BuildContext context){
    // print(widget.content);
    // print(widget.content['${widget.content.keys.first}']);
    // print(widget.content['${widget.content.keys.first}'][0]['name']);
    List content = widget.content['${widget.content.keys.first}'];
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
              title: Text(widget.content.keys.first,style: textStyle(true)),
              centerTitle: true,
              titlePadding: EdgeInsets.only(bottom: h * 0.1),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding:  EdgeInsets.all(w * 0.03),
              child: Column(
                children: [
                  Expanded(child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: h * 0.2,
                          width: w,
                          padding: EdgeInsets.all(w * 0.03),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: ColorConst.secondaryColor.withOpacity(0.25),
                                    blurRadius: 10,
                                    spreadRadius: 4,
                                    offset: const Offset(0, 4)
                                )
                              ],
                              gradient: LinearGradient(colors: [
                                ColorConst.buttons,
                                ColorConst.buttons.withOpacity(0.5),
                              ]),
                              borderRadius: BorderRadius.circular(w * 0.03)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(content[index]['name'],style: textStyle(true)),
                              TextButton(
                                  onPressed: () {

                                  },
                                  child: const Text('Start with',style: TextStyle(
                                    color: ColorConst.textColor,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ))
                              ),
                              Container(
                                height: h * 0.035,
                                width: w * 0.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(w * 0.04),
                                    color: ColorConst.successAlert
                                ),
                                child: Center(child:Text('Start',style : textStyle(false))),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(),
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
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(height: h * 0.01),
                      itemCount: content.length
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}