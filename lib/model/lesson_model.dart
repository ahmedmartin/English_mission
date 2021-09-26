import 'package:cloud_firestore/cloud_firestore.dart';


class Lesson_model {
  
  String lesson_no ='1';

  CollectionReference? ref;

  Lesson_model(this.lesson_no){
    ref = FirebaseFirestore.instance.collection('courses').doc('english').collection('lessons')
        .doc(lesson_no).collection('screens');
  }

  get_lesson_screens()async {
    var v ;
    await  ref!.get().then((snapshot)  {
      v = snapshot.docs;
    });
    return await v;
  }

}