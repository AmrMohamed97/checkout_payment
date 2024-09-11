class PaymentIntentInputModel {
  final String currency;
  final num amount;
  final String customer;
  final String ephemeralKey;
  PaymentIntentInputModel(
      {required this.ephemeralKey,
      required this.customer,
      required this.currency,
      required this.amount});
  toJson() {
    return {
      'currency': currency,
      'amount': amount,
      'customer': customer,
    };
  }
}
