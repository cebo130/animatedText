import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:text_animate/home.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({required this.message,required this.speed,required this.myColor});
  final String message;
  final double speed;
  final Color? myColor;

  @override
  State<AnimationPage> createState() => _AnimationPageState(message: message,speed: speed,myColor:myColor);
}

class _AnimationPageState extends State<AnimationPage> {
  _AnimationPageState({required this.message,required this.speed,required this.myColor});
  final String message;
  final double speed;
  final Color? myColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: Center(
        child: GestureDetector(
          child: Container(
            //height: 200,
            child: Marquee(
              text: "$message .",
              style: TextStyle(fontWeight: FontWeight.bold,color:myColor,fontSize: 310),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 60.0,
              velocity: speed,
              pauseAfterRound: Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          ),
          onDoubleTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
          },
        ),
      ),
    );
  }
}
