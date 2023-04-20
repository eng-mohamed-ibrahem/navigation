import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navigation/controller/providers/sort_menu_provider.dart';
import 'package:navigation/view/components/custom_drawer.dart';
import 'package:navigation/view/navigation_bar_taps/navigation_profile_tap.dart';
import 'package:navigation/view/navigation_bar_taps/activity.dart';
import 'package:navigation/view/navigation_bar_taps/menu.dart';
import '../../controller/providers/user_state_provider.dart';
import '../../model/utility/constants.dart';
import '../../model/objects/user.dart';

class CustomNavigationBar extends HookConsumerWidget {
  CustomNavigationBar({super.key});

  final AutoDisposeStateProvider<int> tapIndexProvider =
      StateProvider.autoDispose<int>(
    (ref) => 0,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int tapIndex = ref.read(tapIndexProvider);
    final User? user = ref.watch(userStateProvider);
    final List<Widget> taps = [
      const MyMenu(),
      const Activity(),
      NavProfile(user: user)
    ];

    return Scaffold(
      appBar: AppBar(
        actions: tapIndex == 0
            ? [
                InkWell(
                  onTap: () {
                    // create search bar
                  },
                  child: const Icon(Icons.search),
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.sort_rounded),
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  itemBuilder: (contex) =>
                      const <PopupMenuEntry<SortItemValue>>[
                    PopupMenuItem(
                      padding: EdgeInsets.only(bottom: 5),
                      value: SortItemValue.sortByAlpha,
                      child: Icon(FontAwesomeIcons.arrowUpZA),
                    ),
                    PopupMenuItem(
                      value: SortItemValue.sortByPrice,
                      child: Icon(FontAwesomeIcons.arrowUp91),
                    ),
                    PopupMenuItem(
                      value: SortItemValue.none,
                      child: Icon(FontAwesomeIcons.filterCircleXmark),
                    ),
                  ],
                  onSelected: (item) {
                    // update sortion only, not rebuild now
                    switch (item) {
                      case SortItemValue.sortByAlpha:
                        {
                          ref
                              .read(sortMenuProvider.notifier)
                              .update((state) => SortItemValue.sortByAlpha);
                          break;
                        }

                      case SortItemValue.sortByPrice:
                        {
                          ref
                              .read(sortMenuProvider.notifier)
                              .update((state) => SortItemValue.sortByPrice);
                          break;
                        }
                      case SortItemValue.none:
                        {
                          ref
                              .read(sortMenuProvider.notifier)
                              .update((state) => SortItemValue.none);
                          break;
                        }
                    }
                  },
                )
              ]
            : null,
      ),
      drawer: const CustomDrawer(),
      body: taps[tapIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Me')
        ],
        currentIndex: tapIndex, // to active selected tap in navigationBar
        onTap: (index) {
          ref.watch(tapIndexProvider.notifier).update((state) => index);
        },
      ),
    );
  }
}
