import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation/model/objects/food_item.dart';

class MenuItem extends StatefulWidget {
  FoodItem foodItem;
  MenuItem({super.key, required this.foodItem});

  @override
  State<StatefulWidget> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  
  @override
  Widget build(BuildContext context) {
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
                InkWell(
                  onDoubleTap: () {
                    setState(() {
                      widget.foodItem.isLiked = !widget.foodItem.isLiked;
                    });
                  },
                  child: Image.asset(
                    widget.foodItem.imageUri,
                    width: 250,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    right: 10,
                    top: 10,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.foodItem.isLiked = !widget.foodItem.isLiked;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: FaIcon(
                          FontAwesomeIcons.solidHeart,
                          color: widget.foodItem.isLiked
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
            child: Text(widget.foodItem.name),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(' \$${widget.foodItem.price}'),
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
                        widget.foodItem.rating.toString(),
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
                Text(widget.foodItem.time),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
