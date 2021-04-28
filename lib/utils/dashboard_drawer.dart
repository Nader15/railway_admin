import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ApiFunctions/shared.dart';
import '../ui/home.dart';
import 'colors_file.dart';
import 'colors_file.dart';
import 'colors_file.dart';
import 'colors_file.dart';
import 'colors_file.dart';
import 'global_vars.dart';
import 'navigator.dart';

class CustomHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 30,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              onDetailsPressed: () => debugPrint('hello'),
              accountName: Text("${userName}"),
              accountEmail: Text("${userEmail}"),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('app_images/drawerBackground.jpg'),
                  alignment: Alignment(0, 0.6),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: Container(
                padding: EdgeInsets.all(5),
                height: 5,
                // width: 10,
                decoration: BoxDecoration(
                  color: whiteColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 35,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0),
              color: blueAppColor,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.supervised_user_circle_rounded,
                        color: whiteColor),
                    trailing: Icon(Icons.arrow_forward, color: whiteColor),
                    title: Text(
                      'Users',
                      style: TextStyle(color: whiteColor),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.airline_seat_recline_normal,
                        color: whiteColor),
                    trailing: Icon(Icons.arrow_forward, color: whiteColor),
                    title: Text(
                      'Trips',
                      style: TextStyle(color: whiteColor),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.sticky_note_2,
                        color: whiteColor),
                    trailing: Icon(Icons.arrow_forward, color: whiteColor),
                    title: Text(
                      'Tickets',
                      style: TextStyle(color: whiteColor),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.train,
                        color: whiteColor),
                    trailing: Icon(Icons.arrow_forward, color: whiteColor),
                    title: Text(
                      'Trains',
                      style: TextStyle(color: whiteColor),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.phone, color: whiteColor),
                    title: Text(
                      'Contact Us',
                      style: TextStyle(
                           color: whiteColor),
                    ),
                    onTap: () {
                      launch("tel://5050");
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.help, color: whiteColor),
                    title: new RichText(
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text: 'Help',
                            style: new TextStyle(
                                color: whiteColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.power_settings_new, color: Colors.red),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: redColor),
                    ),
                    onTap: () {
                      clearAllData().then((value) {
                        navigateAndClearStack(context, Home());
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
