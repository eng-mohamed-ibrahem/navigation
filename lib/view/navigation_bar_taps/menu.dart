import 'package:flutter/material.dart';

import '../../model/objects/food_item.dart';
import '../components/menu_item.dart';

class MyMenu extends StatefulWidget {
  const MyMenu({super.key});

  @override
  State<MyMenu> createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 250,
          mainAxisExtent: 320,
        ),
        itemBuilder: (context, index) {
          return MenuItem(
            foodItem: foodItem[index],
          );
        },
        itemCount: foodItem.length,
      ),
    );
  }
}

final List<FoodItem> foodItem = [
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Hamberger',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Spagty',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Shawarma',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Chicken',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Meal',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'ducks',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Hamberger',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Hamberger',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Hamberger',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Hamberger',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Hamberger',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Hamberger',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Hamberger',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Hamberger',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Hamberger',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Hamberger',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
];
