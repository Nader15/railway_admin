import 'package:flutter/material.dart';
import 'package:railway_admin/ApiFunctions/Api.dart';
import 'package:railway_admin/models/allUsers_model.dart';
import 'package:railway_admin/ui/home.dart';
import 'package:railway_admin/utils/colors_file.dart';

import '../../utils/colors_file.dart';
import '../../utils/colors_file.dart';

class Clients extends StatefulWidget {
  @override
  _ClientsState createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  AllUsersModel allUsersModel;
  List<Success> usersList = List();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var phoneCodeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 0), () {
      gettingData();
    });
//    showHud();
  }

  gettingData() {
    setState(() {
      Api(context).allUsersApi(_scaffoldKey).then((value) {
        allUsersModel = value;
        allUsersModel.success.forEach((element) {
          setState(() {
            usersList.add(element);
          });
        });
        // usersList = usersList.reversed.toList();
      });
    });
  }

  String value;
  List items = [
    "view",
    "update",
    "delete",
  ];

  var walletController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Scaffold(
        key: _scaffoldKey,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            usersList.length == 0
                ? Center(
                    child: Container(
                      child: Text("The System Has No Users Yet . "),
                    ),
                  )
                : Container(
                    // color: Colors.red,
                    height: MediaQuery.of(context).size.height / 1.2,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: ListView.builder(
                      itemCount: usersList.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Color(0xff1D1D1D),
                                    title: Text(
                                      "${usersList[index].name}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    actions: [
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Color(0xff1D1D1D),
                                                    title: Text(
                                                      "${usersList[index].name}",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                    actions: [
                                                      FlatButton(
                                                          onPressed: () {
                                                            Api(context)
                                                                .AddToWalletApi(
                                                                    _scaffoldKey,"${usersList[index].id}","${walletController.text}"
                                                                    );
                                                          },
                                                          child: Text(
                                                            "Confirm",
                                                          )),
                                                      FlatButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                            "cancel",
                                                          ))
                                                    ],
                                                    content: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      child: Center(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                              "Deposit",
                                                              style: TextStyle(
                                                                  color:
                                                                      whiteColor),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            TextFormField(
                                                              controller:
                                                                  walletController,
                                                              style: TextStyle(
                                                                  color:
                                                                      whiteColor),
                                                              cursorColor:
                                                                  primaryAppColor,
                                                              decoration:
                                                                  InputDecoration(
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    borderSide:
                                                                        BorderSide
                                                                            .none),
                                                                fillColor:
                                                                    primaryAppColor
                                                                        .withOpacity(
                                                                            0.1),
                                                                filled: true,
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                blueAppColor)),
                                                                hintText:
                                                                    "add here",
                                                                hintStyle:
                                                                    TextStyle(
                                                                        color:
                                                                            greyPrimaryColor),
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10),
                                                                // enabledBorder: InputBorder.none,
                                                                // border: OutlineInputBorder(
                                                                //     borderSide:
                                                                //         BorderSide(color: primaryAppColor, width: .8)),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Text(
                                            "Add Wallet",
                                          )),
                                      FlatButton(
                                          onPressed: () {
                                            Api(context).deleteUserApi(
                                                _scaffoldKey,
                                                usersList[index].id);
                                          },
                                          child: Text(
                                            "delete",
                                          )),
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "cancel",
                                          ))
                                    ],
                                    content: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Id: ${usersList[index].id}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Email : ${usersList[index].email}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Phone : ${usersList[index].phoneNumber}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Wallet : ${usersList[index].wallet} L.E",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Created at : ${usersList[index].createdAt.split(".")[0].split("T")[0]}  ${usersList[index].createdAt.split(".")[0].split("T")[1]}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          contentPadding: EdgeInsets.only(left: 20, top: 5),
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: grey,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.person,
                                color: whiteColor,
                              ),
                            ),
                          ),
                          title: Text(usersList[index].name),
                          subtitle: Text(usersList[index].email),
                        );
                      },
                    ),
                  ),
            VerticalDivider(
              thickness: 5,
              width: 10,
              color: primaryAppColor,
            ),
            Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width / 2.5,
                padding: EdgeInsets.only(bottom: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Clients Information",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Text(
                            "Count :",
                            style: TextStyle(fontSize: 18),
                          ),
                          title: Text(
                            usersList.length.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: TextFormField(
                            controller: nameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.name,
                            // validator: validateName,
                            style: TextStyle(color: blackColor),
                            cursorColor: primaryAppColor,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(.1),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                                hintText: 'Name',
                                hintStyle: TextStyle(color: greyPrimaryColor)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: TextFormField(
                            controller: phoneController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.name,
                            // validator: validateName,
                            style: TextStyle(color: blackColor),
                            cursorColor: primaryAppColor,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(.1),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                                hintText: 'Phone',
                                hintStyle: TextStyle(color: greyPrimaryColor)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: TextFormField(
                            controller: emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.name,
                            // validator: validateName,
                            style: TextStyle(color: blackColor),
                            cursorColor: primaryAppColor,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(.1),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                                hintText: 'Email',
                                hintStyle: TextStyle(color: greyPrimaryColor)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: TextFormField(
                            controller: passwordController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.name,
                            // validator: validateName,
                            style: TextStyle(color: blackColor),
                            cursorColor: primaryAppColor,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(.1),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                                hintText: 'Password',
                                hintStyle: TextStyle(color: greyPrimaryColor)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Add Client",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Api(context).userRegister(
                                    _scaffoldKey,
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text,
                                    passwordController.text,
                                    phoneController.text);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: blackColor,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: whiteColor,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  // Widget Users() {
  //   return ListTile(
  //     contentPadding: EdgeInsets.only(left: 20, top: 5),
  //     leading: CircleAvatar(
  //       radius: 20,
  //       backgroundColor: primaryAppColor,
  //       backgroundImage: AssetImage(
  //         'images/profileImage.jpg',
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //       ),
  //     ),
  //     title: Text("Mohamed " "Ahmed"),
  //     subtitle: Text("mohamed.ahmed@gmail.com"),
  //     trailing: IconButton(
  //         onPressed: () {},
  //         icon: Container(
  //           alignment: Alignment.center,
  //           width: 350,
  //           height: 30,
  //           child: DropdownButton(
  //             icon: Icon(Icons.linear_scale_rounded, color: blackColor),
  //             isExpanded: true,
  //             underline: SizedBox(),
  //             dropdownColor: whiteColor,
  //             style: TextStyle(color: blackColor),
  //             value: value,
  //             onChanged: (newValue) {
  //               setState(() {
  //                 value = newValue;
  //                 value == "delete"
  //                     ? Navigator.push(context,
  //                         MaterialPageRoute(builder: (context) => Home()))
  //                     : null;
  //               });
  //             },
  //             items: items.map((valueItem) {
  //               return DropdownMenuItem(
  //                 value: valueItem,
  //                 child: Text(valueItem),
  //               );
  //             }).toList(),
  //           ),
  //         )),
  //   );
  // }
}
