class OrangeFees {
  /// Transfer to Orange Mobile
  static String transfer(String amountStr) {
    // String -> int
    final amount = int.parse(amountStr);

    if (50 < amount && amount < 6500) {
      var fee = amount * 1 / 100;
      return fee.toStringAsFixed(2);
    } else if (6501 < amount && amount < 10000) {
      return '50';
    } else if (10001 < amount && amount < 13500) {
      return '100';
    } else if (13501 < amount && amount < 25000) {
      return '150';
    } else if (25001 < amount && amount < 50000) {
      return '150';
    } else if (50001 < amount && amount < 80000) {
      return '200';
    } else if (80001 < amount && amount < 100000) {
      return '200';
    } else if (100001 < amount && amount < 200000) {
      return '300';
    } else if (200001 < amount && amount < 300000) {
      return '300';
    } else if (300001 < amount && amount < 400000) {
      return '300';
    } else if (400001 < amount && amount < 500000) {
      return '400';
    } else if (500001 < amount && amount < 1000000) {
      return '500';
    } else {
      return '0';
    }
  }

  /// Withdrawal from Orange Money Account
  static String om(String amountStr) {
    // String -> int
    final amount = int.parse(amountStr);

    if (50 < amount && amount < 6500) {
      var fee = amount * 3 / 100;
      return fee.toStringAsFixed(2);
    } else if (6501 < amount && amount < 10000) {
      return '180';
    } else if (10001 < amount && amount < 13500) {
      return '300';
    } else if (13501 < amount && amount < 25000) {
      return '350';
    } else if (25001 < amount && amount < 50000) {
      return '700';
    } else if (50001 < amount && amount < 80000) {
      return '1350';
    } else if (80001 < amount && amount < 100000) {
      return '1800';
    } else if (100001 < amount && amount < 200000) {
      return '2150';
    } else if (200001 < amount && amount < 300000) {
      return '2600';
    } else if (300001 < amount && amount < 400000) {
      return '3100';
    } else if (400001 < amount && amount < 500000) {
      return '3600';
    } else if (500001 < amount && amount < 1000000) {
      // Not available for reglementary reasons
      return '0';
    } else {
      return '0';
    }
  }

  /// Transfer to a non Orange customer
  static String nonOM(String amountStr) {
    // String -> int
    final amount = int.parse(amountStr);

    if (50 < amount && amount < 6500) {
      var fee = amount * 4 / 100;
      return fee.toStringAsFixed(2);
    } else if (6501 < amount && amount < 10000) {
      return '250';
    } else if (10001 < amount && amount < 13500) {
      return '400';
    } else if (13501 < amount && amount < 25000) {
      return '525';
    } else if (25001 < amount && amount < 50000) {
      return '900';
    } else if (50001 < amount && amount < 80000) {
      return '1700';
    } else if (80001 < amount && amount < 100000) {
      return '2300';
    } else if (100001 < amount && amount < 200000) {
      return '2700';
    } else if (200001 < amount && amount < 300000) {
      return '3100';
    } else if (300001 < amount && amount < 400000) {
      return '3600';
    } else if (400001 < amount && amount < 500000) {
      return '4000';
    } else if (500001 < amount && amount < 1000000) {
      // Not available for reglementary reasons
      return '0';
    } else {
      return '0';
    }
  }
}
