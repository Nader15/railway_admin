import 'package:flutter/material.dart';
import 'package:railway_admin/ui/dashboard.dart';
import 'package:railway_admin/ui/splash.dart';
import 'package:railway_admin/ui/web_map/map_ui.dart';

import 'ui/home.dart';
import 'config/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Railway',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: AppColors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Home(),
      home: SplashScreen(),
      // home: TrainTracking(),
      // home: TrainTracking(),
    );
  }
}
