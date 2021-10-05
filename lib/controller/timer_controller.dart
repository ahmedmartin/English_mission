import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';



class Timer_controller extends GetxController{

  RxString question =''.obs;
  RxString answer1 =''.obs;
  RxString answer2 = ''.obs;
  List questions = [];
  Map answers ={};
  List correct_answers =[];
  int ?game_level ;
  int index = 0;



  get_game()async{
    var v;
    questions.clear();
    answers.clear();
    correct_answers.clear();
    index = 0;
    await FirebaseFirestore.instance.collection('timer').doc(game_level.toString()).get().then((snapshot){

       answers = snapshot['questions'];
       answers.forEach((key, value)=> questions.add(key));
       correct_answers = snapshot['correct_answers'];
       question.value = questions[0];
       answer1.value = answers[question.value][0];
       answer2.value = answers[question.value][1];
    });
    return await v;
  }


  check_answer(String answer){
    bool temp = correct_answers.contains(answer);
     if(temp){
       index++;
       if(questions.length>index){
         question.value = questions[index];
         answer1.value = answers[question.value][0];
         answer2.value = answers[question.value][1];
       }
     }
     return temp;
  }



}