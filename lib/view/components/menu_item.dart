import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navigation/model/objects/food_item.dart';

class MenuItem extends ConsumerWidget {
  final FoodItem foodItem;
  MenuItem({super.key, required this.foodItem});

  final StateProvider<bool> isLikedProvider = StateProvider<bool>(
    (ref) => false,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLiked = ref.read(isLikedProvider);

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side:
            const BorderSide(width: 1, color: Color.fromRGBO(173, 173, 173, 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Animate(
                  effects: const [
                    FadeEffect(duration: Duration(milliseconds: 500)),
                    SlideEffect(duration: Duration(milliseconds: 400)),
                  ],
                  child: InkWell(
                    onDoubleTap: () {
                      foodItem.isLiked = !isLiked;
                      ref
                          .watch(isLikedProvider.notifier)
                          .update((state) => !isLiked);
                    },
                    child: Image.asset(
                      foodItem.imageUri,
                      width: 250,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    right: 10,
                    top: 10,
                    child: InkWell(
                      onTap: () {
                        foodItem.isLiked = !isLiked;
                        ref
                            .watch(isLikedProvider.notifier)
                            .update((state) => !isLiked);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: FaIcon(
                          FontAwesomeIcons.solidHeart,
                          color: foodItem.isLiked
                              ? Colors.red
                              : const Color.fromRGBO(173, 173, 173, 1),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(foodItem.name),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(' \$${foodItem.price}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Color.fromRGBO(173, 173, 173, 1),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        foodItem.rating.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const FaIcon(
                        FontAwesomeIcons.solidStar,
                        size: 15,
                        color: Color.fromRGBO(254, 213, 72, 1),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                const FaIcon(Icons.alarm),
                const SizedBox(
                  width: 5,
                ),
                Text(foodItem.time),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
