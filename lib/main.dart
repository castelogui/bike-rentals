import 'package:bike_rental/Screens/bike_details_screen.dart';
import 'package:bike_rental/Screens/bikes_overview_screen.dart';
import 'package:bike_rental/app_rotes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BikeOverviewScreen(),
      routes: {
        AppRoutes.BIKE_DETAILS: (context) => BikeDetailsScreen(),
      },
    );
  }
}