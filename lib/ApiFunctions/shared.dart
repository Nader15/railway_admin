import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/global_vars.dart';

String UserAuth="UserAuth";
String UserId="UserId";
String UserName="UserName";
String UserEmail="UserEmail";
String UserPhone="phone_number";
String UserJoinedTime="created_at";

Future<String> getUserTocken(BuildContext context,) async {
  // save the chosen locale
  var prefs = await SharedPreferences.getInstance();
  UserTocken="${prefs.getString(UserAuth)}";
  userId=prefs.getInt(UserId);
  userName=prefs.getString(UserName);
  userEmail=prefs.getString(UserEmail);
  userPhone=prefs.getString(UserPhone);
  userJoinedTime=prefs.getString(UserJoinedTime);

  print("userId  ${userId}");
  print("UserTocken  ${UserTocken}");
  return prefs.getString(UserAuth);

}

Future setUserTocken({String auth_token,int userId,String userName,String userEmail,String userPhone,String ,String userJoinedTime}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(UserAuth , "Bearer $auth_token");
  await prefs.setString(UserName , userName);
  await prefs.setString(UserEmail , userEmail);
  await prefs.setString(UserPhone , userPhone);
  await prefs.setString(UserJoinedTime , userJoinedTime);
  await prefs.setInt(UserId , userId);

}

Future clearAllData({String auth_token}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();

}