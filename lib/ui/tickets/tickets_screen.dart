import 'package:flutter/material.dart';
import 'package:railway_admin/models/tickes_model.dart';
import 'package:railway_admin/ui/home.dart';
import 'package:railway_admin/utils/colors_file.dart';

import '../../ApiFunctions/Api.dart';

class Tickets extends StatefulWidget {
  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  TicketsModel ticketsModel;
  List<Success> ticketsList = List();

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
      Api(context).userTicketsApi(_scaffoldKey).then((value) {
        ticketsModel = value;
        ticketsModel.success.forEach((element) {
          setState(() {
            ticketsList.add(element);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ticketsList.length == 0
              ? Center(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 6),
                    child: Text("The System Has No Ticket. "),
                  ),
                )
              : Container(
                  // color: Colors.red,
                  height: 470,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: ListView.builder(
                    itemCount: ticketsList.length,
                    itemBuilder: (ctx, index) {
                      return tickets(index);
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
                        "Tickets Information",
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
                          "${ticketsList.length}",
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
                            "Add Ticket",
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
    );
  }

  Widget tickets(int index) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 20, top: 20),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'app_images/ticketIcon.png',
          height: 30,
        ),
      ),
      title: Text("${ticketsList[index].userData.name}"),
      subtitle: Text(
          "${ticketsList[index].tripData.trip.baseStation.name} - ${ticketsList[index].tripData.trip.destinationStation.name}"),
      trailing: Text("10113"),
      onTap: () {},
    );
  }
}
