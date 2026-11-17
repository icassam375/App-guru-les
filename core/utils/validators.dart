class Validators {
  Validators._();

  static String? required(String? v, [String field = 'Kolom ini']) =>
      (v == null || v.trim().isEmpty) ? '$field wajib diisi' : null;

  static String? minLength(String? v, int min, [String field = 'Kolom ini']) {
    if (v == null || v.trim().length < min) {
      return '$field minimal $min karakter';
    }
    return null;
  }

  static String? phone(String? v) {
    if (v == null || v.trim().isEmpty) return 'Nomor telepon wajib diisi';
    final digits = v.replaceAll(RegExp(r'[^0-9+]'), '');
    if (digits.length < 9 || digits.length > 15) {
      return 'Nomor telepon tidak valid';
    }
    return null;
  }

  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) return 'Email wajib diisi';
    final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim());
    return ok ? null : 'Format email tidak valid';
  }
}
