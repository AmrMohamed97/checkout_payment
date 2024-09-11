abstract class CheckoutState {}
class CheckoutInitial extends CheckoutState {}
class CreateCustomerLoading extends CheckoutState {}
class CreateCustomerSuccess extends CheckoutState {}
class CreateCustomerError extends CheckoutState {
   final String message;
  CreateCustomerError({required this.message});
}
class CheckoutLoading extends CheckoutState {}
class CheckoutSuccess extends CheckoutState {}
class CheckoutError extends CheckoutState {
  final String message;
  CheckoutError({required this.message});
}


class EphemeralKeyLoading extends CheckoutState {}
class EphemeralKeySuccess extends CheckoutState {}
class EphemeralKeyError extends CheckoutState {
  final String message;
  EphemeralKeyError({required this.message});
}

