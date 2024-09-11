import 'dart:developer';
import 'package:checkout_app/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_app/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/checkout/data/repo/checkout_repo.dart';
import 'package:checkout_app/checkout/presentation/manager/checkout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.checkoutRepo) : super(CheckoutInitial());
  final CheckoutRepo checkoutRepo;
  String? ephemeralKey;
  String? customerId;
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

  Future<void> createCustomer({required String name}) async {
    emit(CreateCustomerLoading());
    var data = await checkoutRepo.createCustomer(name: name);
    data.fold(
      (failure) {
        log('===========error==================');
        log(failure.message);
        emit(CreateCustomerError(message: failure.message));
      },
      (customerModel) {
        customerId = customerModel.id;
        emit(CreateCustomerSuccess());
      },
    );
  }

  Future<void> createEphemeralKey({required String customerId}) async {
    emit(EphemeralKeyLoading());
    var data = await checkoutRepo.createEphemeralKey(customerId: customerId);
    data.fold(
      (failure) {
        log('===========error==================');
        log(failure.message);
        emit(EphemeralKeyError(message: failure.message));
      },
      (ephemeralKeyModel) {
        ephemeralKey = ephemeralKeyModel.secret;
        emit(EphemeralKeySuccess());
      },
    );
  }
}
