import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/providers/sort_menu_provider.dart';
import '../../model/utility/constants.dart';
import '../../model/objects/food_item.dart';
import '../components/menu_item.dart';

class MyMenu extends ConsumerWidget {
  const MyMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SortItemValue sortType = ref.watch(sortMenuProvider);

    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 250,
          mainAxisExtent: 320,
        ),
        itemBuilder: getSortType(sortType),
        itemCount: foodItem.length,
      ),
    );
  }
}

Widget? Function(BuildContext, int) getSortType(SortItemValue sortType) {
  switch (sortType) {
    case SortItemValue.sortByAlpha:
      {
        var list = sortByName();
        return (context, index) {
          return MenuItem(
            foodItem: list[index],
          );
        };
      }

    case SortItemValue.sortByPrice:
      {
        var list = sortByPrice();
        return (context, index) {
          return MenuItem(
            foodItem: list[index],
          );
        };
      }
    case SortItemValue.none:
      {
        return (context, index) {
          return MenuItem(
            foodItem: foodItem[index],
          );
        };
      }
  }
}

List<FoodItem> sortByName() {
  List<FoodItem> sortedNameList = foodItem.toList();
  sortedNameList.sort(
    (a, b) {
      return a.compareTo(b);
    },
  );
  return sortedNameList;
}

List<FoodItem> sortByPrice() {
  List<FoodItem> sortedPriceList = foodItem.toList();
  sortedPriceList.sort(
    (a, b) {
      return a.price.compareTo(b.price);
    },
  );
  return sortedPriceList;
}



// original list
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
      price: 10.3,
      rating: 1.2,
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
