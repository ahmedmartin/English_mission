
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Road_map_controller extends GetxController{

  RxList lessons = [
   /* 'https://thumbs.dreamstime.com/b/english-lesson-teacher-near-blackboard-classroom-147387345.jpg',
  'https://thumbs.dreamstime.com/b/english-lesson-flat-vector-illustration-tutor-explaining-pointing-blackboard-english-native-speaker-holding-books-cartoon-154979662.jpg',
  'https://thumbs.dreamstime.com/b/grammar-letter-light-background-vector-collection-grammar-lesson-english-alphabet-grammar-letter-light-background-vector-139300279.jpg',
  'https://thumbs.dreamstime.com/b/prepositions-movement-english-language-learning-vector-illustration-prepositions-movement-english-language-learning-184947127.jpg',
  'https://thumbs.dreamstime.com/b/english-class-concept-study-foreign-languages-school-grammar-audio-lesson-idea-global-communication-studying-vocabulary-226068381.jpg',
  'https://thumbs.dreamstime.com/b/cartoon-illustration-school-student-english-class-vector-76330614.jpg',
  'https://thumbs.dreamstime.com/b/english-class-concept-study-foreign-languages-school-grammar-audio-lesson-idea-global-communication-studying-vocabulary-197683082.jpg',
  'https://thumbs.dreamstime.com/b/primary-school-female-teacher-giving-lesson-learn-primary-school-female-teacher-red-dress-standing-classroom-pointing-147007465.jpg',
  'https://thumbs.dreamstime.com/b/english-class-concept-study-foreign-languages-school-grammar-audio-lesson-idea-global-communication-studying-vocabulary-flat-198932904.jpg',
  'https://thumbs.dreamstime.com/b/cartoon-flamingo-bird-thinking-lesson-education-progress-preschool-illustration-first-english-class-high-quality-219405416.jpg',
  'https://thumbs.dreamstime.com/b/teacher-kids-vector-illustration-isolated-back-school-backpack-books-boy-casual-clothes-character-child-childhood-children-157364823.jpg',*/
  ].obs;


  @override
  void onInit() async{

    get_lessons();

    super.onInit();
  }


  get_lessons()async{

    var v ;
    lessons.clear();
    await FirebaseFirestore.instance.collection('courses').doc('english').get().then((snapshot){
        v = snapshot['lessons'];
        lessons.value = snapshot['lessons'];
    });
    return await v;
  }



}