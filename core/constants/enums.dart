enum UserRole { visitor, student, tutor, admin }

enum VerificationStatus { pending, approved, rejected }

enum LessonType { online, home }

enum PaymentType { dp, pelunasan }

enum PayoutStatus { requested, processed, rejected }

enum SessionStatus {
  held,
  scheduled,
  ongoing,
  done,
  cancelled,
  noShowTutor,
  noShowStudent,
}

/// Alur status booking sesuai PRD bagian 11.
enum BookingStatus {
  menungguDp,
  menungguKonfirmasiGuru,
  diterima,
  lunas,
  berlangsung,
  selesai,
  diulas,
  dibatalkan,
  ditolak,
  kedaluwarsa,
  dibatalkanMurid,
  dibatalkanGuru,
  dibatalkanSistem,
  sengketa,
  noShow,
}

extension LessonTypeX on LessonType {
  String get label => this == LessonType.online ? 'Online' : 'Tatap Muka';
  String get value => this == LessonType.online ? 'online' : 'home';
  static LessonType parse(String? v) =>
      v == 'online' ? LessonType.online : LessonType.home;
}

extension UserRoleX on UserRole {
  String get label {
    switch (this) {
      case UserRole.visitor:
        return 'Pengunjung';
      case UserRole.student:
        return 'Pencari';
      case UserRole.tutor:
        return 'Pengajar';
      case UserRole.admin:
        return 'Admin';
    }
  }

  static UserRole parse(String? v) {
    switch (v) {
      case 'student':
        return UserRole.student;
      case 'tutor':
        return UserRole.tutor;
      case 'admin':
        return UserRole.admin;
      default:
        return UserRole.visitor;
    }
  }
}

extension BookingStatusX on BookingStatus {
  String get label {
    switch (this) {
      case BookingStatus.menungguDp:
        return 'Menunggu DP';
      case BookingStatus.menungguKonfirmasiGuru:
        return 'Menunggu Konfirmasi Guru';
      case BookingStatus.diterima:
        return 'Pesanan Diterima';
      case BookingStatus.lunas:
        return 'Lunas';
      case BookingStatus.berlangsung:
        return 'Berlangsung';
      case BookingStatus.selesai:
        return 'Selesai';
      case BookingStatus.diulas:
        return 'Sudah Diulas';
      case BookingStatus.dibatalkan:
        return 'Dibatalkan';
      case BookingStatus.ditolak:
        return 'Ditolak';
      case BookingStatus.kedaluwarsa:
        return 'Kedaluwarsa';
      case BookingStatus.dibatalkanMurid:
        return 'Dibatalkan Murid';
      case BookingStatus.dibatalkanGuru:
        return 'Dibatalkan Guru';
      case BookingStatus.dibatalkanSistem:
        return 'Dibatalkan Sistem';
      case BookingStatus.sengketa:
        return 'Sengketa';
      case BookingStatus.noShow:
        return 'Tidak Hadir';
    }
  }

  /// Tab "Berlangsung" di layar Pemesanan Saya.
  bool get isActive =>
      this == BookingStatus.menungguDp ||
      this == BookingStatus.menungguKonfirmasiGuru ||
      this == BookingStatus.diterima ||
      this == BookingStatus.lunas ||
      this == BookingStatus.berlangsung;

  bool get isDone =>
      this == BookingStatus.selesai || this == BookingStatus.diulas;
}
