import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_mission/model/question_model.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class Question_controller extends GetxController{

  RxString title = ''.obs;
  RxString voice =''.obs;
  RxString text_1 = ''.obs;
  RxString text_2 = ''.obs;
  List questions_type=[].obs;
  List all_answer =[].obs;
  RxString correct_answer=''.obs;
  RxString your_answer=''.obs;
  RxBool press_0=true.obs,press_1=true.obs,press_2=true.obs;
  RxBool press_3=true.obs,press_4=true.obs,press_5=true.obs;
  List<QueryDocumentSnapshot> data =[];
  Question_model question_model = Question_model('1');
  int question_index =0;


  @override
  void onInit() async{
    _get_data();
  }

  _get_data() async {
    data = await question_model.get_questions();
    if(data!=null)
      _questions_type();


    switch (questions_type[question_index]) {
      case 'true_false': true_false(); break;
      case 'choose' : choose(); break;
      case 'translate' : translate(); break;
      case 'voice' : voice_listener(); break;
    }
  }

  _questions_type(){
    data.forEach((element) {
      print(element['question_type']);
      questions_type.add(element['question_type']);
    });
  }

  true_false(){

    title.value='True OR False';
    voice.value='';
    text_1.value=data[question_index]['text_1'];
    text_2.value='';
    all_answer=['true','false'];
    correct_answer.value=data[question_index]['correct_answer'];
    your_answer.value='';
    press_0.value=true;press_1.value=true;press_2.value=true;
    press_3.value=true;press_4.value=true;press_5.value=true;
  }

  translate(){
    title.value='Translate';
    voice.value='';
    text_1.value=data[question_index]['text_1'];
    text_2.value='';
    all_answer=data[question_index]['all_answer'];
    correct_answer.value=data[question_index]['correct_answer'];
    your_answer.value='';
    press_0.value=true;press_1.value=true;press_2.value=true;
    press_3.value=true;press_4.value=true;press_5.value=true;
  }

  choose(){
    title.value='Choose Correct Answer';
    voice.value='';
    text_1.value=data[question_index]['text_1'];
    text_2.value=data[question_index]['text_2'];
    all_answer=data[question_index]['all_answer'];
    correct_answer.value=data[question_index]['correct_answer'];
    your_answer.value='';
    press_0.value=true;press_1.value=true;press_2.value=true;
    press_3.value=true;press_4.value=true;press_5.value=true;
  }

  voice_listener(){
    title.value = 'choose the words according to what you hear';
    voice.value=data[question_index]['voice'];
    text_1.value='';
    text_2.value='';
    all_answer=data[question_index]['all_answer'];
    correct_answer.value=data[question_index]['correct_answer'];
    your_answer.value='';
    press_0.value=true;press_1.value=true;press_2.value=true;
    press_3.value=true;press_4.value=true;press_5.value=true;
  }

}