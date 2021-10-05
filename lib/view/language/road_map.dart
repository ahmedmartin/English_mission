import 'package:english_mission/controller/network_connection.dart';
import 'package:english_mission/controller/road_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lesson.dart';



class Road_map extends StatelessWidget{

  ScrollController _scrollController = ScrollController();
  final Road_map_controller road_map_controller = Get.put(Road_map_controller());
  Network_connection_controller network_controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Obx(() => Text("Clicks: ${road_map_controller.levels}"))),
      body: Center(
        child: Obx(()=>network_controller.wait.value ? Center(child:Image.asset('assets/connection.gif')):ListView.builder(
            itemCount: road_map_controller.lessons.length ,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            reverse: true,
            shrinkWrap: true,
            controller: _scrollController,
            itemBuilder: (context,index){
              return GestureDetector(
                child: Draw_map(index),
                onTap:(){
                 // road_map_controller.road_map_listener!.cancel();
                  Get.to(Lesson());
                } ,);
            }),)
      ),
    );
  }

  Widget Draw_map(index){
    return Container(
      padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
      child: Align(
        alignment:index%2==0? Alignment.topLeft:Alignment.topRight,
        child: ClipOval(
          child: FadeInImage.assetNetwork(width: Get.width/2,height: Get.height/4,fit:BoxFit.fill,placeholder: 'assets/fade_image.gif',image:road_map_controller.lessons[index]),
        ),

      ),
    );
  }

}