import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/objects/food_item.dart';

final favortiesFoodProvider =
    StateNotifierProvider<_favoritesProvider, List<FoodItem>>(
        (ref) => _favoritesProvider([]));

class _favoritesProvider extends StateNotifier<List<FoodItem>> {
  _favoritesProvider(super.state);

  void addFavortieItem(FoodItem item) => state.add(item);
  void removeFavoriteItem(FoodItem item) => state.remove(item);

  void clearFavorites() => state.clear();
}
