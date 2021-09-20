import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';



class Store extends StatelessWidget{

  //'https://dev.courses.philanthropyu.org/asset-v1:PhillU+CAD+CAD1+type@asset+block@course2.png'
 List<Course> courses =[Course('title', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor', 'https://www.mirrorminds.in/images/digital-marketing.png', 'https://www.selicaie.com'),
   Course('title', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore', 'https://www.reliablesoft.net/wp-content/uploads/2019/08/digital-marketing-courses.png', 'https://www.selicaie.com'),
   Course('title', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt', 'https://cdn.searchenginejournal.com/wp-content/uploads/2020/04/the-digital-marketing-agency-focused-covid-19-post-i-didnt-want-to-write-5e8accf484fe3-1520x800.png', 'https://www.selicaie.com'),
   Course('title', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor', 'https://www.mirrorminds.in/images/digital-marketing.png', 'https://www.selicaie.com'),
   Course('title', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,', 'https://www.reliablesoft.net/wp-content/uploads/2019/08/online-digital-marketing-course.png', 'https://www.selicaie.com'),
   Course('title', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,', 'https://www.mirrorminds.in/images/digital-marketing.png', 'https://www.selicaie.com'),
   Course('title', 'description Lorem ipsum dolor sit amet,', 'https://www.reliablesoft.net/wp-content/uploads/2019/08/digital-marketing-courses.png', 'https://www.selicaie.com'),
   Course('title', 'description Lorem ipsum dolor sit amet,', 'https://www.reliablesoft.net/wp-content/uploads/2019/08/online-digital-marketing-course.png', 'https://www.selicaie.com'),
   Course('title', 'description Lorem ipsum dolor sit amet,', 'https://www.reliablesoft.net/wp-content/uploads/2019/08/digital-marketing-courses.png', 'https://www.selicaie.com')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount:courses.length ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .45,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context,index){
            return Draw_item(index);
          }),
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