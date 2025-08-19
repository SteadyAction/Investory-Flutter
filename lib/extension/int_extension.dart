
import 'dart:math';

extension IntExtension on int {
  static int getRandomNumber(int min, int max) {
    Random random = Random();
    int randomNumber = min + random.nextInt(max - min + 1);
    return randomNumber;
  }

  String shortenFormat() {
    if (this < 1000) {
      return toString();
    } else if (this >= 1000 && this < 1000000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    } else if (this >= 1000000 && this < 1000000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000000000) {
      return '${(this / 1000000000).toStringAsFixed(1)}B';
    }
    return '';
  }
}

