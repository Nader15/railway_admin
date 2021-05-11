import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:railway_admin/models/allUsers_model.dart';
import 'package:railway_admin/models/stations.dart';
import 'package:railway_admin/models/tickes_model.dart';
import 'package:railway_admin/models/trains_model.dart';
import 'package:railway_admin/models/trips.dart';
import 'package:railway_admin/models/users.dart';
import 'package:railway_admin/ui/home.dart';
import 'package:railway_admin/ui/splash.dart';
import 'package:railway_admin/utils/custom_snackBar.dart';
import 'package:railway_admin/utils/global_vars.dart';
import 'package:railway_admin/utils/navigator.dart';
import 'package:xs_progress_hud/xs_progress_hud.dart';

class Api {
  String baseUrl = 'https://railway-project.herokuapp.com/api/';
  String stationUrl = 'stations';
  String allUsersUrl = 'users';
  String tripsUrl = 'trips';
  String registerUrl = 'token/register';
  String loginUrl = 'token/login';
  String bookTicketUrl = 'tickets';
  String trainsUrl = 'trains';
  String walletUrl = 'wallet';

  BuildContext context;

  Api(@required this.context);

  Future allUsersApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + allUsersUrl;

    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: UserTocken
      },
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      return AllUsersModel.fromJson(dataContent);
    } else if (response.statusCode == 401) {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      // clearAllData();
      // navigateAndKeepStack(
      //     context,
      //     Scaffold(
      //       body: Center(
      //         child: Container(
      //           child: Text("Server error\nPlease LogOut and Login again"),
      //         ),
      //       ),
      //     ));
    } else {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      return false;
    }
  }

  Future stationApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + stationUrl;

    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: UserTocken
      },
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      return StationsModel.fromJson(dataContent);
    } else if (response.statusCode == 401) {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      // clearAllData();
      // navigateAndKeepStack(
      //     context,
      //     Scaffold(
      //       body: Center(
      //         child: Container(
      //           child: Text("Server error\nPlease LogOut and Login again"),
      //         ),
      //       ),
      //     ));
    } else {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      return false;
    }
  }

  Future tripsApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + tripsUrl;

    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: UserTocken
      },
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      return TripsModel.fromJson(dataContent);
    }
    else if (response.statusCode == 401) {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      // clearAllData();
      // navigateAndKeepStack(
      //     context,
      //     Scaffold(
      //       body: Center(
      //         child: Container(
      //           child: Text("Server error\nPlease LogOut and Login again"),
      //         ),
      //       ),
      //     ));
    } else {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      return false;
    }
  }

  Future userRegister(
      GlobalKey<ScaffoldState> _scaffoldKey,
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String phone,
      ) async {
    XsProgressHud.show(context);
    final String apiUrl = baseUrl + registerUrl;
    var data = {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "device_name": "Anonymous Device",
      "admin": "0",
      "phone_number": phone,
    };
    var userToJson = json.encode(data);
    final response = await http.post(
      apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: userToJson,
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();

    print("dataContent1:: ${dataContent}");
    print("dataContent2:: ${response.body.toString().contains('errors')}");

    if (!(response.body).toString().contains('errors')) {
      CustomSnackBar(
          _scaffoldKey, context, "Account Created Successfully");
      Future.delayed(Duration(seconds: 3), () {
        navigateAndClearStack(context, SplashScreen());
      });
      return UsersModel.fromJson(dataContent);
      print(json.decode(response.body));
    } else {
      CustomSnackBar(
          _scaffoldKey, context, dataContent["errors"].toString());
      return false;
    }
  }
  Future userLogin(GlobalKey<ScaffoldState> _scaffoldKey, String email,
      String password) async {
    XsProgressHud.show(context);
    final String apiUrl = baseUrl + loginUrl;
    var data = {
      "email": email,
      "password": password,
      "device_name": "device_name",
      "admin": "1",
    };
    var userToJson = json.encode(data);
    final response = await http.post(
      apiUrl,
      headers: {"Content-Type": "application/json"},
      body: userToJson,
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      print(dataContent.toString());
      return UsersModel.fromJson(dataContent);
    } else {
      CustomSnackBar(_scaffoldKey, context,
          json.decode(response.body)['errors'].toString());
      return false;
    }
  }

  Future addTripApi(
      GlobalKey<ScaffoldState> _scaffoldKey,
      dynamic departmentTime,
      dynamic arrivalTime,
      dynamic base,
      dynamic destination,
      dynamic priceA,
      dynamic priceB,
      dynamic priceC,
      ) async {
    XsProgressHud.show(context);
    final String apiUrl = baseUrl + tripsUrl;
    var data = {
      "depart_time": departmentTime,
      "arrival_time": arrivalTime,
      "base_id": base,
      "destination_id": destination,
      "train_id": "11",
      "priceA": priceA,
      "priceB": priceA,
      "priceC": priceA,

    };
    var userToJson = json.encode(data);
    final response = await http.post(
      apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: UserTocken
      },
      body: userToJson,
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();

    print("dataContent1:: ${dataContent}");
    print("dataContent2:: ${response.body.toString()}");

    if (!(response.body).toString().contains('error')) {
      CustomSnackBar(_scaffoldKey, context, dataContent.toString());
      Future.delayed(Duration(seconds: 3), () {
        navigateAndClearStack(context, SplashScreen());
      });
      return TripsModel.fromJson(dataContent);
    } else {
      CustomSnackBar(_scaffoldKey, context, dataContent.toString());
      return false;
    }
  }

  Future deleteTripApi(GlobalKey<ScaffoldState> _scaffoldKey, int Id) async {
    XsProgressHud.show(context);

    print(baseUrl + tripsUrl + "/$Id");
    final String apiUrl = baseUrl + tripsUrl + "/$Id";
    final response = await http.delete(
      apiUrl,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: UserTocken
      },
    );
    // Map<String, dynamic> dataContent = json.decode(response.body);
    // print("dataContent:: ${dataContent}");
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      print("body :" + json.decode(response.body).toString());
      // Navigator.pop(context);
      CustomSnackBar(_scaffoldKey, context,
          json.decode(response.body).toString());
      Future.delayed(Duration(seconds: 3), () {
        navigateAndClearStack(context, SplashScreen());
      });
      // CustomSnackBar(_scaffoldKey, context,
      //     json.decode(response.body)["success"].toString());
      return true;
    } else {
      print("body :" + json.decode(response.body).toString());
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      return false;
    }

  }
  Future deleteUserApi(GlobalKey<ScaffoldState> _scaffoldKey, int Id) async {
    XsProgressHud.show(context);

    print(baseUrl + tripsUrl + "/$Id");
    final String apiUrl = baseUrl + allUsersUrl + "/$Id";
    final response = await http.delete(
      apiUrl,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: UserTocken
      },
    );
    // Map<String, dynamic> dataContent = json.decode(response.body);
    // print("dataContent:: ${dataContent}");
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      print("body :" + json.decode(response.body).toString());
      Navigator.pop(context);
      // Future.delayed(Duration(seconds: 3), () {
      //   navigateAndClearStack(context, HomePage(currentIndex: 1));
      // });
      CustomSnackBar(_scaffoldKey, context,
          json.decode(response.body)["success"].toString());
      return true;
    } else {
      Navigator.pop(context);
      print("body :" + json.decode(response.body).toString());
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      return false;
    }

  }

  Future userTicketsApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + bookTicketUrl;

    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: UserTocken
      },
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      return TicketsModel.fromJson(dataContent);
    } else if (response.statusCode == 401) {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      // clearAllData();
      // navigateAndKeepStack(
      //     context,
      //     Scaffold(
      //       body: Center(
      //         child: Container(
      //           child: Text("Server error\nPlease LogOut and Login again"),
      //         ),
      //       ),
      //     ));
    } else {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      return false;
    }
  }

  Future getTrainsApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + trainsUrl;

    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: UserTocken
      },
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      return TrainsModel.fromJson(dataContent);
    } else if (response.statusCode == 401) {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      // clearAllData();
      // navigateAndKeepStack(
      //     context,
      //     Scaffold(
      //       body: Center(
      //         child: Container(
      //           child: Text("Server error\nPlease LogOut and Login again"),
      //         ),
      //       ),
      //     ));
    } else {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      return false;
    }
  }

  Future AddToWalletApi(GlobalKey<ScaffoldState> _scaffoldKey,String id , String wallet) async {
    XsProgressHud.show(context);
    final String apiUrl = baseUrl + walletUrl;
    var data = {
      "user_id": id,
      "wallet": wallet,
    };
    var userToJson = json.encode(data);
    final response = await http.post(
      apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: UserTocken
      },
      body: userToJson,
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      // Navigator.pop(context);
      CustomSnackBar(_scaffoldKey, context,
          response.body.toString());
      print(response.body.toString());
      Future.delayed(Duration(seconds: 3), () {
        navigateAndClearStack(context, SplashScreen());
      });
      return true;
    } else {
      CustomSnackBar(_scaffoldKey, context,
          json.decode(response.body));
      return false;
    }
  }

}
