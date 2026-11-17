class Formatters {
  Formatters._();

  static const List<String> _bulan = [
    'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli',
    'Agustus', 'September', 'Oktober', 'November', 'Desember'
  ];
  static const List<String> _bulanPendek = [
    'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt',
    'Nov', 'Des'
  ];
  static const List<String> _hari = [
    'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'
  ];
  static const List<String> _hariPendek = [
    'Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'
  ];

  /// 75000 -> "Rp75.000"
  static String rupiah(int value) {
    final negative = value < 0;
    final digits = value.abs().toString();
    final buf = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) buf.write('.');
      buf.write(digits[i]);
    }
    return '${negative ? '-' : ''}Rp$buf';
  }

  /// 75000 -> "Rp75rb", 1500000 -> "Rp1,5jt"
  static String rupiahShort(int value) {
    if (value >= 1000000) {
      final v = value / 1000000;
      return 'Rp${v.toStringAsFixed(v % 1 == 0 ? 0 : 1).replaceAll('.', ',')}jt';
    }
    if (value >= 1000) return 'Rp${(value / 1000).round()}rb';
    return 'Rp$value';
  }

  static String monthName(int month) => _bulan[month - 1];
  static String monthShort(int month) => _bulanPendek[month - 1];
  static String dayName(DateTime d) => _hari[d.weekday - 1];
  static String dayShort(DateTime d) => _hariPendek[d.weekday - 1];

  /// "17 Okt 2026"
  static String dateShort(DateTime d) =>
      '${d.day} ${_bulanPendek[d.month - 1]} ${d.year}';

  /// "Sabtu, 17 Oktober 2026"
  static String dateLong(DateTime d) =>
      '${dayName(d)}, ${d.day} ${_bulan[d.month - 1]} ${d.year}';

  static String monthYear(DateTime d) => '${_bulan[d.month - 1]} ${d.year}';

  static String time(DateTime d) =>
      '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';

  /// "16:00 - 17:30 WIB"
  static String timeRange(DateTime start, DateTime end) =>
      '${time(start)} - ${time(end)} WIB';

  static String distanceKm(double km) => '${km.toStringAsFixed(1)} Km';

  /// Durasi hitung mundur "00:03:32".
  static String countdown(Duration d) {
    final s = d.isNegative ? 0 : d.inSeconds;
    final h = (s ~/ 3600).toString().padLeft(2, '0');
    final m = ((s % 3600) ~/ 60).toString().padLeft(2, '0');
    final sec = (s % 60).toString().padLeft(2, '0');
    return '$h:$m:$sec';
  }

  static String fileSize(int bytes) {
    if (bytes >= 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    if (bytes >= 1024) return '${(bytes / 1024).round()} KB';
    return '$bytes B';
  }
}
