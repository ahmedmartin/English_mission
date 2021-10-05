import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:blur/blur.dart';
import 'package:english_mission/controller/network_connection.dart';
import 'package:english_mission/controller/word_craft_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Word_craft extends StatelessWidget{


  Word_craft_controller craft_controller = Get.find();
  Network_connection_controller network_controller = Get.find();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Obx(()=> network_controller.wait.value ?Center(child:Image.asset('assets/connection.gif')): Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/craft.png'),fit: BoxFit.fill)
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
               // SizedBox(height: 20,),
                Obx(() => Text(craft_controller.word.isNotEmpty?craft_controller.word.values.toString():'',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 40),)),
                SizedBox(height: 10,),

                // game box ui
                Container(
                  padding: EdgeInsets.all(10),
                  height: Get.height>550?340:230,
                  width: Get.width,
                  child: Obx(() => GridView.builder(
                      itemCount: craft_controller.litters.length,
                      controller: ScrollController(initialScrollOffset: 0),
                      scrollDirection: Axis.vertical ,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio:Get.height>550?1.2: 1.5,
                        crossAxisSpacing:Get.height>550?5:4,
                        mainAxisSpacing: Get.height>550?5:4,
                      ),
                      itemBuilder: (context,index){
                        return draw_list(index);
                      }),)
                ).frosted(blur: 1,frostColor: Colors.white,borderRadius: BorderRadius.circular(20) ),

                SizedBox(height: 10,),
                //first question row
                first_question(),

                // second question row
                second_question(),

                // third question row
                third_question(),

                SizedBox(height: 30,),
                // check button
                check_button()
              ],
            ),
          ),
        ),
      ),)
    );
  }
  Widget first_question(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Obx(() => Text(craft_controller.questions.isNotEmpty?craft_controller.questions[0]:'',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue,width: 2),
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                child: Obx(() => Text(craft_controller.answers.isNotEmpty?craft_controller.answers[0]:'',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),))),
          ],
        ),
        Column(
          children: [
            Obx(() => Text(craft_controller.questions.isNotEmpty?craft_controller.questions[1]:'',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue,width: 2),
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                child: Obx(() => Text(craft_controller.answers.isNotEmpty?craft_controller.answers[1]:'',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),))),
          ],
        ),
      ],
    );
  }

  Widget second_question(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Obx(() => Text(craft_controller.questions.isNotEmpty?craft_controller.questions[2]:'',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue,width: 2),
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                child: Obx(() => Text(craft_controller.answers.isNotEmpty?craft_controller.answers[2]:'',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),))),
          ],
        ),
        Column(
          children: [
            Obx(() => Text(craft_controller.questions.isNotEmpty?craft_controller.questions[3]:'',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue,width: 2),
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                child: Obx(() => Text(craft_controller.answers.isNotEmpty?craft_controller.answers[3]:'',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),))),
          ],
        ),
      ],
    );
  }

  Widget third_question(){
    return Column(
      children: [
        Obx(() => Text(craft_controller.questions.isNotEmpty?craft_controller.questions[4]:'',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue,width: 2),
                borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
            child: Obx(() => Text(craft_controller.answers.isNotEmpty?craft_controller.answers[4]:'',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),))),
      ],
    );
  }

  Widget check_button (){
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 50,right: 50,top: 10,bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue
        ),
        child: Text('Check',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
      ),
      onTap: (){

          if (craft_controller.check_answer()) {
            print(craft_controller.finish);
            if(craft_controller.finish) {
              AudioCache().play('celebrate.mp3');
              Get.defaultDialog(
                  barrierDismissible: false,
                  title: 'Congratulations',
                  content: Image.asset('assets/congratulation.gif'),//network('https://i.pinimg.com/originals/93/d2/88/93d2882e452875ffe11f3cc7aeba2b6f.gif'),
                  onConfirm: (){Get.back(); Get.back();},
                  onWillPop: ()=>Future.value(false)
              );
            }else
            AudioCache().play('correct.mp3');
          } else
            AudioCache().play('wrong.mp3');

      },
    );
  }

  Widget draw_list(index){
    return GestureDetector(
      child:Obx(()=> Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.height>550?15:10),
            color:craft_controller.litters[index].isEmpty?Colors.black38: craft_controller.pressed[index]?Colors.blueGrey:Colors.blue
        ),
        child: Obx(()=>Center(child: Text(craft_controller.litters[index].toUpperCase(),style: TextStyle(fontSize: Get.height>550?30:20,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,))),
      )),
      onTap: (){
        if(craft_controller.litters[index].isNotEmpty){
          if(craft_controller.pressed[index]){
            craft_controller.word.remove(index);
            craft_controller.pressed[index]=false;
          }else {
            craft_controller.word[index]= craft_controller.litters[index] ;
            craft_controller.pressed[index]=true;
          }
        }
      },
    );
  }


}
