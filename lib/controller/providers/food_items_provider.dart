import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model/objects/food_item.dart';

final listProvider = StateNotifierProvider<_FoodItemNotifier, List<FoodItem>>(
    (ref) => _FoodItemNotifier(ref));

class _FoodItemNotifier extends StateNotifier<List<FoodItem>> {
  StateNotifierProviderRef ref;
  _FoodItemNotifier(this.ref) : super(foodItem);

  void update({required List<FoodItem> newState}) => state = newState;

  void sortByName() {
    state.sort(
      (a, b) {
        return a.compareTo(b);
      },
    );
  }

  void sortByPrice() {
    state.sort(
      (a, b) {
        return b.price.compareTo(a.price);
      },
    );
  }
}

// original list
final List<FoodItem> foodItem = [
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Hamberger',
      price: 11.3,
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
      price: 4.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Chicken',
      price: 9.1,
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
      price: 3.5,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Lamb',
      price: 11,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Beef',
      price: 15,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Sage',
      price: 12.3,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Salmon',
      price: 20.2,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Kipper',
      price: 33,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Noodles',
      price: 54,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Spaghetti',
      price: 1.2,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Rice',
      price: 27,
      rating: 4.2,
      time: '10-13min'),
  FoodItem(
      imageUri: 'assets/images/humberger.jpg',
      name: 'Pizza',
      price: 0.3,
      rating: 4.2,
      time: '10-13min'),
];
