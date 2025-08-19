import 'dart:math';

import 'package:intl/intl.dart';


extension DoubleExtension on double {
  String get standardFormat {
    final format = NumberFormat.decimalPattern("en_US");
    return format.format(this);
  }

  String get rateFormat {
    final format = NumberFormat("#,##0.00", "en_US");
    return format.format(this);
  }

  String get shortRateFormat {
    final format = NumberFormat("#,##0.#", "en_US");
    return format.format(this);
  }
  
  String get shortNoDecimalRateFormat {
    final format = NumberFormat("##0", "en_US");
    return format.format(this);
  }

  String get currencyFormat {
    if (abs() > 999999) {
      return largeCurrencyFormat;
    } else {
      final format = NumberFormat.simpleCurrency(locale: "en_US");
      return format.format(this);
    }
  }

  String get largeCurrencyFormat {
    final valueLength = abs().toInt().toString().length;
    
    final unit = () {
      if (valueLength > 15) { return "Q"; }
      else if (valueLength > 12) { return "T"; }
      else if (valueLength > 9) { return "B"; }
      else { return "M"; }
    }();

    if (valueLength > 6) {
      final position = valueLength % 3 == 0 ? 3 : valueLength % 3; 
      final reducedValue = (abs() / pow(10, valueLength - 4)).toStringAsFixed(0);
      final formatted = reducedValue.substring(0, position) + "." + reducedValue.substring(position);
      final sign = this < 0 ? "-" : "";
      return "$sign\$$formatted $unit";
    } else {
      return currencyFormat;
    }
  }
}