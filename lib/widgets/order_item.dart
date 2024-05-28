import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:intl/intl.dart';

class OrderedPackage extends StatefulWidget {
  final OrderItem order;

  const OrderedPackage(this.order, {super.key});

  @override
  State<OrderedPackage> createState() => _OrderedPackageState();
}

class _OrderedPackageState extends State<OrderedPackage> {
  var expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                icon: Icon(expanded ? Icons.expand_less : Icons.expand_more)),
          ),
          expanded
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                          height:
                              min(widget.order.products.length * 20.0 + 10, 80),
                          child: ListView.builder(
                              itemCount: widget.order.products.length,
                              itemBuilder: (ctx, index) {
                                final product = widget.order.products[index];

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      product.title,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${product.quantity}x \$${product.price}',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                    )
                                  ],
                                );
                              })),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
