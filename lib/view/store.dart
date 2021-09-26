import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_mission/controller/network_connection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Store extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Store();
  }

}

class _Store extends State<Store>{

 List<Course> courses =[];
 Network_connection_controller network_controller = Get.find();

 get_courses(){
   FirebaseFirestore.instance.collection('store').get().then((snapshot){
       snapshot.docs.forEach((element) {
          Course temp = Course(element['title'], element['description'], element['image_url'], element['link']);
          setState(() {
            courses.add(temp);
          });
       });
   });
 }

 @override
  void initState() {
    get_courses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Store",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body:Obx(()=>network_controller.wait.value ?  Center(child:Image.asset('assets/connection.gif')): GridView.builder(
          itemCount:courses.length ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .45,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context,index){
            return Draw_item(index);
          }),)
    );
  }
  
  Widget Draw_item(index){
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(courses[index].title!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
          SizedBox(height: 10,),
          // image view
          Container(
            width: Get.size.width/2,
            height: Get.size.height/6,
            child: FadeInImage.assetNetwork(placeholder: 'assets/fade_image.gif',image:courses[index].img_url!),
          ),
          // description view
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            height: Get.size.height/5,
            padding: EdgeInsets.all(6),
            child:Text(//courses[index].description!.length>150?courses[index].description!.substring(0,155):
            courses[index].description!,style: TextStyle(fontSize: 16,color: Colors.white),) ,
          ),
          SizedBox(height: 10,),
          // button view
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue
              ),
              child: Text('Buy',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),) ,
            ),
            onTap: (){
                launch(courses[index].course_url!);
            },
          )

        ],
      ),
    );
    
  }

}


class Course{
  String ?title;
  String ?description;
  String ?img_url;
  String ? course_url;

  Course(this.title, this.description, this.img_url, this.course_url);
}