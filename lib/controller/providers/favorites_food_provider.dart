import 'dart:developer';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model/objects/food_item.dart';

final favortiesFoodProvider =
    StateNotifierProvider<_FavoritesProvider, Set<FoodItem>>(
        (ref) => _FavoritesProvider(<FoodItem>{}));

class _FavoritesProvider extends StateNotifier<Set<FoodItem>> {
  _FavoritesProvider(super.state);

  void addFavortieItem(FoodItem item) {
    state.add(item);
    log('$state');
  }

  void removeFavoriteItem(FoodItem item) {
    state.isNotEmpty ? state.remove(item) : null;
    log('$state');
  }

  void clearFavorites() => state.clear();
}
