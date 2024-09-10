import 'package:checkout_app/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/checkout/presentation/manager/checkout_cubit.dart';
import 'package:checkout_app/checkout/presentation/manager/checkout_state.dart';
import 'package:checkout_app/checkout/presentation/view/thank_you_view.dart';
import 'package:checkout_app/checkout/presentation/view/widgets/payment_method_list_view.dart';
import 'package:checkout_app/core/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocConsumer<CheckoutCubit, CheckoutState>(
            listener: (context, state) {
              if (state is CheckoutSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThankYouView(),
                  ),
                );
              }
              if (state is CheckoutError) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(child: Text(state.message)),
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state is CheckoutLoading,
                onTap: () {
                  PaymentIntentInputModel paymentIntentInput =
                      PaymentIntentInputModel(
                    amount: 100 * 100,
                    currency: 'usd',
                  );
                  BlocProvider.of<CheckoutCubit>(context)
                      .makePayment(paymentIntentInput: paymentIntentInput);
                },
                title: 'Continue',
                borderRadius: BorderRadius.circular(15),
              );
            },
          ),
        ],
      ),
    );
  }
}
