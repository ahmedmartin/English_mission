import 'package:country_picker/country_picker.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:language_picker/languages.g.dart';
import 'package:translator/translator.dart';
import 'package:flutter/material.dart';



class Dictionary extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Dictionary();
  }
}

class _Dictionary extends State<Dictionary>{

  TextEditingController word = TextEditingController();
  String translate ='' ;
  String language_code ='ar';
  final translator = GoogleTranslator();
  final supportedLanguages = [
    Languages.english,Languages.arabic,Languages.italian,
    Languages.french,Languages.hindi,
    Languages.spanish,Languages.japanese,
    Languages.korean,Languages.russian,Languages.german,
  ];
  bool wait = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Translation',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60,),
              LanguagePickerDropdown(
                  initialValue:Languages.arabic ,
                  languages: supportedLanguages,
                  onValuePicked: (Language language) {
                    print(language.name);
                    language_code=language.isoCode;
                  }),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Type Your Word....',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                controller: word,
                // textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14) ,

              ),
              SizedBox(height: 30,),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue
                  ),
                  child: wait ?CircularProgressIndicator(color: Colors.white,):Text('Translate',style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
                onTap: () {
                  if (word.text.isNotEmpty) {
                      setState(() {
                        wait=true;
                      });
                      translator.translate(word.text, to: language_code).
                      then((result) { setState(() {wait=false;translate = result.text;});
                      });

                  }
                }
              ),
              SizedBox(height: 30,),
              Text(translate,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }

}