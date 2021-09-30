import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Word_craft_controller extends GetxController{

  RxList<String> litters = ["c", "a", "t", "w", "e", "f", "d", "o", "g", "q", "d", "e", "b", "o", "y", "n", "m", "a", "p", 'q',"b", "r", "e", "a", "k"].obs;
  RxList<bool> pressed = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false].obs;
  RxMap word = {}.obs;
  List correct_answers = ['cat','map','boy','break','dog'];
  RxList questions = ['قطه','خريطه','ولد','يكسر','كلب'].obs;
  RxList answers = ['','','','',''].obs;


  bool check_answer(){
    String temp = '';
    word.forEach((key, value) {
      temp +=value;
    });
    if(correct_answers.contains(temp)){
      word.forEach((key, value) {
        litters[key]='';
      });
      answers[correct_answers.indexOf(temp)]=temp;
      word.clear();
    }
    return correct_answers.contains(temp);
  }

}