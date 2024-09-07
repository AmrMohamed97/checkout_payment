import 'package:checkout_app/checkout/presentation/view/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({
    super.key,
  });

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List paymentList = [
    'assets/images/card.svg',
    'assets/images/payPal.svg',
    // 'assets/images/applePay.svg',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: paymentList.asMap().entries.map((entry) {
          String image = entry.value;
          int index = entry.key;
          return Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: PaymentMethodItem(
                isActive: selectedIndex == index,
                image: image,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
