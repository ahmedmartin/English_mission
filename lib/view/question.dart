//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:english_mission/controller/question_controller.dart';
import 'package:english_mission/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class Question extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Question();
  }

}

class _Question extends State<Question>{

  Question_controller question_controller = Get.put(Question_controller());
  List answer = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:Obx(()=> question_controller.wait.value ?Center(child:Image.asset('assets/connection.gif')):SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Container(
                  width: Get.size.width/2,
                  child: Obx(()=> LinearPercentIndicator(
                    lineHeight: 15.0,
                    percent: question_controller.question_index/question_controller.questions_type.length,
                    center: Text(question_controller.question_index.toString(), style: new TextStyle(fontSize: 12.0,color:Colors.white ),
                    ),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                    animation: true,
                    animationDuration: 50,
                  ),
                ),),
                SizedBox(height: 30,),
                Obx(()=>Text(question_controller.title.value,
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue),)),

                SizedBox(height: 30,),
                 question_controller.voice.value.isNotEmpty?GestureDetector(
                  child: Container(
                    width: 100,height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:Colors.blue,
                    ),
                      child: Icon(Icons.campaign_sharp,size: 60,color: Colors.white,)),
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

                Obx(()=>Text('................... '+question_controller.text_2.value,
                  style: TextStyle(fontSize: 18,color: Colors.blue),)),

                SizedBox(height: 20,),
                Obx(()=>Text(question_controller.your_answer.value,
                  style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),

                SizedBox(height: 30,),
                // if (question_controller.all_answer.length>=3)
                // then question either choose or translation or voice (should show third button)
                // else question is true_false (shouldn't show third button)
                firest_row_button(question_controller.all_answer.length>=3),
                SizedBox(height: 20,),
                // if (question_controller.all_answer.length>3)
                // then question either translation or voice (should show buttons)
                // else question either true_false or choose (shouldn't show buttons)
                second_row_button(question_controller.all_answer.length>3),
                SizedBox(height: 50,),
                check_button(),

              ],
            ),
          ),
        ),)
    );
  }


  Widget firest_row_button (bool all){
    return Row(
      mainAxisAlignment:all? MainAxisAlignment.spaceAround:MainAxisAlignment.center,
      children: [

        GestureDetector(
          child: Obx(()=>Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:question_controller.press_0.value?Colors.blue:Colors.grey,
            ),
            padding: EdgeInsets.all(10),
            child: Text(question_controller.all_answer[0],style: TextStyle(fontSize: 18,color: Colors.white),)
          ),),
          onTap: (){
            // check if button pressed before or not (choose the answer or not)
           if( question_controller.press_0.value){
             // if not choose the answer
             // he wants to add answer to answer list

             // check question type if question (true_false or choose) and he not choose another answer
             // to be sure choose (only one answer )
             if((question_controller.questions_type[question_controller.question_index]=='true_false'||question_controller.questions_type[question_controller.question_index]=='choose') && answer.isEmpty){
               // not choose another answer before
               // add answer to answer list and show it in the screen
               question_controller.press_0.value= add_answer(0,question_controller.press_0.value);
               // check question type if question (translate or voice)
               // can choose (multiple of answer )
             }else if(question_controller.questions_type[question_controller.question_index]=='translate'||question_controller.questions_type[question_controller.question_index]=='voice'){
               // add answer to answer list and show it in the screen
               question_controller.press_0.value= add_answer(0,question_controller.press_0.value);
             }
           }else {
             // if choose the answer
             // he choose this answer before then he wants to remove this answer from answer list
             // remove answer from answer list and show a new answer in screen
             question_controller.press_0.value= remove_answer(0,question_controller.press_0.value );
           }
          },
        ),
        if(!all)...[Container(width: 20,)],

        GestureDetector(
          child: Obx(()=>Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: question_controller.press_1.value?Colors.blue:Colors.grey,
            ),
            padding: EdgeInsets.all(10),
            child: Text(question_controller.all_answer[1],style: TextStyle(fontSize: 18,color: Colors.white),),
          ),),
          onTap: (){
            // check if button pressed before or not (choose the answer or not)
            if(question_controller.press_1.value){
              // if not choose the answer
              // he wants to add answer to answer list

              // check question type if question (true_false or choose) and he not choose another answer
              // to be sure choose (only one answer )
              if((question_controller.questions_type[question_controller.question_index]=='true_false'||question_controller.questions_type[question_controller.question_index]=='choose') && answer.isEmpty) {
                // not choose another answer before
                // add answer to answer list and show it in the screen
                question_controller.press_1.value= add_answer(1, question_controller.press_1.value);
                // check question type if question (translate or voice)
                // can choose (multiple of answer )
              }else if(question_controller.questions_type[question_controller.question_index]=='translate'||question_controller.questions_type[question_controller.question_index]=='voice'){
                // add answer to answer list and show it in the screen
                question_controller.press_1.value= add_answer(1, question_controller.press_1.value);
              }
            }else {
              // if choose the answer
              // he choose this answer before then he wants to remove this answer from answer list
              // remove answer from answer list and show a new answer in screen
              question_controller.press_1.value= remove_answer(1, question_controller.press_1.value);
            }
          },
        ),

        all? GestureDetector(
          child: Obx(()=>Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: question_controller.press_2.value?Colors.blue:Colors.grey,
            ),
            padding: EdgeInsets.all(10),
            child: Text(question_controller.all_answer[2],style: TextStyle(fontSize: 18,color: Colors.white),),
          ),),
          onTap: (){
            // check if button pressed before or not (choose the answer or not)
            if(question_controller.press_2.value){
              // if not choose the answer
              // he wants to add answer to answer list

              // check question type if question (choose) and he not choose another answer
              // (don't care about true_false cause this button not be visible there)
              // to be sure choose (only one answer )
              if(question_controller.questions_type[question_controller.question_index]=='choose' && answer.isEmpty) {
                // not choose another answer before
                // add answer to answer list and show it in the screen

                question_controller.press_2.value= add_answer(2, question_controller.press_2.value);
                // check question type if question (translate or voice)
                // can choose (multiple of answer )
              }else if(question_controller.questions_type[question_controller.question_index]=='translate'||question_controller.questions_type[question_controller.question_index]=='voice'){
                // add answer to answer list and show it in the screen

                question_controller.press_2.value= add_answer(2, question_controller.press_2.value);
              }
            }else {
              // if choose the answer
              // he choose this answer before then he wants to remove this answer from answer list
              // remove answer from answer list and show a new answer in screen

              question_controller.press_2.value= remove_answer(2, question_controller.press_2.value);
            }

          },
        ):SizedBox(),
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
              borderRadius: BorderRadius.circular(15),
              color: question_controller.press_3.value?Colors.blue:Colors.grey,
            ),
            padding: EdgeInsets.all(10),
            child: Text(question_controller.all_answer[3],style: TextStyle(fontSize: 18,color: Colors.white),),
          ),),
          onTap: (){
            question_controller.press_3.value?
              question_controller.press_3.value= add_answer(3, question_controller.press_3.value):
              question_controller.press_3.value= remove_answer(3, question_controller.press_3.value);
          },
        ),

        GestureDetector(
          child: Obx(()=>Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: question_controller.press_4.value?Colors.blue:Colors.grey,
              ),
            padding: EdgeInsets.all(10),
            child: Text(question_controller.all_answer[4],style: TextStyle(fontSize: 18,color: Colors.white),),
          ),),
          onTap: (){
            question_controller.press_4.value?
              question_controller.press_4.value= add_answer(4, question_controller.press_4.value):
              question_controller.press_4.value= remove_answer(4, question_controller.press_4.value);
          },
        ),

         GestureDetector(
          child: Obx(()=>Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: question_controller.press_5.value?Colors.blue:Colors.grey,
            ),
            padding: EdgeInsets.all(10),
            child: Text(question_controller.all_answer[5],style: TextStyle(fontSize: 18,color: Colors.white),),
          ),),
           onTap: (){
             question_controller.press_5.value?
               question_controller.press_5.value= add_answer(5, question_controller.press_5.value):
               question_controller.press_5.value= remove_answer(5, question_controller.press_5.value);
           },
         ),
      ],
    ):Container();
  }

  Widget check_button(){

    return Obx(()=>Container(  //FractionalOffset.bottomCenter,
      child: Align(
        alignment:FractionalOffset.bottomCenter ,
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
          onTap: () async {
              // if answer list have text you can press on button
              // if empty then your answer correct
              if(answer.isNotEmpty) {
                // check if user answer == correct answer
                if(question_controller.correct_answer.value != answer.join(' ') ){
                    // for wrong answer pop up snack bar  with message 'wrong answer'
                Get.snackbar('Wrong Answer', 'Wrong Answer Please Try Again And Practice More',
                    backgroundColor: Colors.red, colorText: Colors.black, duration: Duration(seconds: 2),isDismissible: false,
                    snackPosition: SnackPosition.BOTTOM, padding: EdgeInsets.all(25)) ;
                AudioCache().play('wrong.mp3');
                }else {
                  answer = [];
                  wait_another_question=true;
                  // for correct answer pop up snack bar 'correct answer'
                  // when he press to snack bar move to next question
                  Get.snackbar('Correct Answer', 'Press Me To Continue',
                      backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM, colorText: Colors.white,
                      duration: Duration(seconds: 3000), icon: Icon(Icons.arrow_forward,color: Colors.white,size: 40,),isDismissible: false,
                      mainButton: TextButton(onPressed: ()=> press_on_snack_bar(),style: TextButton.styleFrom(backgroundColor: Colors.white), child: Text('Continue',style: TextStyle(color:Colors.black),)),
                      padding: EdgeInsets.all(25),onTap: (OnTap) {
                        press_on_snack_bar();
                      });
                  AudioCache().play('correct.mp3');
                }
              }
          },
        ),
      ),
    ));

  }


  // increase question_index
  // make snack bar disappear
  // show another question if question list not complete
  // else show congratulation popup screen
  press_on_snack_bar(){
    question_controller.question_index++;
    Get.back();
    wait_another_question=false;
    setState(() {});
    // if this is a last question then turn back to road map
    if (question_controller.question_index < question_controller.questions_type.length) {
      // show suitable question
      switch (question_controller.questions_type[question_controller.question_index]) {
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
      AudioCache().play('celebrate.mp3');
      Get.defaultDialog(
          barrierDismissible: false,
          title: 'Congratulation',
          content: Image.asset('assets/congratulation.gif'),//network('https://i.pinimg.com/originals/93/d2/88/93d2882e452875ffe11f3cc7aeba2b6f.gif'),
          onConfirm: ()=>Get.offAll(Home()),
          onWillPop: ()=>Future.value(false)
      );
    }
  }

  bool wait_another_question = false; // use to cancel all button action and wait press continue snack bar
  bool add_answer(int answer_index,bool press){

    if(! wait_another_question) {
      answer.add(question_controller.all_answer[answer_index]);
      question_controller.your_answer.value = answer.join('  ');
      return !press;
    }
    return press;
  }

  bool remove_answer(int answer_index,bool press){

    if(! wait_another_question) {
      answer.removeWhere((element) => element == question_controller.all_answer[answer_index]);
      question_controller.your_answer.value = answer.join('  ');
      return !press;
    }
    return press;
  }


}
