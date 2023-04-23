import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navigation/model/objects/food_item.dart';

class FavoriteMenuItem extends ConsumerWidget {
  final FoodItem foodItem;
  const FavoriteMenuItem({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side:
            const BorderSide(width: 1, color: Color.fromRGBO(173, 173, 173, 1)),
      ),
      child: Row(
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
                    child: Image.asset(
                      foodItem.imageUri,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  foodItem.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(' \$${foodItem.price}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const FaIcon(Icons.alarm),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(foodItem.time),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
