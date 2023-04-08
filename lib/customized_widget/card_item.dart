import 'package:flutter/material.dart';
import 'package:navigation/customized_widget/custom_text.dart';
import '../dart_classes/order.dart';

class CardItem extends StatelessWidget {
  final Order order;

  const CardItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: const Color.fromRGBO(101, 93, 187, 1),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextButton(
                  onPressed: null,
                  child: CustomText(data: 'تتبع الكابتن', tbtn: true),
                ),
                TextButton(
                  onPressed: null,
                  child: CustomText(
                    data: 'الغاء الطلب',
                    tbtn: true,
                  ),
                ),
                TextButton(
                  onPressed: null,
                  child: CustomText(
                    data: 'التفاصيل',
                    tbtn: true,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  data: 'رقم الفاتورة : ${order.pillNo}',
                  tbtn: false,
                ),
                CustomText(
                  data: 'عدد الطلبات: ${order.noOfItems}',
                  tbtn: false,
                ),
                CustomText(
                  data: 'السعر: ${order.price}',
                  tbtn: false,
                ),
                CustomText(
                  data: 'العمولة: ${order.commession}',
                  tbtn: false,
                ),
                CustomText(
                  data: 'إجمالى المبلغ: ${order.totalPrice}',
                  tbtn: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
