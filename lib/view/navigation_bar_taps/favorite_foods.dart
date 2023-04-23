import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/providers/favorites_food_provider.dart';
import '../../model/objects/food_item.dart';
import '../components/menu_item.dart';

class FavoriteFood extends ConsumerWidget {
  const FavoriteFood({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Set<FoodItem> list = ref.watch(favortiesFoodProvider);
    
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return MenuItem(foodItem: list.elementAt(index));
      },
      itemCount: list.length,
    );
  }
}
