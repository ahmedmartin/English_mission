import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_mission/controller/situation_controller.dart';
import 'package:english_mission/controller/timer_controller.dart';
import 'package:english_mission/controller/word_craft_controller.dart';
import 'package:english_mission/view/game/situation.dart';
import 'package:english_mission/view/game/timer.dart';
import 'package:english_mission/view/game/word_craft.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Game_list extends StatefulWidget{

  String game_type;
  Game_list(this.game_type);

  @override
  State<StatefulWidget> createState() {
    return _Game_list(game_type);
  }

}

class _Game_list extends State<Game_list>{

  List <_Game_levels> levels = [];
  String game_type;
  _Game_list(this.game_type);

  get_levels(){
    FirebaseFirestore.instance.collection('game_levels').get().then((snapshot){
      snapshot.docs.forEach((element) {
         _Game_levels temp = _Game_levels(element['title'], element['description'], element['image_link']);
         setState(() {
           levels.add(temp);
         });
      });
    });
  }

  @override
  void initState() {
    get_levels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: levels.length,
            itemBuilder:(context,index){
              return ListTile(
                title: Text(levels[index].title!,style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
                subtitle: Text(levels[index].description!,style: TextStyle(fontSize: 16,color: Colors.blue),),
                leading: CircleAvatar(backgroundImage: NetworkImage(levels[index].image_link!),radius: 30,),
                 contentPadding: EdgeInsets.all(10),
                onTap: (){

                  switch (game_type){
                    case 'word_craft':Word_craft_controller craft_controller = Get.put(Word_craft_controller());craft_controller.game_level=index+1;craft_controller.get_game();Get.to(Word_craft()); break;
                    case 'timer':Timer_controller timer_controller = Get.put(Timer_controller());timer_controller.game_level = index+1;timer_controller.get_game();Get.to(Timer());break;
                    case 'situation':Situation_controller situation_controller = Get.put(Situation_controller());situation_controller.game_level = index+1; situation_controller.get_game();Get.to(Situation());
                  }
                },
              );
            })
      ),
    );
  }

}

class _Game_levels{
  String? title;
  String? description;
  String? image_link;

  _Game_levels(this.title, this.description, this.image_link);
}