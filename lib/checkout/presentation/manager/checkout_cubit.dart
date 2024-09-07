import 'dart:developer';

import 'package:checkout_app/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/checkout/data/repo/checkout_repo.dart';
import 'package:checkout_app/checkout/data/repo_impl/checkout_repo_impl.dart';
import 'package:checkout_app/checkout/presentation/manager/checkout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.checkoutRepo) : super(CheckoutInitial());
  final CheckoutRepo checkoutRepo ;
  Future<void> checkoutSuccess() async {
    emit(CheckoutLoading());
    var data =await checkoutRepo.makePayment(
        paymentIntentInput: PaymentIntentInputModel(
      amount: 100,
      currency: 'usd',
    ));
    data.fold(
      (failure) {
        emit(CheckoutError(message: failure.message));
      },
       (value) {
         emit(CheckoutSuccess());
       },
       );
  }
  @override
  void onChange(Change<CheckoutState> change) {
    log(onChange.toString());
    super.onChange(change);
  }
}
