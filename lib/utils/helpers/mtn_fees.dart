class MtnFees {
  /// Transfer to MTN MoMo
  static String transfer(String amountStr) {
    // String -> int
    final amount = int.parse(amountStr);

    if (1 < amount && amount < 10050) {
      var fee = amount * 1 / 100;
      return fee.toStringAsFixed(2);
    } else if (10051 < amount && amount < 13550) {
      return '100';
    } else if (13551 < amount && amount < 1000000) {
      return '125';
    } else {
      return '0';
    }
  }

  /// Withdrawal from MTN MoMo Account
  static String momo(String amountStr) {
    // String -> int
    final amount = int.parse(amountStr);

    if (100 < amount && amount < 5999) {
      var fee = amount * 3 / 100;
      return fee.toStringAsFixed(2);
    } else if (6000 < amount && amount < 10050) {
      return '175';
    } else if (10051 < amount && amount < 13550) {
      return '300';
    } else if (13551 < amount && amount < 25050) {
      return '350';
    } else if (25051 < amount && amount < 50050) {
      return '700';
    } else if (50051 < amount && amount < 75100) {
      return '1350';
    } else if (75101 < amount && amount < 100100) {
      return '1800';
    } else if (100101 < amount && amount < 200500) {
      return '2150';
    } else if (200501 < amount && amount < 300500) {
      return '2600';
    } else if (300501 < amount && amount < 400500) {
      return '3100';
    } else if (400501 < amount && amount < 500000) {
      return '3500';
    } else if (500001 < amount && amount < 1000000) {
      // Not available for reglementary reasons
      return '0';
    } else {
      return '0';
    }
  }

  /// Transfer to a non MTN customer
  static String nonMomo(String amountStr) {
    // String -> int
    final amount = int.parse(amountStr);

    if (1 < amount && amount < 100100) {
      var fee = amount * 3 / 100;
      return fee.toStringAsFixed(2);
    } else if (100101 < amount && amount < 200500) {
      return '3100';
    } else if (200501 < amount && amount < 400500) {
      return '3500';
    } else if (400501 < amount && amount < 500000) {
      return '4000';
    } else if (500001 < amount && amount < 1000000) {
      // Not available for reglementary reasons
      return '0';
    } else {
      return '0';
    }
  }

  /// Transfer CEMAC (Congo, Brazzville, Tchad et Gabon)
  static String cemacTransfer(String amountStr) {
    // String -> int
    final amount = int.parse(amountStr);

    if (1 < amount && amount < 50000) {
      return '2500';
    } else if (50001 < amount && amount < 100000) {
      return '5000';
    } else if (100001 < amount && amount < 300000) {
      return '7500';
    } else if (300001 < amount && amount < 50000) {
      return '9500';
    } else if (500001 < amount && amount < 1000000) {
      return '15000';
    } else {
      return '0';
    }
  }
}
