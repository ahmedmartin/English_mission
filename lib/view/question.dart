//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:english_mission/controller/question_controller.dart';
import 'package:english_mission/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Question extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Question();
  }

}

class _Question extends State<Question>{

  Question_controller question_controller = Get.put(Question_controller());
  List answer = [];
  int question_index = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 170,),
              Obx(()=>Text(question_controller.title.value,
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue),)),

              SizedBox(height: 30,),
               question_controller.voice.value.isNotEmpty?GestureDetector(
                child: Container(color:Colors.grey,child: Icon(Icons.campaign_sharp,size: 100,color: Colors.blue,)),
                onTap: () async {
                  AudioPlayer audioPlayer = AudioPlayer();
                  int result = await audioPlayer.play(question_controller.voice.value);
                  if (result == 1) {
                    print('success');
                  }
                },
              ):Container(),

              SizedBox(height: 20,),
              Obx(()=>Text(question_controller.text_1.value,
                style: TextStyle(fontSize: 18,color: Colors.blue),)),

              // Text('...................',
              //   style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue),),

              Obx(()=>Text('................... '+question_controller.text_2.value,
                style: TextStyle(fontSize: 18,color: Colors.blue),)),

              SizedBox(height: 20,),
              Obx(()=>Text(question_controller.your_answer.value,
                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),

              SizedBox(height: 30,),
              firest_row_button(question_controller.all_answer.length>=3),
              SizedBox(height: 20,),
              second_row_button(question_controller.all_answer.length>3),

              check_button(),
            ],
          ),
        ),
    );
  }


  Widget firest_row_button (bool all){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        GestureDetector(
          child: Obx(()=>Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:question_controller.press_0.value?Colors.blue:Colors.grey,
            ),
            padding: EdgeInsets.all(20),
            child: Text(question_controller.all_answer[0],style: TextStyle(fontSize: 18,color: Colors.white),)
          ),),
          onTap: (){
            question_controller.press_0.value?

            answer.add(question_controller.all_answer[0]):
            answer.removeWhere((element) => element==question_controller.all_answer[0]);

            question_controller.press_0.value=!question_controller.press_0.value;
            question_controller.your_answer.value=answer.join('  ');
          },
        ),

        GestureDetector(
          child: Obx(()=>Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: question_controller.press_1.value?Colors.blue:Colors.grey,
            ),
            padding: EdgeInsets.all(20),
            child: Text(question_controller.all_answer[1],style: TextStyle(fontSize: 18,color: Colors.white),),
          ),),
          onTap: (){
            question_controller.press_1.value?

            answer.add(question_controller.all_answer[1]):
            answer.removeWhere((element) => element==question_controller.all_answer[1]);

            question_controller.press_1.value=!question_controller.press_1.value;
            question_controller.your_answer.value=answer.join('  ');
          },
        ),

        all? GestureDetector(
          child: Obx(()=>Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: question_controller.press_2.value?Colors.blue:Colors.grey,
            ),
            padding: EdgeInsets.all(20),
            child: Text(question_controller.all_answer[2],style: TextStyle(fontSize: 18,color: Colors.white),),
          ),),
          onTap: (){
            question_controller.press_2.value?

            answer.add(question_controller.all_answer[2]):
            answer.removeWhere((element) => element==question_controller.all_answer[2]);

            question_controller.press_2.value=!question_controller.press_2.value;
            question_controller.your_answer.value=answer.join('  ');
          },
        ):Container(),
      ],
    );
  }


  Widget second_row_button (bool visable){
    return visable?Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          child: Obx(()=>Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: question_controller.press_3.value?Colors.blue:Colors.grey,
            ),
            padding: EdgeInsets.all(20),
            child: Text(question_controller.all_answer[3],style: TextStyle(fontSize: 18,color: Colors.white),),
          ),),
          onTap: (){
            question_controller.press_3.value?

            answer.add(question_controller.all_answer[3]):
            answer.removeWhere((element) => element==question_controller.all_answer[3]);
            question_controller.press_3.value=!question_controller.press_3.value;

            question_controller.your_answer.value=answer.join('  ');
          },
        ),

        GestureDetector(
          child: Obx(()=>Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: question_controller.press_4.value?Colors.blue:Colors.grey,
              ),
            padding: EdgeInsets.all(20),
            child: Text(question_controller.all_answer[4],style: TextStyle(fontSize: 18,color: Colors.white),),
          ),),
          onTap: (){
            question_controller.press_4.value?

            answer.add(question_controller.all_answer[4]):
            answer.removeWhere((element) => element==question_controller.all_answer[4]);
            question_controller.press_4.value=!question_controller.press_4.value;

            question_controller.your_answer.value=answer.join('  ');
          },
        ),

         GestureDetector(
          child: Obx(()=>Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: question_controller.press_5.value?Colors.blue:Colors.grey,
            ),
            padding: EdgeInsets.all(20),
            child: Text(question_controller.all_answer[5],style: TextStyle(fontSize: 18,color: Colors.white),),
          ),),
           onTap: (){
             question_controller.press_5.value?

             answer.add(question_controller.all_answer[5]):
             answer.removeWhere((element) => element==question_controller.all_answer[5]);
             question_controller.press_5.value=!question_controller.press_5.value;

             question_controller.your_answer.value=answer.join('  ');
           },
         ),
      ],
    ):Container();
  }

  Widget check_button(){

    return Obx(()=>Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: question_controller.your_answer.isNotEmpty?Colors.blue:Colors.black26
            ),
            padding: EdgeInsets.all(20),
            child: Text('check', style: TextStyle(color:question_controller.your_answer.isNotEmpty?
            Colors.white:Colors.grey,fontSize: 20,fontWeight: FontWeight.bold ),),
          ),
          onTap: (){
              // if answer list have text you can press on button
              // if empty then your answer correct
              if(answer.isNotEmpty) {
                // check if user answer == correct answer
                if(question_controller.correct_answer.value != answer.join('') ){
                    // for wrong answer pop up snack bar  with message 'wrong answer'
                Get.snackbar('Wrong Answer', 'Wrong Answer Please Try Again And Practice More',
                    backgroundColor: Colors.red, colorText: Colors.black, duration: Duration(seconds: 2),
                    snackPosition: SnackPosition.BOTTOM, padding: EdgeInsets.all(25)) ;
                }else {
                  answer = [];
                  // for correct answer pop up snack bar 'correct answer'
                  // when he press to snack bar move to next question
                  Get.snackbar('Correct Answer', 'Press Me To Continue',
                      backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM, colorText: Colors.white,
                      duration: Duration(seconds: 300), icon: Icon(Icons.arrow_forward,color: Colors.white,size: 40,),
                      padding: EdgeInsets.all(25), onTap: (OnTap) {
                        question_index++;
                        Get.back();
                        setState(() {});
                        // if this is a last question then turn back to road map
                        if (question_index < question_controller.questions_type.length) {
                          // show suitable question
                          switch (question_controller.questions_type[question_index]) {
                            case 'true_false':
                              question_controller.true_false();
                              break;
                            case 'choose' :
                              question_controller.choose();
                              break;
                            case 'translate' :
                              question_controller.translate();
                              break;
                            case 'voice' :
                              question_controller.voice_listener();
                              break;
                          }
                        } else {
                          // if finished all question go to road map screen again
                          Get.offAll(Home());
                        }
                      });
                }
              }

          },
        ),
      ),
    ));

  }

}
