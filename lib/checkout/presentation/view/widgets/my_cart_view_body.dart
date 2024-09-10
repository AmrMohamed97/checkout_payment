import 'package:checkout_app/checkout/data/repo_impl/checkout_repo_impl.dart';
import 'package:checkout_app/checkout/presentation/manager/checkout_cubit.dart';
import 'package:checkout_app/checkout/presentation/view/widgets/payment_method_bottom_sheet.dart';
import 'package:checkout_app/core/custom_button.dart';
import 'package:checkout_app/checkout/presentation/view/widgets/order_info_item.dart';
import 'package:checkout_app/checkout/presentation/view/widgets/payment_method_list_view.dart';
import 'package:checkout_app/checkout/presentation/view/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                builder: (context) => BlocProvider(
                  create: (context) => CheckoutCubit(CheckoutRepoImpl()),
                  child: const PaymentMethodBottomSheet(),
                ),
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
