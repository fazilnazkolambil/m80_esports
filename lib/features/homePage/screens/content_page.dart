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
  @override
  void initState() {
    print(widget.content);
    print(widget.content['${widget.content.keys.first}']);
    print(widget.content['${widget.content.keys.first}'][0]['name']);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context){
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

          )
        ],
      ),
    );
  }
}