
import 'package:english_mission/view/road_map.dart';
import 'package:get/get.dart';

class Lesson_controller extends GetxController{

  RxString title = ''.obs;
  RxString image_1 =''.obs;
  RxString text_1 = ''.obs;
  RxString text_2 = ''.obs;
  RxString image_2 =''.obs;
  RxString example =''.obs;
  List<String> lessons_type=['screen_1','screen_2','screen_3','screen_4','screen_3'];
  //List screens = ['screen_1','screen_2','screen_3','screen_4'];

  @override
  void onInit() {
    screen_1();
  }

  // title , image1 , text1 , text2 , example
  screen_1 (){
    title.value='Lerom Ipsom';
    image_1.value='https://thumbs.dreamstime.com/b/english-lessons-chalkboard-eps-16074796.jpg';
    text_1.value='ahmed ahmed ahmed Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum';
    text_2.value='أَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغ';
    image_2.value='';
    example.value='ex: Lorem ipsum dolor sit amet, consetetur sadipscing elitr /n ex:sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat ';
  }

  //title , image1 , text1 , text2 , image2 , example
  screen_2 (){
    title.value='Lerom Ipsom';
    image_1.value='https://thumbs.dreamstime.com/b/english-lessons-chalkboard-eps-16074796.jpg';
    text_1.value='frmofmrovmofvnfoivn Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum';
    text_2.value='أَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغ';
    image_2.value='https://thumbs.dreamstime.com/b/education-teacher-classroom-concept-young-woman-maths-english-chemistry-physics-explaining-information-pointing-207307075.jpg';
    example.value='ex: Lorem ipsum dolor sit amet, consetetur sadipscing elitr /n ex:sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat ';
  }

  //title , text1 , text2 , example
  screen_3 (){
    title.value='Lerom Ipsom';
    image_1.value = '';
    text_1.value='martin martin martin Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum';
    text_2.value='أَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغ';
    image_2.value='';
    example.value='ex: Lorem ipsum dolor sit amet, consetetur sadipscing elitr /n ex:sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat ';
  }

  //title , text1 , text2 , image2 , example
  screen_4 (){
    title.value='Lerom Ipsom';
    image_1.value='';
    text_1.value='kkkksssskdkskskskssk Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum';
    text_2.value='أَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغأَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ قُرشت ثخذ ضظغ';
    image_2.value='https://thumbs.dreamstime.com/b/education-teacher-classroom-concept-young-woman-maths-english-chemistry-physics-explaining-information-pointing-207307075.jpg';
    example.value='ex: Lorem ipsum dolor sit amet, consetetur sadipscing elitr /n ex:sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat ';
  }
}