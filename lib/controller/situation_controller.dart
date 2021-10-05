import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';





class Situation_controller extends GetxController{

  RxString question =''.obs;
  RxString answer1  =''.obs;
  RxString answer2  =''.obs;
  RxString answer3  =''.obs;

  Map correct_answer ={};
  List questions =[];
  Map answers ={};
  int ?game_level ;
  int index=0;


  get_game()async{
    var v;
    correct_answer.clear();
    questions.clear();
    answers.clear();
    index =0;
    await FirebaseFirestore.instance.collection('situation').doc(game_level.toString()).get().then((snapshot){
          correct_answer = snapshot['answer'];
          answers = snapshot['game'];
          print(answers);
          answers.forEach((key, value)=> questions.add(key));
          question.value = questions[0];
          answer1.value = answers[question.value][0];
          answer2.value = answers[question.value][1];
          answer3.value = answers[question.value][2];
    });
    return await v;
  }


  check_answer(String answer){

    bool temp = correct_answer[questions[index]]==answer;
    if(temp){
      index++;
      if(questions.length>index){
        question.value = questions[index];
        answer1.value = answers[question.value][0];
        answer2.value = answers[question.value][1];
        answer3.value = answers[question.value][2];
      }
    }
    return temp;
  }

}