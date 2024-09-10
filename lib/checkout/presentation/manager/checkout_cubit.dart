import 'dart:developer';

import 'package:checkout_app/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/checkout/data/repo/checkout_repo.dart';
import 'package:checkout_app/checkout/presentation/manager/checkout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.checkoutRepo) : super(CheckoutInitial());
  final CheckoutRepo checkoutRepo;
  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInput}) async {
    emit(CheckoutLoading());
    var data = await checkoutRepo.makePayment(
      paymentIntentInput: paymentIntentInput,
    );
    data.fold(
      (failure) {
        log('===========error==================');
        log(failure.message);
        emit(CheckoutError(message: failure.message));
      },
      (value) {
        emit(CheckoutSuccess());
      },
    );
  }
}
