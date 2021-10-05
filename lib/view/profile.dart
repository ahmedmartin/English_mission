import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_mission/view/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Profile();
  }

}

class _Profile extends State<Profile>{

  List point =[];
  String phone ='';
  String name = '';

  profile_info(){

    setState(() {
      phone = 'my phone'; //FirebaseAuth.instance.currentUser!.phoneNumber!;
      name = 'my name';//FirebaseAuth.instance.currentUser!.displayName!;
    });
    FirebaseFirestore.instance.collection('users').doc(phone).get().then((snapshot){
       setState(() {
         point = snapshot['points'];
       });
    });
  }

  @override
  void initState() {
    super.initState();
    profile_info();
  }

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
                Text(name,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(phone,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
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
                  title:Text("${point[index]} Points"),
                  subtitle: Text("You've got ${point[index]} Points From Level ${++index}"),
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
