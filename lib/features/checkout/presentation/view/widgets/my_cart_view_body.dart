import 'package:checkout_app/core/widgets/custom_button.dart';
 import 'package:checkout_app/features/checkout/presentation/view/widgets/cart_info_item.dart';
import 'package:checkout_app/features/checkout/presentation/view/widgets/payment_method_list_view.dart';
import 'package:checkout_app/features/checkout/presentation/view/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(child: Image.asset('assets/images/cart.png')),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'$42.97',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'$0',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'$8',
          ),
          const SizedBox(
            height: 3,
          ),
          const Divider(
            thickness: 2,
            color: Color(0xffC7C7C7),
            height: 34,
            endIndent: 15,
            indent: 15,
          ),
          const TotalPriceWidget(
            title: 'Total',
            value: r'$50.97',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => const PaymentDetailsView()));
              showModalBottomSheet(
                context: context,
                builder: (context) => const PaymentMethodBottomSheet(),
              );
            },
            title: 'Complete Payment',
            borderRadius: BorderRadius.circular(14),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

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
              title: 'Continue', borderRadius: BorderRadius.circular(15)),
        ],
      ),
    );
  }
}
