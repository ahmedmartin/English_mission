

import 'package:english_mission/controller/lesson_controller.dart';
import 'package:english_mission/view/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Lesson extends StatelessWidget{

  double screen_width = 0;
  
  @override
  Widget build(BuildContext context) {

    Lesson_controller lesson_controller = Get.put(Lesson_controller());
    screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
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
      ),

      // ---- continue button -----------
      floatingActionButton:Obx(()=> Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Visibility(
            visible:lesson_controller.screen_index.value!=1 ,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FloatingActionButton(
                heroTag: 'before',
                onPressed: () {
                  switch (lesson_controller.screen_index.value ){
                    case 2: {lesson_controller.screne_1(); lesson_controller.screen_index.value = 1; break;}
                    case 3: {lesson_controller.screne_2(); lesson_controller.screen_index.value = 2; break;}
                    case 4: {lesson_controller.screne_3(); lesson_controller.screen_index.value = 3; break;}
                  }
                },
                child: Icon(Icons.navigate_before,color: Colors.white,size: 50,),
              ),
            ),
          ),


          Visibility(
            //visible: lesson_controller.screen_index.value!=4,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: FloatingActionButton(
                heroTag: 'next',
                onPressed: () {
                  switch (lesson_controller.screen_index.value ){
                    case 1: {lesson_controller.screne_2(); lesson_controller.screen_index.value = 2; break;}
                    case 2: {lesson_controller.screne_3(); lesson_controller.screen_index.value = 3; break;}
                    case 3: {lesson_controller.screne_4(); lesson_controller.screen_index.value = 4; break;}
                    case 4: Get.to(Question());
                  }
                },
                child: Icon(Icons.navigate_next,color: Colors.white,size: 50,),
              ),
            ),
          )
        ],
      ),) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }


  Widget image_frame(url){
    return Container(
      width: screen_width/2,
      height: 150,
      child: Image.network(url),
    );
  }

  Widget text_frame(text){
    return Text(text,style:TextStyle(fontSize: 18,color: Colors.blue),);
  }

}