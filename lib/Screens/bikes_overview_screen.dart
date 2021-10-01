import 'package:bike_rental/Components/bike_grid_item.dart';
import 'package:bike_rental/Mocks/mock_bike.dart';
import 'package:bike_rental/Models/bike.dart';
import 'package:bike_rental/Providers/cart_item.dart';
import 'package:bike_rental/app_rotes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed(AppRoutes.CART_DETAIL);
              },
              icon: Icon(Icons.pedal_bike)
          ),
          Consumer<CartItem>(
            builder: (context, cartItem, _) => Text(
              cartItem.total.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: Colors.amber
              ),
            )
          ),
          SizedBox(
            width: 22,
          )
        ],
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
