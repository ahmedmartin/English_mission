import 'package:english_mission/view/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Profile extends StatelessWidget{

  List<Point> point =[Point('3', '1'),Point('3', '1'),Point('4', '2'),Point('4', '2')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile Info",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            color: Colors.blue,
            padding: EdgeInsets.only(top: 10,bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(backgroundImage: AssetImage('assets/fmale.jpg'),radius: 80,),
                SizedBox(height: 20,),
                Text('My Name ',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('+201xxxxxxxxxxx',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          SizedBox(height: 10,),
          Text('Point System History',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Expanded(child: ListView.builder(
              itemCount:point.length ,
              itemBuilder: (context,index){
                return ListTile(
                  title:Text("${point[index].points} Points"),
                  subtitle: Text("You've got ${point[index].points} Points From Level ${point[index].level}"),
                  leading: CircleAvatar(backgroundImage: AssetImage('assets/coin.png'),radius: 20,),
                );
              }
          )),
          SizedBox(height: 20,),
          GestureDetector(
            child: Text('Sign Out',style: TextStyle(fontSize: 18,color: Colors.grey),),
            onTap: (){
              FirebaseAuth.instance.signOut().whenComplete(() => Get.offAll(Start_screen()));
            },
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }

}

class Point {
  String? points;
  String? level;

  Point(this.points, this.level);
}