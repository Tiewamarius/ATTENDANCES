// ignore: file_names
import 'package:attendances/pages/auth/authPages.dart';
import 'package:attendances/pages/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcom_Page extends StatefulWidget {
  const Welcom_Page({super.key});

  @override
  State<Welcom_Page> createState() => _Welcom_PageState();
}

class _Welcom_PageState extends State<Welcom_Page> {
  String enteredPin = "";
  bool isPinVisible = false;
  String getFormattedTime(){
    DateTime now=DateTime.now();
    return '${now.hour}H:${now.minute}';
  }

  Widget numButton(int number) {
    return Padding(
        padding: EdgeInsets.only(top: 1),
        child: TextButton(
          onPressed: () {
            setState(() {
              if (enteredPin.length < 4) {
                enteredPin += number.toString();
              }

              if (enteredPin.length == 4) {
                showDialog(context: context, builder: (context) =>AlertDialog(

                  title: Center(child: Row(
                    children: [
                      Text('Bienvenue:'),
                      SizedBox(width:15),
                      Text(getFormattedTime(),style:TextStyle(
                            color:  Colors.green,fontWeight: FontWeight.w700
                          ))
                    ],
                  )),
                  content: TextField(
                    decoration: InputDecoration(
                      hintText: 'Observation OU motif de retard'
                    ),
                  ),
                  actions: [
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: TextButton(
                          onPressed: (){
                            print("Vous arrrivé à ${getFormattedTime()}");

                          },
                          child: Text('VALIDE',style:TextStyle(
                            color: Colors.white,fontWeight: FontWeight.w700
                          ))
                      ),
                    ),
                  ],
                )
                );
              }
            });

          },
          child: Text(
            number.toString(),
            style: TextStyle(fontSize: 25, color: const Color(0xFF111111)),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25),
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 250,
                width: 120,
                child: Image.asset(
                  'images/Login.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Center(
              child: Text(
                "ENTRER VOTRE CODE",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: List.generate(
                    4,
                    (index) {
                      return Container(
                          margin: const EdgeInsets.all(6),
                          height: isPinVisible ? 50 : 16,
                          width: isPinVisible ? 50 : 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: index < enteredPin.length
                                ? isPinVisible
                                    ? const Color.fromARGB(255, 13, 155, 226)
                                    : CupertinoColors.activeBlue
                                : CupertinoColors.systemGrey.withOpacity(0.1),
                          ),
                          child: isPinVisible && index < enteredPin.length
                              ? Center(
                                  child: Text(enteredPin[index],
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: CupertinoColors.systemBlue,
                                        fontWeight: FontWeight.w700,
                                      )),
                                )
                              : null);
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isPinVisible =!isPinVisible;
                      });
                    },
                    icon: Icon(
                      isPinVisible ? Icons.visibility_off : Icons.visibility,
                    )),
              ],
            ),
            SizedBox(
              height: isPinVisible ? 30 : 8,
            ),
           //DigitNumber
            for (var i = 0; i < 3; i++)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(15) ,
                        color: Colors.grey,),

                        child: numButton(1 + 3 * i + index)),
                  ).toList(),
                ),
              ),

              // 0 digit and backspace
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    TextButton(
                      onPressed: (){
                      },
                      child:Icon(Icons.fingerprint_outlined,
                      color:Colors.black,size:24)
                      ),
                      numButton(0),
                    TextButton(
                      onPressed: (){
                        if(enteredPin.isNotEmpty){
                          enteredPin=enteredPin.substring(0, enteredPin.length-1);
                        }
                      },
                      child:Icon(Icons.backspace_outlined,
                      color:Colors.black,size:24)
                      )
                  ]
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 55),
                child: Container(
                  decoration: BoxDecoration(
                          color:const Color(0xFF2D70E3),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        height: 50,
                        width:MediaQuery.of(context).size.width*2/3,
                        margin: EdgeInsets.symmetric(vertical: 24),
                        child: TextButton(
                          onPressed: (){
                            setState((){
                              enteredPin = "";
                            });
                          },
                          child:Text("EFFACER",style: TextStyle(
                            color:Colors.white,fontSize: 20, fontWeight: FontWeight.w700),
                          )
                          ),
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                TextButton.icon(
                  onPressed:(){
                    Get.to(AuthPages());
                  },
                  label: Text("Paramètre",style: TextStyle(
                      color:Colors.blueGrey,fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  icon: Icon(Icons.settings_input_antenna,size: 25,color: Colors.red,),)
              ],)
          ],
        ),
      ),
    );

  }
}
