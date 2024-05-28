import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

import 'products.dart';

//acess Key bIKzjrPYFeax9UpMYIc0_zhIvi9wBqjCvNggGg7UWMw
//secret Key vttYewgxFRZfPkRUc-Jk_hMep-Jlnh6Y5byGI9_4KHs

class Products with ChangeNotifier {
  List<Product> get items {
    return [..._items];
  }

  final List<Product> listOfFavItems = [];

  void addFav(item) {
    if (listOfFavItems.contains(item)) {
      listOfFavItems.remove(item);
    } else {
      listOfFavItems.add(item);
    }
  }

  Product findById(String id) {
    return _items.firstWhere(
      (element) => element.id == id,
    );
  }

  void addProduc(value) {
    _items.add(value);
    notifyListeners();
  }

  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
        id: 'p5',
        title: 'Game Controller',
        description: 'Enjoy any kind of console game you want',
        price: 25.99,
        imageUrl:
            'https://images.unsplash.com/photo-1605835963874-a7c87f56259e?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(
      id: 'p6',
      title: 'Nike Air Force',
      description: 'So perfect and smooth to walk in.',
      price: 70.99,
      imageUrl:
          'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
      id: 'p7',
      title: 'Sunglasses',
      description: 'Balance your dressing with this.',
      price: 20.99,
      imageUrl:
          'https://images.unsplash.com/photo-1577803645773-f96470509666?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
      id: 'p8',
      title: 'V-neck Shirt',
      description: 'All your preferred colors are available.',
      price: 19.99,
      imageUrl:
          'https://images.unsplash.com/photo-1562157873-818bc0726f68?q=80&w=1254&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
      id: 'p9',
      title: 'Long Sleev Shirt',
      description: 'So quality and affordable',
      price: 49.99,
      imageUrl:
          'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?q=80&w=1336&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
        id: 'p10',
        title: 'Video Game Console',
        description: 'Sactisfy your soul with this at home.',
        price: 259.99,
        imageUrl:
            'https://images.unsplash.com/photo-1656789683996-602a5d669e82?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Q09OU09MRSUyMEdBTUV8ZW58MHx8MHx8fDA%3D'),
    Product(
      id: 'p11',
      title: 'macOS 14 Somana',
      description: 'Experience the world.',
      price: 999.99,
      imageUrl:
          'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1326&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
      id: 'p12',
      title: 'Iphone 14 pro max',
      description: 'Join those who use the ultimate phones.',
      price: 799.99,
      imageUrl:
          'https://images.unsplash.com/photo-1677563277026-17a254ea02f7?q=80&w=1364&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
      id: 'p13',
      title: 'Checkered Dress',
      description: 'Would be so nice ont you.',
      price: 49.99,
      imageUrl:
          'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?q=80&w=1376&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
      id: 'p14',
      title: 'Power Bank',
      description: 'So strong and protable.',
      price: 40.99,
      imageUrl:
          'https://media.istockphoto.com/id/1459160962/photo/power-bank-for-charging-mobile-devices-black-smart-phone-charger-isolated-on-white-background.jpg?s=612x612&w=is&k=20&c=0Uw6amjp_6Y6qAMQnFLFpUtZa0TK6agjJ16rzZOT_BI=',
    ),
  ];
}


 /* Future<List<Product>> fetchProduct() async {
    const String unsplashApiKey = 'bIKzjrPYFeax9UpMYIc0_zhIvi9wBqjCvNggGg7UWMw';
    //const String query = 'products';
    final response = await http.get(
      Uri.parse(
          'https://api.unsplash.com/photos/random?client_id=$unsplashApiKey'),
    );
    if (response.statusCode == 200) {
     List<dynamic> jsonData = json.decode(response.body);
     List<Product> products = jsonData.map((data) {
        return Product.fromJson(data);
      }).toList();
      return products; 
      
    } else {
      throw Exception('Fialed to load product');
    }
  } */

   /*  Future<List<Product>> fetchProduct() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final fetchedProducts =
          data.map((json) => Product.fromJson(json)).toList();
      return fetchedProducts;
    } else {
      throw Exception('Failed to load products');
    }
  } */

