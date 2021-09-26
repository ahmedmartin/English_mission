import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';


class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignUp();
  }
}

class _SignUp extends State<SignUp>{

  TextEditingController name_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  bool wait = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // name input form field
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Name',
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              controller: name_controller,
             // textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14) ,
            ),

            // phone input form field
            SizedBox(height: 20,),

            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Phone Number ex"+201xxxxxxxxxx"',
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              controller: phone_controller,
              //textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14) ,
              onTap: (){showCountryPicker(
                context: context,
                showPhoneCode: true, // optional. Shows phone code before the country name.
                onSelect: (Country country) {
                  phone_controller.text='+'+country.phoneCode;
                },
              );},
            ),

            SizedBox(height: 20,),

            // sign in button
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(20),
                //color: Colors.blue,
                child: wait?CircularProgressIndicator(color: Colors.white,):Text('Register',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              ),
              onTap: (){
                if(name_controller.text.isNotEmpty) {
                  if (phone_controller.text.isNotEmpty) {
                    setState(() {wait=true;});
                    firebase_Auth();
                    } else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                      Text('phone should be 11 number', style: TextStyle(fontSize: 20),),
                        duration: Duration(seconds: 5),
                        backgroundColor: Colors.blue,
                      ));}
                  } else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                    Text('Phone is required', style: TextStyle(fontSize: 20),),
                      duration: Duration(seconds: 5),
                      backgroundColor: Colors.blue,
                    ));}

              },
            ),

          ],
        ),
      ),
    );
  }

//-------------------- firebase phone auth ---------------------------
  String ? verificationId;
  firebase_Auth()async{

    FirebaseAuth auth = FirebaseAuth.instance;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber:phone_controller.text, //'+2'+phone_controller.text,
      verificationCompleted: (PhoneAuthCredential credential) async{
        await auth.signInWithCredential(credential).whenComplete((){
          print('sign in');
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {wait=false;});
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
        Text(e.message.toString(),style: TextStyle(fontSize: 20),),
        duration: Duration(seconds: 5),
          backgroundColor: Colors.blue,
        ));
      },

      codeSent: (String _verificationId, int? resendToken) {
        setState(() {wait=false;});
        enter_sms_code();
        verificationId = _verificationId;
      },

      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String _verificationId) {verificationId = _verificationId;},
    );

  }

  TextEditingController sms_code = TextEditingController();
  enter_sms_code(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child:  AlertDialog(
                title: new Text('enter code sent in sms ',style: TextStyle(fontSize: 30,color: Colors.black),textAlign: TextAlign.center,),
                content: TextFormField(
                  decoration: InputDecoration(
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'code'
                  ),
                  keyboardType:TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: sms_code,
                  style: TextStyle(color: Colors.black,fontSize: 20),
                ),
                actions: [
                  GestureDetector(child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      padding: EdgeInsets.all(20),
                      child: Text('send',style: TextStyle(color: Colors.black,fontSize: 20),)),
                    onTap: ()async{

                    if(verificationId != null) {
                      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: sms_code.text);
                      // Sign the user in (or link) with the credential
                      await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential).whenComplete((){
                        FirebaseAuth.instance.currentUser!.updateDisplayName(name_controller.text);
                        FirebaseAuth.instance.currentUser!.updatePhotoURL('0'); // points
                        FirebaseFirestore.instance.collection('users').doc(phone_controller.text).set(
                            {
                              'courses':{'english':1},
                            }) ;
                        Get.offAll(Home());
                      });
                    }
                    },
                  )
                ],
              ));
        });
  }
//---------------------phone auth ----------------------------------------------


}