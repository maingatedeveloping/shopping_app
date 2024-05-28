import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    //so here, we can use the normal approach and set the listen to false and also use the consumer for the toggle favorite. So that the toggleFavorite would be the only widget that would run when the notifyListerners run.
    final productItem = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    final products = Provider.of<Products>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (context, product, child) => IconButton(
              onPressed: () {
                product.toggleFavorite();
                products.addFav(productItem);
              },
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
          ),
          title: Text(
            productItem.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () => cart.addItem(
                productItem.id, productItem.price, productItem.title),
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ),
        child: InkWell(
          onTap: () {
            navigateToDetailsScreen(context, productItem.id);
          },
          child: CachedNetworkImage(
            imageUrl: productItem.imageUrl,
            progressIndicatorBuilder: (context, url, progress) {
              return const FittedBox(
                fit: BoxFit.scaleDown,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  backgroundColor: Colors.black,
                ),
              );
            },
            errorWidget: (context, url, error) {
              return const Icon(
                Icons.error,
                color: Colors.white,
              );
            },
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void navigateToDetailsScreen(BuildContext context, String id) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return ProductDetailScreen(id);
      }),
    );
  }
}
