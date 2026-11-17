/// Pembantu membaca Map hasil Firestore ke model.
/// Mendukung DateTime, String ISO, int (ms), atau objek bertipe Timestamp
/// (lewat method toDate()).
extension MapReader on Map<String, dynamic> {
  String str(String k, [String d = '']) => this[k]?.toString() ?? d;
  String? strOrNull(String k) => this[k]?.toString();
  int integer(String k, [int d = 0]) {
    final v = this[k];
    if (v is int) return v;
    if (v is num) return v.toInt();
    return int.tryParse(v?.toString() ?? '') ?? d;
  }

  double decimal(String k, [double d = 0]) {
    final v = this[k];
    if (v is num) return v.toDouble();
    return double.tryParse(v?.toString() ?? '') ?? d;
  }

  bool flag(String k, [bool d = false]) {
    final v = this[k];
    return v is bool ? v : d;
  }

  DateTime? date(String k) {
    final v = this[k];
    if (v == null) return null;
    if (v is DateTime) return v;
    if (v is int) return DateTime.fromMillisecondsSinceEpoch(v);
    if (v is String) return DateTime.tryParse(v);
    try {
      // ignore: avoid_dynamic_calls
      return (v as dynamic).toDate() as DateTime;
    } catch (_) {
      return null;
    }
  }
}
