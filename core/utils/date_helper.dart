/// Aturan waktu dari PRD (BR-02, BR-05, BR-06, BR-11, dan aturan Revisi 3).
/// Angka resmi tetap dihitung server (Cloud Functions); ini untuk tampilan.
class DateHelper {
  DateHelper._();

  /// Pemesanan minimal H-2 dari jadwal sesi (BR-06).
  static bool isBookingAllowed(DateTime sessionStart, DateTime now) =>
      sessionStart.difference(now) >= const Duration(days: 2);

  /// Batas respons guru = yang lebih awal antara 24 jam sejak pesanan
  /// dan H-1 pukul 12.00.
  static DateTime respondDeadline(
      DateTime orderedAt, DateTime sessionStart,
      {int timeoutHours = 24}) {
    final byTimeout = orderedAt.add(Duration(hours: timeoutHours));
    final dayBefore = sessionStart.subtract(const Duration(days: 1));
    final byDayBefore =
        DateTime(dayBefore.year, dayBefore.month, dayBefore.day, 12, 0);
    return byTimeout.isBefore(byDayBefore) ? byTimeout : byDayBefore;
  }

  /// Pelunasan paling lambat H-1 pukul 23.59.
  static DateTime finalPayDeadline(DateTime sessionStart) {
    final d = sessionStart.subtract(const Duration(days: 1));
    return DateTime(d.year, d.month, d.day, 23, 59);
  }

  /// Batas bayar DP = waktu tekan bayar + 15 menit (dp_payment_minutes).
  static DateTime dpDeadline(DateTime pressedAt, {int minutes = 15}) =>
      pressedAt.add(Duration(minutes: minutes));

  /// Tombol "Tidak Hadir" aktif 15 menit setelah jam mulai.
  static bool canReportNoShow(DateTime start, DateTime now,
          {int waitMinutes = 15}) =>
      now.isAfter(start.add(Duration(minutes: waitMinutes)));

  /// Reschedule paling lambat H-1 (BR-11).
  static bool canReschedule(DateTime sessionStart, DateTime now) =>
      now.isBefore(DateTime(
          sessionStart.year, sessionStart.month, sessionStart.day));

  /// Pembatalan murid: lebih dari 24 jam sebelum sesi?
  static bool isMoreThan24hBefore(DateTime sessionStart, DateTime now) =>
      sessionStart.difference(now) > const Duration(hours: 24);

  static bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
