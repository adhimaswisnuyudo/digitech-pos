enum OrderType {
  dineIn,
  takeaway;

  String get storageValue => switch (this) {
        OrderType.dineIn => 'dine_in',
        OrderType.takeaway => 'takeaway',
      };

  static OrderType fromStorage(String value) => switch (value) {
        'dine_in' => OrderType.dineIn,
        'takeaway' => OrderType.takeaway,
        _ => OrderType.dineIn,
      };
}
