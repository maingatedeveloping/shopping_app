import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  TextButton(
                    onPressed: () {
                      if (cart.items.isEmpty) return;
                      Provider.of<Orders>(
                        context,
                        listen: false,
                      ).addItemToOders(
                          cart.items.values.toList(), cart.totalAmount);
                      cart.clearItems();
                    },
                    child: const Text(' ORDER NOW'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          cart.items.isEmpty
              ? const Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: Text(
                    'Your cart is empty!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final cartItemValues = cart.items.values.toList();
                    return CartItemDescription(
                      cartItemValues[index].id,
                      cartItemValues[index].price,
                      cartItemValues[index].quantity,
                      cartItemValues[index].title,
                      cart.items.keys.toList()[index],
                    );
                  },
                ))
        ],
      ),
    );
  }
}
