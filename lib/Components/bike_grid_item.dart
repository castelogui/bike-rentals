import 'package:bike_rental/Models/bike.dart';
import 'package:bike_rental/Providers/cart_item.dart';
import 'package:bike_rental/app_rotes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BikeGriItem extends StatelessWidget {

  final Bike bike;
  BikeGriItem(this.bike);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(AppRoutes.BIKE_DETAILS, arguments: bike);
      },
      child: GridTile(
        child: Image(image: CachedNetworkImageProvider(bike.imagemURL), fit: BoxFit.cover,),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            "${bike.nome}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.left,
          ),
          subtitle: Text(
            "R\$ ${bike.preco}",
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w900
            ),
          ),
          trailing: GestureDetector(
            child: Icon(Icons.add_shopping_cart),
            onTap: (){
              cartProvider.addBike(bike);
              print('quantidade de bikes no cart: ${cartProvider.total}');
            },
          ),
        ),
      ),
    );
  }
}




