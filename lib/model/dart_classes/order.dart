class Order {
  final String pillNo;
  final num price;
  final num commession;
  final num totalPrice;
  final int noOfItems;

  const Order(
      {required this.commession,
      required this.price,
      required this.noOfItems,
      required this.pillNo})
      : totalPrice = price + commession;
}
