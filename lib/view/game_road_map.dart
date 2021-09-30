import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:english_mission/view/word_craft.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Game_road_map extends StatelessWidget{

  List<Widget> images = [
    Container(width:Get.width,height:Get.height/4,decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage('assets/rearrange.png'))
    ),),
    Container(width:Get.width,height:Get.height/4,decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage('assets/situation.png'))
    ),),
    Container(width:Get.width,height:Get.height/4,decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage('assets/timer.png'))
    ),),
    Container(width:Get.width,height:Get.height/4,decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage('assets/watch.png'))
    ),),
    Container(width:Get.width,height:Get.height/4,decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage('assets/word_craft.png'))
    ),),];

  List routs =[Word_craft(),Word_craft(),Word_craft(),Word_craft(),Word_craft()];

  ScrollController  scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClickableListWheelScrollView(
          itemHeight: 300,
          itemCount: images.length,
          scrollController: scroll,
          onItemTapCallback: (index){
            Get.to(routs[index]);
          },
          child: ListWheelScrollView(
              controller: scroll,
              children: images,
              itemExtent:300,
              useMagnifier: true,
              diameterRatio: 3,
              squeeze: 1.3,

          ),
        ),
      ),
    );
  }

}