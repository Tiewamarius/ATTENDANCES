// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  String enteredPin = "";
  bool isPinVisible = false;

  Widget numButton(int number) {
    return Padding(
        padding: EdgeInsets.only(top: 16),
        child: TextButton(
          onPressed: () {
            setState(() {
              if (enteredPin.length < 5) {
                enteredPin += number.toString();
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
            Center(
              child: Text(
                "Entrez votre Code PIN",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
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
                    5,
                    (index) {
                      return Container(
                          margin: const EdgeInsets.all(6),
                          height: isPinVisible ? 50 : 16,
                          width: isPinVisible ? 50 : 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: index < enteredPin.length
                                ? isPinVisible
                                    ? Colors.blueGrey
                                    : CupertinoColors.activeBlue
                                : CupertinoColors.activeBlue.withOpacity(0.1),
                          ),
                          child: isPinVisible && index < enteredPin.length
                              ? Center(
                                  child: Text(enteredPin[index],
                                      style: TextStyle(
                                        fontSize: 17,
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
              height: isPinVisible ? 50 : 8,
            ),
           
           //DigitNumber
            for (var i = 0; i < 3; i++)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => numButton(1 + 3 * i + index),
                  ).toList(),
                ),
              ),

              // 0 digit and backspace
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
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

              
                    Container(
                      decoration: BoxDecoration(
                        color:const Color(0xFF2D70E3),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      height: 50,
                      width:MediaQuery.of(context).size.width/2,
                      margin: EdgeInsets.symmetric(vertical: 24),
                      child: TextButton(
                        onPressed: (){
                          setState((){
                            enteredPin = "";
                          });
                        },
                        child:Text("EFFACER",style: TextStyle(
                          color:Colors.white24,fontSize: 32, fontWeight: FontWeight.w100),
                        )
                        ),
                    )
          ],
        ),
      ),
    );
  }
}
