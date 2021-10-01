import 'package:bike_rental/Models/bike.dart';
import 'package:bike_rental/Providers/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BikeDetailsScreen extends StatelessWidget {
  const BikeDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
    var cartProvider = Provider.of<CartItem>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('${bike.nome}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: CachedNetworkImageProvider(bike.imagemURL), fit: BoxFit.cover,),
            Text(
              "${bike.nome}",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w900,
                fontSize: 20
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: "${bike.descricao}",
                    style: TextStyle(
                      color: Colors.black87
                    ),
                  )
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black87),
              ),
              onPressed: (){
                cartProvider.addBike(bike);
              },
              icon: Icon(Icons.shopping_cart_rounded, color: Colors.amber,),
              label: Text('Alugar bike'),
            )
          ],
        ),
      ),
    );
  }
}

