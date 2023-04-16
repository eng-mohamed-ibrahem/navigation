class FoodItem {
  bool isLiked;
  final String name;
  final double price;
  final double rating;
  final String imageUri;
  final String time;

  FoodItem({
    required this.imageUri,
    required this.price,
    required this.rating,
    required this.time,
    required this.name,
    this.isLiked = false
  });


}
