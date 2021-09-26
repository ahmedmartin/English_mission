import 'package:cloud_firestore/cloud_firestore.dart';


class Question_model{

  String lesson_no ='1';
  CollectionReference? ref;

  Question_model(this.lesson_no){
    ref = FirebaseFirestore.instance.collection('courses').doc('english').collection('lessons')
        .doc(lesson_no).collection('questions');
  }

  get_questions()async{
    var v ;
    await  ref!.get().then((snapshot)  {
    v = snapshot.docs;
    });
    return await v;
  }
}