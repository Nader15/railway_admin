import 'package:flutter/material.dart';
import 'package:railway_admin/ui/responsive_widget.dart';
import 'package:railway_admin/utils/colors_file.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/constants.dart';
import '../config/colors.dart';
import '../utils/colors_file.dart';

class Header extends StatelessWidget {
  final String _name = "Railway System";
  final String _description =
      "an application that enable travellers to make their trip more easy .";

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        desktopScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: whiteColor
                ),
                child: Text(
                  _name,
                  style: TextStyle(
                    color: AppColors.yellow,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    _description,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Colors.grey[100],
                          fontSize: 17,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        mobileScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: FittedBox(
            child: Column(
              children: [
                Text(
                  _name,
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      _description,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Colors.grey[100],
                            fontSize: 15,
                            height: 1.8,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
