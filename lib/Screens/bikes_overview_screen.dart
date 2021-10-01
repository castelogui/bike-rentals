import 'package:bike_rental/Components/bike_grid_item.dart';
import 'package:bike_rental/Mocks/mock_bike.dart';
import 'package:bike_rental/Models/bike.dart';
import 'package:flutter/material.dart';

class BikeOverviewScreen extends StatefulWidget {
  const BikeOverviewScreen({Key? key}) : super(key: key);

  @override
  _BikeOverviewScreenState createState() => _BikeOverviewScreenState();
}

class _BikeOverviewScreenState extends State<BikeOverviewScreen> {

  final List<Bike> bikes = MOCK_BIKES;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bike Rentals"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: GridView.builder(
        itemCount: bikes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (context, index){
          return BikeGriItem(bikes[index]);
        },
      )
    );
  }
}
