import 'package:get/get.dart';


class Question_controller extends GetxController{

  RxString title = ''.obs;
  RxString voice =''.obs;
  RxString text_1 = ''.obs;
  RxString text_2 = ''.obs;
  List questions_type=['true_false','choose','true_false','translate','voice','choose'].obs;
  List all_answer =[].obs;
  RxString correct_answer=''.obs;
  RxString your_answer=''.obs;
  RxBool press_0=true.obs,press_1=true.obs,press_2=true.obs;
  RxBool press_3=true.obs,press_4=true.obs,press_5=true.obs;

  @override
  void onInit() {
    true_false();
  }

  true_false(){
    title.value='True OR False';
    voice.value='';
    text_1.value='consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat';
    text_2.value='';
    all_answer=['true','false'];
    correct_answer.value='true';
    your_answer.value='';
    press_0.value=true;press_1.value=true;press_2.value=true;
    press_3.value=true;press_4.value=true;press_5.value=true;
  }

  translate(){
    title.value='Translate';
    voice.value='';
    text_1.value='Lorem ipsum dolor sit amet';
    text_2.value='';
    all_answer=['answer1','answer2','answer3','answer4','answer5','answer6'];
    correct_answer.value='answer2answer5answer3answer1answer6';
    your_answer.value='';
    press_0.value=true;press_1.value=true;press_2.value=true;
    press_3.value=true;press_4.value=true;press_5.value=true;
  }

  choose(){
    title.value='Choose Correct Answer';
    voice.value='';
    text_1.value='Lorem ipsum dolor sit amet';
    text_2.value='dolor sit';
    all_answer=['answer1','answer2','answer3'];
    correct_answer.value='answer2';
    your_answer.value='';
    press_0.value=true;press_1.value=true;press_2.value=true;
    press_3.value=true;press_4.value=true;press_5.value=true;
  }

  voice_listener(){
    title.value = 'choose the words according to what you hear';
    voice.value='https://res.cloudinary.com/daxdz7knl/video/upload/v1631105118/WhatsApp_Audio_2021-09-08_at_1.52.24_PM_xmeki3.mp3';//'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
    text_1.value='';
    text_2.value='';
    all_answer=['answer1','answer2','answer3','answer4','answer5','answer6'];
    correct_answer.value='answer2answer5answer3answer1answer6';
    your_answer.value='';
    press_0.value=true;press_1.value=true;press_2.value=true;
    press_3.value=true;press_4.value=true;press_5.value=true;
  }

}