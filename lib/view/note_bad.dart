import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Note_pad extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Note_pad();
  }
}

class _Note_pad extends State<Note_pad>{

  List <Translation> translation  = [Translation('كَلَمُنْ', 'consetetur'),Translation('ضظغأَبْجَدْ', 'sadipscing'),
    Translation('قُرشت', 'elitr'),Translation('هَوَّزْْ', 'eirmod'),Translation('كلب', 'dog')];
  TextEditingController word_controller = TextEditingController();
  TextEditingController translate_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child:ListView.builder(
            itemCount:translation.length ,
            itemBuilder: (context,index){
              return Container(
                decoration: BoxDecoration(
                  color: index%2 == 0?Colors.lightBlue.withOpacity(.1):Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(translation[index].word!,
                      style: TextStyle(fontSize: 20,color:Colors.blue,fontWeight: FontWeight.bold),),
                    Text(translation[index].translate!,
                      style: TextStyle(fontSize: 20,color:Colors.blue,fontWeight: FontWeight.bold),),
                  ],
                ),
              );
            }) ,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,size: 40,),
        onPressed: (){
          Get.defaultDialog(
            title: 'add new word to your note bad',
            contentPadding: EdgeInsets.all(30),
            content: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'ex"كلب"',
                      labelText: 'word'
                    ),
                    controller: word_controller,
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    decoration: InputDecoration(
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'ex"dog"',
                        labelText: 'translation'
                    ),
                    controller: translate_controller,
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(height: 40,)
                ],
              ),
            //confirm: Text('add'),
            onConfirm: (){
              if(word_controller.text.isNotEmpty&&translate_controller.text.isNotEmpty) {
                setState(() {
                  translation.add(Translation(word_controller.text, translate_controller.text));
                  word_controller.text = '';
                  translate_controller.text = '';
                  Get.back();
                });
              }
            },
            //cancel: Text('cancel'),
            onCancel: (){},
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }


}


class Translation {
  String? word;
  String? translate;

  Translation(this.word, this.translate);
}