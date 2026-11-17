import 'package:firebase_core/firebase_core.dart';

import 'app_exception.dart';

class ErrorHandler {
  ErrorHandler._();

  /// Ubah error apa pun menjadi pesan yang aman ditampilkan ke pengguna.
  static String message(Object error) {
    if (error is AppException) return error.message;
    if (error is FirebaseException) {
      if (error.code == 'permission-denied') {
        return 'Akses ditolak oleh aturan database (permission-denied).';
      }
      if (error.code == 'unavailable') {
        return 'Tidak ada koneksi ke server. Periksa internet Anda.';
      }
      return 'Gagal (${error.code}). Coba lagi.';
    }
    return 'Terjadi kesalahan. Coba lagi beberapa saat lagi.';
  }
}
