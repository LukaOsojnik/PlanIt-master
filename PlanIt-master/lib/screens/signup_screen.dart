import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterproject/screens/trip_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Align(
          alignment:AlignmentDirectional(0,0),
          child:Text(
            'Your active trips',
            style:TextStyle(
              color:Colors.white,
              fontSize: 50,
              letterSpacing:0
            ))
        )
      ),

      body: SafeArea(
        child:Align(
          alignment:AlignmentDirectional(0,0.95),
          child:OutlinedButton(

            onPressed:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:(context) => TripScreen(),
                )
              );
            },
            
            style:OutlinedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              )
            ),

            child: const Padding(
              padding:EdgeInsets.all(10.0),

              child:Text(
                'Start new trip',
                style:TextStyle(
                  fontSize: 30.0,
                  color:Colors.white,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600
                )

              )
            )
          )
          
        )
      )
    );

  }
}
