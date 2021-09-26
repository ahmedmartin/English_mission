import 'package:english_mission/view/note_bad.dart';
import 'package:english_mission/view/profile.dart';
import 'package:english_mission/view/road_map.dart';
import 'package:english_mission/view/signup.dart';
import 'package:english_mission/view/store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dictionary.dart';


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }

}

class _Home extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 40,),
          coin_par(),
          upgrade_courses(),
          SizedBox(height: 70,),
          general_course(),
          SizedBox(height: 40,),
          tab_par(),
        ],
      ),
    );
  }

  // generate coin system ui
  Widget coin_par(){
    return Expanded(
        child: Align(
          alignment: FractionalOffset.topCenter ,
          child:Container(
            child: Container(
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(80),bottomRight:Radius.circular(80),
                    topLeft: Radius.circular(100),bottomLeft: Radius.circular(100)),
                color: Colors.blue,
              ),
              padding: EdgeInsets.only(right: 20),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(backgroundImage: AssetImage('assets/coin.png'),radius: 25,),
                  SizedBox(width: 20,),
                  // photoURL is a total point (عملتها كده اختصار ليه)
                  Text(FirebaseAuth.instance.currentUser!.photoURL!,style: TextStyle(fontSize: 18,color: Colors.white),)
                ],
              ),
            ),
          ) ,
        )
    );
  }

  // generate bottom tab par ui
  Widget tab_par(){
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: Colors.blue,
          ),

          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //profile info
              GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.person,size:25,color: Colors.blue,),
                ),
                onTap: (){
                   Get.to(Profile());
                },
              ),

              //notepad
              GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.sticky_note_2_rounded,size: 25,color: Colors.blue,),
                ),
                onTap: (){
                  Get.to(Note_pad());
                },
              ),

              //dictionary
              GestureDetector (
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.menu_book_outlined,size: 25,color: Colors.blue,),
                ),
                onTap: ()=> Get.to(Dictionary()),
              ),

              //game
              GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.videogame_asset,size: 25,color: Colors.blue,),
                ),
                onTap: (){},
              ),

              //store
              GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.store,size: 25,color: Colors.blue,),
                ),
                onTap: (){
                  Get.to(Store());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //  generate ilets & toefl ui
  Widget upgrade_courses(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // ---------------------ielts----------------
        GestureDetector(
          child: ClipOval(
            child: FadeInImage.assetNetwork(width: Get.width/3,height: Get.height/7,fit:BoxFit.fill,placeholder: 'assets/fade_image.gif',image:'https://myhobbycourses.com/sites/default/files/IELTS-scaled.jpg'),
          ),
          onTap: (){},
        ),

        //----------- toefl  ----------------------
        GestureDetector(

          child: ClipOval(
            child: FadeInImage.assetNetwork(width: Get.width/3,height: Get.height/7,fit:BoxFit.fill,placeholder: 'assets/fade_image.gif',image:'https://image.shutterstock.com/image-vector/toefl-word-concept-test-english-260nw-1565002888.jpg'),
          ),
          onTap: (){},
        ),
      ],
    );
  }

  // generate general english ui
  Widget general_course(){
    return // ------------------------general english----------------------------
      GestureDetector(
        child: ClipOval(
          child: FadeInImage.assetNetwork(width: Get.width/2,height: Get.height/5,fit:BoxFit.fill,placeholder: 'assets/fade_image.gif',image:'https://thumbs.dreamstime.com/b/english-lesson-school-cartoon-people-characters-illustration-teacher-happy-student-speaking-blackboard-98066415.jpg'),
        ),
        onTap: (){
          Get.to(Road_map());
        },
      );
  }

}