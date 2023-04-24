import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/providers/favorites_food_provider.dart';
import '../../model/objects/food_item.dart';
import '../components/favorite_item_card.dart';

class FavoriteFood extends ConsumerWidget {
  const FavoriteFood({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Set<FoodItem> list = ref.watch(favortiesFoodProvider);

    if (list.isEmpty) {
      return const Center(
        child: Text('Your Favorites food will be added here'),
      );
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Stack(children: [
            FavoriteMenuItem(foodItem: list.elementAt(index)),
            Positioned(
              bottom: 50,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  list.elementAt(index).isLiked = false;
                  ref
                      .watch(favortiesFoodProvider.notifier)
                      .removeFavoriteItem(list.elementAt(index));
                },
                child: const Icon(Icons.clear_outlined),
              ),
            )
          ]);
        },
        itemCount: list.length,
      );
    }
  }
}
