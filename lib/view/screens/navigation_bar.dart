import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navigation/controller/providers/sort_menu_provider.dart';
import 'package:navigation/model/utility/utility_methods.dart';
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
  final AutoDisposeStateProvider<bool> isEditingProvider =
      AutoDisposeStateProvider<bool>(
    (ref) => false,
  );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int tapIndex = ref.watch(tapIndexProvider);
    final User? user = ref.watch(userStateProvider);
    final bool isEditing = ref.watch(isEditingProvider);

    final TextEditingController searchController = useTextEditingController();

    debugPrint('-$user-');

    final List<Widget> taps = [
      const MyMenu(),
      const Activity(),
      NavProfile(user: user)
    ];

    return Scaffold(
      appBar: AppBar(
        title: tapIndex == 0
            ? TextFormField(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                controller: searchController,
                onChanged: (value) {
                  ref
                      .watch(isEditingProvider.notifier)
                      .update((state) => value.isEmpty ? false : true);

                  ref.watch(listProvider.notifier).update(
                        (state) => search(items: foodItem, input: value),
                      );
                },
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: 'search',
                  suffixIcon: isEditing
                      ? InkWell(
                          onTap: () {
                            searchController.clear();
                            ref
                                .watch(listProvider.notifier)
                                .update((state) => foodItem);
                          },
                          child: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),
              )
            : null,
        actions: tapIndex == 0
            ? [
                PopupMenuButton(
                  icon: const Icon(Icons.sort_rounded),
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  itemBuilder: (contex) => const <PopupMenuEntry<SortItemType>>[
                    PopupMenuItem(
                      // padding: EdgeInsets.only(bottom: 5),
                      value: SortItemType.sortByAlpha,
                      child: FaIcon(
                        FontAwesomeIcons.arrowUpZA,
                        color: Colors.black,
                      ),
                    ),
                    PopupMenuItem(
                      value: SortItemType.sortByPrice,
                      child: FaIcon(
                        FontAwesomeIcons.arrowUp91,
                        color: Colors.black,
                      ),
                    ),
                    // PopupMenuItem(
                    //   value: SortItemType.none,
                    //   child: FaIcon(FontAwesomeIcons.filterCircleXmark),
                    // ),
                  ],
                  onSelected: (item) {
                    // update sortion only, not rebuild now
                    switch (item) {
                      case SortItemType.sortByAlpha:
                        {
                          ref
                              .watch(sortMenuProvider.notifier)
                              .update((state) => SortItemType.sortByAlpha);
                          break;
                        }

                      case SortItemType.sortByPrice:
                        {
                          ref
                              .watch(sortMenuProvider.notifier)
                              .update((state) => SortItemType.sortByPrice);
                          break;
                        }
                      case SortItemType.none:
                        {
                          // ref
                          //     .read(sortMenuProvider.notifier)
                          //     .update((state) => SortItemType.none);
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
