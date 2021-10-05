import 'package:audioplayers/audioplayers.dart';
import 'package:english_mission/controller/network_connection.dart';
import 'package:english_mission/controller/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';




class Timer extends StatelessWidget{

  Timer_controller timer_controller = Get.find();
  Network_connection_controller network_controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> network_controller.wait.value ?Center(child:Image.asset('assets/connection.gif')):Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Countdown(
                seconds: 60,
                build: (context,time)=>Text(time.toString(),style: TextStyle(color: Colors.blue,fontSize: 40,fontWeight: FontWeight.bold),),
                onFinished: (){AudioCache().play('wrong.mp3');Get.back();},
            ),
            SizedBox(height: 20,),
            Icon(Icons.timer,size: 150,color: Colors.blue,),
            SizedBox(height: 40,),
            Obx(()=>Text(timer_controller.question.value,style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),)),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child:Container(
                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue
                    ),
                    child: Obx(()=>Text(timer_controller.answer1.value,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),)),
                  ) ,
                  onTap: (){
                    check(timer_controller.answer1.value);
                  },
                ),

                GestureDetector(
                  child:Container(
                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue
                    ),
                    child: Obx(()=>Text(timer_controller.answer2.value,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),)),
                  ) ,
                  onTap: (){
                    check(timer_controller.answer2.value);
                  },
                ),
              ],
            )

          ],
        ),
      ),)
    );
  }

  check(String answer){
    if(timer_controller.check_answer(answer)){
      if(timer_controller.questions.length<=timer_controller.index){
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