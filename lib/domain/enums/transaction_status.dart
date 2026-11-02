enum TransactionStatus {
  completed,
  voided;

  String get storageValue => switch (this) {
        TransactionStatus.completed => 'completed',
        TransactionStatus.voided => 'voided',
      };

  static TransactionStatus fromStorage(String value) => switch (value) {
        'completed' => TransactionStatus.completed,
        'voided' => TransactionStatus.voided,
        _ => TransactionStatus.completed,
      };
}
