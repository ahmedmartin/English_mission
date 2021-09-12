import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';


class SignIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignIn();
  }
}

class _SignIn extends State<SignIn>{

  TextEditingController phone_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            // phone input form field
            SizedBox(height: 20,),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              controller: phone_controller,
              //textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14) ,
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
                child: Text('Register',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              ),
              onTap: (){

                  if (phone_controller.text.isNotEmpty) {
                    if (phone_controller.text.length == 11) {
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
      phoneNumber: '+2'+phone_controller.text,
      verificationCompleted: (PhoneAuthCredential credential) async{
        await auth.signInWithCredential(credential).whenComplete((){
          print('sign in');
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message.toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
        Text(e.message.toString(),style: TextStyle(fontSize: 20),),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.blue,
        ));
      },
      codeSent: (String _verificationId, int? resendToken) {
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
                  decoration: InputDecoration(hintText: 'code...'),
                  keyboardType:TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: sms_code,
                  style: TextStyle(color: Colors.black,fontSize: 20),
                ),
                actions: [
                  GestureDetector(child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.blue,
                      child: Text('send',style: TextStyle(color: Colors.black,fontSize: 20),)),
                    onTap: ()async{

                      if(verificationId != null) {
                        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: sms_code.text);
                        // Sign the user in (or link) with the credential
                        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential).whenComplete((){
                          print('signed in success 1');
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (c)=>Home()), (route) => false);
                        });
                      }else{
                        print(verificationId);
                      }
                    },
                  )
                ],
              ));
        });
  }
//---------------------phone auth ----------------------------------------------


}