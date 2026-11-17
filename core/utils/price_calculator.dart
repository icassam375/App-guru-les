class PriceBreakdown {
  const PriceBreakdown({
    required this.total,
    required this.discount,
    required this.finalAmount,
    required this.dp,
    required this.remaining,
    required this.commission,
    required this.platformRevenue,
    required this.tutorEarning,
  });

  final int total; // harga sebelum voucher
  final int discount; // diskon voucher (ditanggung platform)
  final int finalAmount; // yang dibayar murid
  final int dp; // DP 25%
  final int remaining; // pelunasan 75%
  final int commission; // komisi dari harga sebelum voucher
  final int platformRevenue; // komisi - diskon
  final int tutorEarning; // total - komisi
}

/// Perhitungan UNTUK TAMPILAN. Angka resmi dihitung server (BR-15, BR-16).
class PriceCalculator {
  PriceCalculator._();

  static PriceBreakdown calculate({
    required int total,
    int commissionPercent = 10,
    int dpPercent = 25,
    String? discountType, // 'percent' | 'nominal'
    int discountValue = 0,
    int maxDiscount = 0,
  }) {
    final commission = (total * commissionPercent / 100).round();

    var discount = 0;
    if (discountType == 'percent') {
      discount = (total * discountValue / 100).round();
    } else if (discountType == 'nominal') {
      discount = discountValue;
    }
    if (maxDiscount > 0 && discount > maxDiscount) discount = maxDiscount;
    // Diskon tidak boleh melebihi komisi supaya pendapatan platform >= 0.
    if (discount > commission) discount = commission;

    final finalAmount = total - discount;
    final dp = (finalAmount * dpPercent / 100).round();
    return PriceBreakdown(
      total: total,
      discount: discount,
      finalAmount: finalAmount,
      dp: dp,
      remaining: finalAmount - dp,
      commission: commission,
      platformRevenue: commission - discount,
      tutorEarning: total - commission,
    );
  }

  /// Dana per sesi pada paket multi-sesi = total dibagi jumlah sesi.
  static int perSession(int amount, int sessionCount) =>
      sessionCount <= 0 ? 0 : (amount / sessionCount).round();
}
