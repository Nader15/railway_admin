import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railway_admin/ui/clients/clients_screen.dart';
import 'package:railway_admin/ui/responsive_widget.dart';
import 'package:railway_admin/ui/tickets/tickets_screen.dart';
import 'package:railway_admin/ui/trips/trips_screen.dart';
import 'package:railway_admin/utils/colors_file.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Widget> Containers = [
    Clients(),
    Trips(),
    Tickets(),
    Container(
      alignment: Alignment.center,
      child: Text("Trains"),
    ),
  ];

  List myTabs = <Widget>[
    Tab(
      text: "Clients",
    ),
    Tab(
      text: "Trips",
    ),
    Tab(
      text: "Tickets",
    ),
    Tab(
      text: "Trains",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        desktopScreen: Scaffold(
          backgroundColor: CupertinoColors.inactiveGray,
          body: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Railway System",
                  style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                PreferredSize(
                  preferredSize: Size(10, 100),
                  child: Container(
                      width: 400,
                      child: Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            )),
                        child: TabBar(
                            controller: _tabController,
                            indicatorPadding:
                                EdgeInsets.only(right: 20, left: 20),
                            unselectedLabelColor: greyColorXd,
                            indicatorColor: blackColor,
                            labelColor: whiteColor,
                            tabs: myTabs),
                      )),
                ),
                Container(
                  height: 480,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                  ),
                  child: TabBarView(
                    controller: _tabController,
                    children: Containers,
                  ),
                ),

                // Row(
                //   children: [
                //     tabBar("Clients",Icon(Icons.supervised_user_circle_rounded,color: blackColor,),whiteColor,blackColor),
                //     tabBar("Trips",Icon(Icons.format_align_justify_outlined,color: whiteColor,),blackColor,whiteColor),
                //     tabBar("Trains",Icon(Icons.train,color: whiteColor,),blackColor,whiteColor),
                //   ],
                // ),
                // Container(
                //   height: 400,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //     color: whiteColor
                //   ),
                // )
              ],
            ),
          ),
        ),
        mobileScreen: Scaffold(
          backgroundColor: primaryAppColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Railway System",
                style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    tabBar(
                        "Clients",
                        Icon(
                          Icons.supervised_user_circle_rounded,
                          color: blackColor,
                        ),
                        whiteColor,
                        blackColor),
                    tabBar(
                        "Trips",
                        Icon(Icons.format_align_justify_outlined,
                            color: whiteColor),
                        blackColor,
                        whiteColor),
                    tabBar(
                        "Trains",
                        Icon(
                          Icons.train,
                          color: whiteColor,
                        ),
                        blackColor,
                        whiteColor),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget tabBar(String title, Icon icon, Color color, Color color2) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 10),
      width: 150,
      height: 60,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            title,
            style: TextStyle(color: color2, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
