import 'package:bike_rental/Providers/cart_item.dart';
import 'package:bike_rental/Providers/cart_provider.dart';
import 'package:bike_rental/Screens/bike_details_screen.dart';
import 'package:bike_rental/Screens/bikes_overview_screen.dart';
import 'package:bike_rental/Screens/cart_detail_screen.dart';
import 'package:bike_rental/app_rotes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: ChangeNotifierProvider(
        create: (BuildContext context) => CartItem(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BikeOverviewScreen(),
          routes: {
            AppRoutes.BIKE_DETAILS: (context) => BikeDetailsScreen(),
            AppRoutes.CART_DETAIL: (context) => CartDetailScreen(),
          },
        ),
      ),
    );
  }
}