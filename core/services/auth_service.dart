import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/app_config.dart';
import '../errors/app_exception.dart';

/// Login Google lewat Firebase Authentication.
/// Sesi login disimpan otomatis oleh Firebase: saat app dibuka lagi,
/// [currentUser] masih terisi sehingga pengguna tidak perlu login ulang.
class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _googleReady = false;

  User? get currentUser => _auth.currentUser;

  /// google_sign_in 7.x wajib diinisialisasi sekali sebelum dipakai.
  Future<void> _ensureGoogleReady() async {
    if (_googleReady) return;
    await GoogleSignIn.instance
        .initialize(serverClientId: AppConfig.googleWebClientId);
    _googleReady = true;
  }

  Future<User> signInWithGoogle() async {
    try {
      await _ensureGoogleReady();
      final account = await GoogleSignIn.instance.authenticate();
      final idToken = account.authentication.idToken;
      if (idToken == null) {
        throw const AppException('Token Google tidak diterima. Coba lagi.');
      }
      final credential = GoogleAuthProvider.credential(idToken: idToken);
      final result = await _auth.signInWithCredential(credential);
      final user = result.user;
      if (user == null) {
        throw const AppException('Login gagal. Coba lagi.');
      }
      return user;
    } on AppException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      throw AppException('Login gagal (${e.code}).');
    } catch (e) {
      if (e.toString().toLowerCase().contains('cancel')) {
        throw const AppException('Login dibatalkan.');
      }
      throw AppException('Login gagal: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _ensureGoogleReady();
      await GoogleSignIn.instance.signOut();
    } catch (_) {
      // Tidak masalah bila sesi Google sudah tidak ada.
    }
    await _auth.signOut();
  }
}
