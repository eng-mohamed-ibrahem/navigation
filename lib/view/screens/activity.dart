import 'package:flutter/material.dart';
import 'package:navigation/model/objects/order.dart';

import '../components/card_item.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer'),
        backgroundColor: const Color.fromRGBO(62, 84, 172, 1),
      ),
      body: Container(
        color: const Color.fromRGBO(236, 242, 255, 1),
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return CardItem(order: orders[index]);
          },
          itemCount: orders.length,
        ),
      ),
    );
  }
}

List<Order> orders = [
  const Order(
      pillNo: '576gdff8qaz3423', noOfItems: 1, price: 12.3, commession: 3),
  const Order(
      pillNo: '191kita35324423', noOfItems: 4, price: 40, commession: 12),
  const Order(
      pillNo: 'axc234128905hg23', noOfItems: 5, price: 70, commession: 22),
  const Order(
      pillNo: '356289093lpojj4d', noOfItems: 3, price: 43.3, commession: 19),
  const Order(
      pillNo: '786gtsp543r24423', noOfItems: 1, price: 54, commession: 33),
];
