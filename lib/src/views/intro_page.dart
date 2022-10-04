import 'package:covid_ui_design_challenge/constants.dart';
import 'package:covid_ui_design_challenge/src/models/TextStyler.dart';
import 'package:flutter/material.dart';

import 'MyHomePage.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColrs.mainColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColrs.mainColor, 
            AppColrs.mainColor.withOpacity(.5)
          ], 
          begin: Alignment.topCenter, 
          end: Alignment.bottomCenter
          )
          
        ), 
         child: Stack(
          children: [
            _buildHeader(), 
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width*.85,
                  child: Center(
                    child: Image.asset("assets/images/virus.png" )),
                ),
              ),
              // ignore: sized_box_for_whitespace
              Positioned(
                top: MediaQuery.of(context).size.width*.1,
                left: MediaQuery.of(context).size.width*.5,
                //right: MediaQuery.of(context).size.width*.,
                bottom: MediaQuery.of(context).size.width*.6,

                child: Container(
                  width: MediaQuery.of(context).size.width*.5,
                  child:Image.asset("assets/images/person.png" )
                ,),
              ) ,
              
            _builFooter(context)

          ],
         ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
            padding: const EdgeInsets.only(top: 50.0), 
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset("assets/images/logo.png" )),
            );
  }

  Widget _builFooter(BuildContext context) {
    return Positioned(
              bottom: 50.0,
              child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children:[
                  TextStyler("Coronavirus disease  (COVID-19)",fonSize: 24.0,fontWeight: FontWeight.bold,), 
                  TextStyler("is an infectianus disease caused by a new \n virus.",fonSize: 24.0,height: 1.5,textAlign: TextAlign.center,),
                  const SizedBox(height: 25.0,), 
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage())); 
                    },
                    child:Container(
                    decoration: const BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.all(Radius.circular(50.0)), 
                      boxShadow: [
                        BoxShadow( color: Colors.black,offset: Offset(1.0,3.0),spreadRadius: 1, blurRadius: 30), 
                        
                      ]
                    ),
                    width: MediaQuery.of(context).size.width*0.85,
                    height: 60.0, 
                    child: Center(
                      child: TextStyler("GET STARTED",color: AppColrs.mainColor,fonSize: 20.0,fontWeight: FontWeight.bold,),
                    ),
                  ) ,
                  )
                  
                ]
              ),
              )
              );
  }
}