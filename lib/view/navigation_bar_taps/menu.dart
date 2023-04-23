import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/providers/food_items_provider.dart';
import '../../controller/providers/sort_menu_provider.dart';
import '../../model/utility/constants.dart';
import '../components/menu_item.dart';

class MyMenu extends ConsumerWidget {
  const MyMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SortItemType sortType = ref.watch(sortMenuProvider); 
    switch (sortType) {
      case SortItemType.sortByAlpha:
        {
          ref.watch(listProvider.notifier).sortByName();
          break;
        }
      case SortItemType.sortByPrice:
        {
          ref.watch(listProvider.notifier).sortByPrice();
          break;
        }
      case SortItemType.none:
        {
          ref.watch(listProvider.notifier).update(newState: foodItem);
          break;
        }
    }

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
          return Animate(
            effects: const [
              FadeEffect(duration: Duration(milliseconds: 500)),
              SlideEffect(duration: Duration(milliseconds: 400)),
            ],
            child: MenuItem(
              foodItem: ref.watch(listProvider)[index],
            ),
          );
        },
        itemCount: ref.watch(listProvider).length,
      ),
    );
  }
}
