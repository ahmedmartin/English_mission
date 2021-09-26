
import 'dart:async';
import 'package:english_mission/controller/lesson_controller.dart';
import 'package:english_mission/controller/network_connection.dart';
import 'package:english_mission/view/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Lesson extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Lesson();
  }

}

class _Lesson extends State<Lesson>{

  Lesson_controller lesson_controller = Get.put(Lesson_controller());
  Network_connection_controller network_controller = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(()=>network_controller.wait.value?Center(child:Image.asset('assets/connection.gif')):SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [

              SizedBox(height: 40,),
              // title view
              Obx(()=>lesson_controller.title.value.isNotEmpty?
              text_frame(lesson_controller.title.value):Container()),

              SizedBox(height: 20,),
              // first image view
              Obx(()=>lesson_controller.image_1.value.isNotEmpty?
              image_frame(lesson_controller.image_1.value):Container()),

              SizedBox(height: 20,),
              // first text view
              Obx(()=>lesson_controller.text_1.value.isNotEmpty?
              text_frame(lesson_controller.text_1.value):Container()),

              SizedBox(height: 20,),
              // second text view
              Obx(()=>lesson_controller.text_2.value.isNotEmpty?
              text_frame(lesson_controller.text_2.value):Container()),

              SizedBox(height: 20,),
              // second image view
              Obx(()=>lesson_controller.image_2.value.isNotEmpty?
              image_frame(lesson_controller.image_2.value):Container()),

              SizedBox(height: 20,),
              // example view
              Obx(()=>lesson_controller.example.value.isNotEmpty?
              text_frame(lesson_controller.example.value):Container()),

            ],
          ),
        ),
      ),),
      // ---- continue button -----------
      floatingActionButton:Obx(()=>Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Visibility(
            visible:lesson_controller.screen_index!=0 && !network_controller.wait.value ,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FloatingActionButton(
                heroTag: 'before',
                onPressed: () {
                  lesson_controller.screen_index--;
                  setState(() {});
                  switch(lesson_controller.lessons_type[lesson_controller.screen_index]){
                    case 'screen_1':lesson_controller.screen_1();break;
                    case 'screen_2':lesson_controller.screen_2();break;
                    case 'screen_3':lesson_controller.screen_3();break;
                    case 'screen_4':lesson_controller.screen_4();break;
                  }
                },
                child: Icon(Icons.navigate_before,color: Colors.white,size: 50,),
              ),
            ),
          ),


          Visibility(
            visible: !network_controller.wait.value ,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: FloatingActionButton(
                heroTag: 'next',
                onPressed: () {
                  lesson_controller.screen_index++;
                  setState(() {});
                  if(lesson_controller.screen_index<lesson_controller.lessons_type.length) {
                    switch (lesson_controller.lessons_type[lesson_controller.screen_index]) {
                      case 'screen_1':
                        lesson_controller.screen_1();
                        break;
                      case 'screen_2':
                        lesson_controller.screen_2();
                        break;
                      case 'screen_3':
                        lesson_controller.screen_3();
                        break;
                      case 'screen_4':
                        lesson_controller.screen_4();
                        break;
                    }
                  }else{
                    Get.to(Question());
                  }
                },
                child: Icon(Icons.navigate_next,color: Colors.white,size: 50,),
              ),
            ),
          )
        ],
      ),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }


  Widget image_frame(url){
    return Container(
      width: Get.width/2,
      height: 150,
      child: FadeInImage.assetNetwork(placeholder: 'assets/fade_image.gif',image:url),
    );
  }

  Widget text_frame(text){
    return Text(text,style:TextStyle(fontSize: 18,color: Colors.blue),);
  }

}