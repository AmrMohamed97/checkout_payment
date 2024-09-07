import 'package:checkout_app/checkout/presentation/view/widgets/payment_method_list_view.dart';
import 'package:checkout_app/core/custom_button.dart';
import 'package:flutter/material.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const PaymentMethodListView(),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            onTap: () {},
              title: 'Continue', 
              borderRadius: BorderRadius.circular(15),
              ),
        ],
      ),
    );
  }
}
