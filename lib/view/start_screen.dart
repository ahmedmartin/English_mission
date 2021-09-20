import 'package:english_mission/view/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';



class Start_screen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
          //Container(width:MediaQuery.of(context).size.width,height: 200,child: Image.asset('assets/logo.png')),
          Image.asset('assets/start_screen.gif'),
          //SizedBox(height: 30,),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
               // borderRadius: BorderRadius.only(topLeft: Radius.circular(150),topRight: Radius.circular(150)),
                color: Colors.blue
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 60,),
                  Text("Let's Start...",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30)),
                  SizedBox(height: 60,),
                  GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.height/15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: Center(child: Text('Start Now',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),)),
                    ),
                    onTap: (){
                      Get.off(Home());
                    },
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.height/15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:Border.all(color: Colors.white,width: 1),
                          color: Colors.blue
                      ),
                      //padding: EdgeInsets.only(left:40,right: 40,top: 20,bottom: 20 ),
                      child: Center(child: Text('LogIn Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))),
                    ),
                    onTap: (){
                      Get.to(SignIn());
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}