
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_mission/model/lesson_model.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Lesson_controller extends GetxController{

  RxString title = ''.obs;
  RxString image_1 =''.obs;
  RxString text_1 = ''.obs;
  RxString text_2 = ''.obs;
  RxString image_2 =''.obs;
  RxString example =''.obs;
  List<String> lessons_type=[];
  Lesson_model lesson_model = Lesson_model('1');
  List<QueryDocumentSnapshot> data =[];
  int screen_index = 0;
  RxBool wait = true.obs;
  StreamSubscription<InternetConnectionStatus> ?listener ;

  @override
  void onInit() async {

    listener = InternetConnectionChecker().onStatusChange.listen(
          (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
          // ignore: avoid_print
              wait.value=false;
              _get_data();
            break;
          case InternetConnectionStatus.disconnected:
          // ignore: avoid_print
            wait.value=true;
            break;
        }
      },
    );

  }

  _get_data() async {
    data = await lesson_model.get_lesson_screens();

    if(data!=null)
      _lessons_type();


    switch(lessons_type[screen_index]){
      case 'screen_1':screen_1();break;
      case 'screen_2':screen_2();break;
      case 'screen_3':screen_3();break;
      case 'screen_4':screen_4();break;
    }
  }

  _lessons_type(){
    wait.value = false;
    data.forEach((element) {
      print(element['screen_type']);
      lessons_type.add(element['screen_type']);
    });
  }


  // title , image1 , text1 , text2 , example
  screen_1 (){

    title.value=data[screen_index]['title'];
    image_1.value=data[screen_index]['image_url_1'];
    text_1.value= data[screen_index]['text_1'];
    text_2.value=data[screen_index]['text_2'];
    image_2.value='';
    example.value=data[screen_index]['example'];
  }

  //title , image1 , text1 , text2 , image2 , example
  screen_2 (){

    title.value=data[screen_index]['title'];
    image_1.value=data[screen_index]['image_url_1'];
    text_1.value=data[screen_index]['text_1'];
    text_2.value=data[screen_index]['text_2'];
    image_2.value=data[screen_index]['image_url_2'];
    example.value=data[screen_index]['example'];
  }

  //title , text1 , text2 , example
  screen_3 (){

    title.value=data[screen_index]['title'];
    image_1.value='';
    text_1.value=data[screen_index]['text_1'];
    text_2.value=data[screen_index]['text_2'];
    image_2.value='';
    example.value=data[screen_index]['example'];
  }

  //title , text1 , text2 , image2 , example
  screen_4 (){

    title.value=data[screen_index]['title'];
    image_1.value='';
    text_1.value=data[screen_index]['text_1'];
    text_2.value=data[screen_index]['text_2'];
    image_2.value=data[screen_index]['image_url_2'];
    example.value=data[screen_index]['example'];
  }
}