  extension MapExtension on Map {

  List<MapEntry<K, V>> sortedItems<K, V>() {
    final keys = this.keys.toList();
    keys.sort();

    final List<MapEntry<K, V>> result = [];
    for (final key in keys) {
      final value = this[key];
      result.add(MapEntry(key, value));
    }

    return result;
  }
}