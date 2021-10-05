import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';



class Word_craft_controller extends GetxController{

  RxList litters = [].obs;
  RxList pressed = [].obs;
  RxMap word = {}.obs;
  List correct_answers = [];
  RxList questions = [].obs;
  RxList<String> answers = ['','','','',''].obs;
  int ?game_level ;
  bool finish= true;


  get_game() async {
    var v;
    litters.clear();
    questions.clear();
    correct_answers.clear();
    answers.clear();
    await FirebaseFirestore.instance.collection('word_craft').doc(game_level.toString()).get().then((snapshot){
      print(snapshot['game']);
      print(snapshot['answer']);
      litters.value = snapshot['game'];
      Map map = snapshot['answer'];
      map.forEach((key, value) {
        questions.add(key);
        correct_answers.add(value);
      });
      answers.value = ['','','','',''];
      pressed.value = List.filled(25, false);
    });
    return await v;
  }


  bool check_answer(){
    String temp = '';
    finish = true;
    word.forEach((key, value) {
      temp +=value;
    });
    if(correct_answers.contains(temp)){
      word.forEach((key, value) {
        litters[key]='';
      });
      answers[correct_answers.indexOf(temp)]=temp;
      word.clear();
      answers.forEach((element) {
         if(element.toString().isEmpty) finish = false;
      });
    }
    return correct_answers.contains(temp);
  }


}