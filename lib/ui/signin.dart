import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:railway_admin/ApiFunctions/shared.dart';
import 'package:railway_admin/ui/dashboard.dart';
import 'package:railway_admin/ui/icon.dart';

import '../ApiFunctions/Api.dart';
import '../models/users.dart';
import '../utils/global_vars.dart';
import '../utils/navigator.dart';
import 'dashboard.dart';
import 'responsive_widget.dart';
import '../config/constants.dart';
import '../config/styles.dart';
import '../config/colors.dart';
import '../utils/extensions.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  UsersModel usersModel;

  bool _autoValidate = false;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scafoldState = new GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController(),
      _emailController = TextEditingController(),
      _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 100,
        ),
        child: Column(
          children: [
            Text('Sign in', style: AppStyles.title),
            Container(width: 100, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 250,right: 250),
              child: _buildSigininForm(context),
            )
          ],
        ),
      ),
      mobileScreen: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 100,
        ),
        child: Column(
          children: [
            Text(
              'Sign in',
              style: AppStyles.title,
              textAlign: TextAlign.center,
            ),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.yellow),
            const SizedBox(height: 20),
            Column(
              children: [
                const SizedBox(height: 50),
                _buildSigininForm(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(String imagePath, String title, String content) {
    return FittedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIcon(imagePath, color: AppColors.black.withOpacity(.7), size: 20),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                content,
                style: TextStyle(color: AppColors.black.withOpacity(.7)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSigininForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _emailController,
                validator: validateEmail,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                validator: validatePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  color: AppColors.yellow,
                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  onPressed: (){
                    _validateInputs();
                    if (_formKey.currentState.validate()) {
                      Api(context)
                          .userLogin(scafoldState, _emailController.text,
                          _passwordController.text)
                          .then((value) {
                        if (value is UsersModel) {
                          usersModel = value;
                          Future.delayed(Duration(seconds: 1), () {
                              setUserTocken(
                                auth_token: usersModel
                                    .token.plainTextToken
                                    .split("|")[1],
                                userId: usersModel.user.id,
                                userName: usersModel.user.name,
                                userEmail: usersModel.user.email,
                                userPhone: usersModel.user.phoneNumber,
                                userJoinedTime: usersModel.token.accessToken.createdAt,
                              )
                                  .then((value) {
                                UserTocken =
                                "Bearer ${usersModel.token.plainTextToken.split("|")[1]}";
                                userName = usersModel.user.name;
                                userEmail = usersModel.user.email;
                                userPhone = usersModel.user.phoneNumber;
                                userJoinedTime = usersModel.token.accessToken.createdAt;
                                userId = usersModel.user.id;
                                navigateAndKeepStack(
                                    context, Dashboard());
                                // navigateAndKeepStack(context,Competitions());
                              });

//talent_id: 46

                          });
                        } else {}
                      });
                    }
                  }
                  // {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => Dashboard()));
                  // },
                    ,
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _sendMail() async {
    bool isValidForm = _formKey.currentState.validate();
    if (!isValidForm) return;

    final mailto = Mailto(
      to: [AppConstants.mail],
      subject: _nameController.text.trim(),
      body: _passwordController.text.trim(),
    );

    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);
    String renderHtml(Mailto mailto) =>
        '''<html><head><title>mailto example</title></head><body><a href="$mailto">Open mail client</a></body></html>''';
    await for (HttpRequest request in server) {
      request.response
        ..statusCode = HttpStatus.ok
        ..headers.contentType = ContentType.html
        ..write(renderHtml(mailto));
      await request.response.close();
    }
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.length == 0)
      return 'You must enter your Email';
    else if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length == 0)
      return 'You must enter your Password';
    else if (value.length < 5)
      return 'Enter your Correct Password';
    else
      return null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
