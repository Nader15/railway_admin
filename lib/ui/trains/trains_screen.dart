import 'package:flutter/material.dart';
import 'package:railway_admin/ApiFunctions/Api.dart';
import 'package:railway_admin/models/trains_model.dart';
import 'package:railway_admin/ui/home.dart';
import 'package:railway_admin/utils/colors_file.dart';

class Trains extends StatefulWidget {
  @override
  _TrainsState createState() => _TrainsState();
}

class _TrainsState extends State<Trains> {
  TrainsModel trainsModel;
  List<Success> trainsList = List();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


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
      Api(context).getTrainsApi(_scaffoldKey).then((value) {
        trainsModel = value;
        trainsModel.success.forEach((element) {
          setState(() {
            trainsList.add(element);
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

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Scaffold(
        key: _scaffoldKey,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            trainsList.length == 0
                ? Center(
              child: Container(
                child: Text("The System Has No Trains Yet . "),
              ),
            )
                : Container(
              // color: Colors.red,
              height: MediaQuery.of(context).size.height/1.2,
              width: MediaQuery.of(context).size.width / 2.5,
              child: ListView.builder(
                itemCount: trainsList.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.only(left: 20, top: 5),
                    leading:  CircleAvatar(
                      radius: 20,
                      backgroundColor: primaryAppColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'app_images/train.png',
                          color: whiteColor,
                        ),
                      ),
                    ),
                    title: Text(trainsList[index].type),
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
                            trainsList.length.toString(),
                            style: TextStyle(fontSize: 18),
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
                              onTap: () {},
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

  Widget Users() {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 20, top: 5),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: primaryAppColor,
        backgroundImage: AssetImage(
          'images/profileImage.jpg',
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
        ),
      ),
      title: Text("Mohamed " "Ahmed"),
      subtitle: Text("mohamed.ahmed@gmail.com"),
      trailing: IconButton(
          onPressed: () {},
          icon: Container(
            alignment: Alignment.center,
            width: 350,
            height: 30,
            child: DropdownButton(
              icon: Icon(Icons.linear_scale_rounded, color: blackColor),
              isExpanded: true,
              underline: SizedBox(),
              dropdownColor: whiteColor,
              style: TextStyle(color: blackColor),
              value: value,
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                  value == "delete"
                      ? Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home()))
                      : null;
                });
              },
              items: items.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
          )),
    );
  }
}
