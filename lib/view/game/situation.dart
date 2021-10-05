import 'package:audioplayers/audioplayers.dart';
import 'package:english_mission/controller/network_connection.dart';
import 'package:english_mission/controller/situation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class Situation extends StatelessWidget{

  Network_connection_controller network_controller = Get.find();
  Situation_controller  situation_controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> network_controller.wait.value ?Center(child:Image.asset('assets/connection.gif')):Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Obx(()=>Center(child: Text(situation_controller.question.value,style: TextStyle(fontSize: 30,color: Colors.blue)))),
            SizedBox(height: 20,),
            Text('...............................',style: TextStyle(fontSize: 30,color: Colors.blue)),
            SizedBox(height: 50,),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue
                ),
                child:Obx(()=>Text(situation_controller.answer1.value,style: TextStyle(fontSize: 20,color: Colors.white),)) ,
              ),
              onTap: (){
                check(situation_controller.answer1.value);
              },
            ),
            SizedBox(height: 10,),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue
                ),
                child:Obx(()=>Text(situation_controller.answer2.value,style: TextStyle(fontSize: 20,color: Colors.white),)) ,
              ),
              onTap: (){
                check(situation_controller.answer2.value);
              },
            ),
            SizedBox(height: 10,),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue
                ),
                child:Obx(()=>Text(situation_controller.answer3.value,style: TextStyle(fontSize: 20,color: Colors.white),)) ,
              ),
              onTap: (){
                check(situation_controller.answer3.value);
              },
            ),
          ],
        ),
    ),)
    );
  }

  check(String answer){
    if(situation_controller.check_answer(answer)){
      if(situation_controller.questions.length<=situation_controller.index){
        AudioCache().play('celebrate.mp3');
        Get.defaultDialog(
            barrierDismissible: false,
            title: 'Congratulations',
            content: Image.asset('assets/congratulation.gif'),
            onConfirm: (){Get.back(); Get.back();},
            onWillPop: ()=>Future.value(false)
        );
      }else
        AudioCache().play('correct.mp3');
    } else
      AudioCache().play('wrong.mp3');
  }

}
