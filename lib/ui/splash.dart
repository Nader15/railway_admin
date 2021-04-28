import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import 'package:railway_admin/ApiFunctions/shared.dart';

import '../utils/colors_file.dart';
import '../utils/colors_file.dart';
import '../utils/global_vars.dart';
import 'dashboard.dart';
import 'home.dart';






// ignore: camel_case_types
class SplashScreen extends StatefulWidget {
  @override
  _openState createState() => _openState();
}

// ignore: camel_case_types
class _openState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      getUserTocken(context).then((value) {

        print("UserTocken:: ${UserTocken}");
        if(UserTocken=="null"){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));

        }
        else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'app_images/train.png',
                color: blueAppColor,
                width: 100,
              ),
              SizedBox(height: 20),
              Text("Railway",style: TextStyle(color:blueAppColor,fontSize: 40 ),),
              SizedBox(height: 20),
              Text("For Admins",style: TextStyle(color:blueAppColor,fontSize: 20 ),),
            ],
          )
      ),
    );
  }
}
