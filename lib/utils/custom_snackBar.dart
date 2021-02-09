import 'package:flutter/material.dart';
import 'package:railway_admin/utils/colors_file.dart';


void CustomSnackBar(GlobalKey<ScaffoldState> scaffoldKey,BuildContext context,String content){
  scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        duration: Duration(seconds: 3),
        elevation: 6.0,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            Icon(Icons.insert_emoticon,
                color: blackColor),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child:  Text(
                "${content.toString()}",
                style: TextStyle(
                    color: blackColor),
              ) ,
            ),
          ],
        ),
      )
  );
}