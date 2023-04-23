class FoodItem extends Comparable<FoodItem> {
  bool isLiked;
  final String name;
  final double price;
  final double rating;
  final String imageUri;
  final String time;

  FoodItem(
      {required this.imageUri,
      required this.price,
      required this.rating,
      required this.time,
      required this.name,
      this.isLiked = false});

  @override
  int compareTo(other) {
    if (sortByName(other.name) == 0) {
      return 0;
    } else if (sortByName(other.name) < 0) {
      return -1;
    } else {
      return 1;
    }
  }

  int sortByName(String otherName) {
    List<int> codeUnits = otherName.codeUnits;
    for (var i = 0; i < otherName.length && i < name.length; i++) {
      if (name.codeUnitAt(i) < codeUnits[i]) {
        return -1;
      } else if (name.codeUnitAt(i) > codeUnits[i]) {
        return 1;
      }
    }
    return 0;
  }
}
