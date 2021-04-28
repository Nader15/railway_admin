import 'package:flutter/material.dart';
import 'package:railway_admin/utils/colors_file.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors_file.dart';
import 'responsive_widget.dart';
import '../config/constants.dart';
import '../config/styles.dart';
import '../config/colors.dart';

class About extends StatelessWidget {
  final String _description =
      "an application that enable travellers to make their trip more easy.";

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        desktopScreen: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
            vertical: 100,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Container(
                  color: AppColors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.asset(
                      'app_images/train.png',
                      fit: BoxFit.cover,
                      color: whiteColor,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'ABOUT APPLICATION',
                style: TextStyle(
                  color: AppColors.yellow,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                _description,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.black.withOpacity(.7),
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

            ],
          ),
        ),
        mobileScreen: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
            vertical: 50,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Container(
                  color: AppColors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.asset(
                      'app_images/train.png',
                      fit: BoxFit.cover,
                      color: whiteColor,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                  'ABOUT APPLICATION',
                style: TextStyle(
                  color: AppColors.yellow,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                _description,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.black.withOpacity(.7),
                      fontSize: 13,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

            ],
          ),
        ),
      );
}
