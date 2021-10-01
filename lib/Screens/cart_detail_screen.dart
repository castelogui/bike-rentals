import 'package:bike_rental/Models/bike.dart';
import 'package:bike_rental/Providers/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartDetailScreen extends StatelessWidget {
  const CartDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    final List<Bike> bikes = Provider.of<CartItem>(context).bikes;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Aluguel'),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, int index) => const Divider(),
              itemCount: bikes.length,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    trailing: GestureDetector(
                      onTap: (){
                        cartProvider.removeBike(bikes[index]);
                      },
                      child: Icon(Icons.remove_shopping_cart_rounded)
                    ),
                    title: Text('${bikes[index].nome}'),
                  ),
                );
              },
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black87),
              ),
              onPressed: (){},
              icon: Icon(Icons.shopping_cart_rounded, color: Colors.amber,),
              label: Text('Ir para pagamento'),
            )
          ],
        ),
      ),
    );
  }
}
