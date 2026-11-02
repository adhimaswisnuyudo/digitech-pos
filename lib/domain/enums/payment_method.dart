enum PaymentMethod {
  cash;

  String get storageValue => switch (this) {
        PaymentMethod.cash => 'cash',
      };

  static PaymentMethod fromStorage(String value) => switch (value) {
        'cash' => PaymentMethod.cash,
        _ => PaymentMethod.cash,
      };
}
