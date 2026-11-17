import '../constants/enums.dart';

/// DATA SEMENTARA untuk membangun UI. Ganti dengan repository (Firestore)
/// saat backend sudah siap. Bentuknya mengikuti desain, bukan skema ERD.
class MockTutor {
  const MockTutor({
    required this.id,
    required this.name,
    required this.subjects,
    required this.education,
    required this.rating,
    required this.reviews,
    required this.priceHome,
    required this.priceOnline,
    required this.distanceKm,
    required this.area,
    this.levels = 'SMA',
    this.modes = const ['Tatap Muka', 'Online'],
    this.available = true,
    this.favorite = false,
    this.badge,
  });

  final String id;
  final String name;
  final String subjects;
  final String education;
  final double rating;
  final int reviews;
  final int priceHome;
  final int priceOnline;
  final double distanceKm;
  final String area;
  final String levels;
  final List<String> modes;
  final bool available;
  final bool favorite;
  final String? badge;
}

class MockBooking {
  const MockBooking({
    required this.code,
    required this.orderedLabel,
    required this.tutorName,
    required this.subjectLine,
    required this.scheduleLabel,
    required this.address,
    required this.total,
    required this.status,
    this.paidLabel = 'Lunas',
  });

  final String code;
  final String orderedLabel;
  final String tutorName;
  final String subjectLine;
  final String scheduleLabel;
  final String address;
  final int total;
  final BookingStatus status;
  final String paidLabel;
}

class MockVoucher {
  const MockVoucher({
    required this.category,
    required this.title,
    required this.description,
    required this.validity,
    required this.code,
    required this.action,
    required this.tag,
    this.highlight = false,
  });

  final String category;
  final String title;
  final String description;
  final String validity;
  final String code;
  final String action;
  final String tag;
  final bool highlight;
}

class MockConversation {
  const MockConversation({
    required this.name,
    required this.roleLabel,
    required this.lastMessage,
    required this.time,
    this.subject,
    this.rating,
    this.unread = 0,
    this.online = false,
    this.verified = false,
    this.footnote,
  });

  final String name;
  final String roleLabel;
  final String lastMessage;
  final String time;
  final String? subject;
  final double? rating;
  final int unread;
  final bool online;
  final bool verified;
  final String? footnote;
}

class MockMessage {
  const MockMessage({
    required this.text,
    required this.time,
    required this.mine,
    this.imageLabel,
    this.voiceTitle,
    this.read = false,
  });

  final String text;
  final String time;
  final bool mine;
  final String? imageLabel;
  final String? voiceTitle;
  final bool read;
}

class MockRequest {
  const MockRequest({
    required this.studentName,
    required this.level,
    required this.price,
    required this.subject,
    required this.method,
    required this.schedule,
    required this.packageLabel,
    required this.waitingLabel,
    this.target,
    this.note,
    this.deadlineLabel,
    this.distanceLabel,
  });

  final String studentName;
  final String level;
  final int price;
  final String subject;
  final String method;
  final String schedule;
  final String packageLabel;
  final String waitingLabel;
  final String? target;
  final String? note;
  final String? deadlineLabel;
  final String? distanceLabel;
}

class MockData {
  MockData._();

  static const String studentName = 'Budi Santoso';
  static const String studentFirstName = 'Budi';
  static const String tutorName = 'Kak Nadiya';

  static const List<MockTutor> tutors = [
    MockTutor(
      id: 't1',
      name: 'Kak Nadya',
      subjects: 'Matematika • Fisika • Kimia',
      education: 'Lulusan S1 Pend. Matematika UNESA',
      rating: 4.9,
      reviews: 128,
      priceHome: 75000,
      priceOnline: 70000,
      distanceKm: 1.2,
      area: 'Area Kampus UNESA, Surabaya',
      favorite: true,
      badge: 'Tersedia',
    ),
    MockTutor(
      id: 't2',
      name: 'Kak Dimas',
      subjects: 'Bahasa Inggris',
      education: 'Lulusan S1 Sastra Inggris UGM',
      rating: 4.9,
      reviews: 96,
      priceHome: 65000,
      priceOnline: 60000,
      distanceKm: 1.8,
      area: 'Area Rungkut, Surabaya',
      levels: 'SD & SMP',
      favorite: true,
      badge: 'Daring & Luring',
    ),
    MockTutor(
      id: 't3',
      name: 'Kak Rizky Amanda',
      subjects: 'Fisika & IPA',
      education: 'Lulusan S1 Fisika ITS',
      rating: 5.0,
      reviews: 84,
      priceHome: 80000,
      priceOnline: 70000,
      distanceKm: 1.5,
      area: 'Area Gubeng, Surabaya',
      badge: 'Favorit Siswa',
    ),
    MockTutor(
      id: 't4',
      name: 'Ibu Sari',
      subjects: 'Fisika • SBMPTN/SNBT',
      education: 'Lulusan S2 Fisika UNAIR',
      rating: 5.0,
      reviews: 92,
      priceHome: 90000,
      priceOnline: 80000,
      distanceKm: 2.1,
      area: 'Area Wonokromo, Surabaya',
      modes: ['Tatap Muka'],
      favorite: true,
      badge: 'Luring (Radius 5km)',
    ),
  ];

  static const List<String> subjectChips = [
    'Matematika',
    'B. Inggris',
    'Fisika',
    'Kimia',
    'Biologi',
    'B. Indonesia',
  ];

  static const List<MockBooking> bookings = [
    MockBooking(
      code: '#TRX-1011',
      orderedLabel: 'Jumat, 16 Okt 2026',
      tutorName: 'Kak Nadya',
      subjectLine: 'Matematika • SMA • Tatap Muka',
      scheduleLabel: 'Sabtu, 17 Okt 2026 | 16:00 – 17:30 WIB',
      address: 'Jl. Gubeng No. 12, Surabaya',
      total: 75000,
      status: BookingStatus.menungguKonfirmasiGuru,
    ),
    MockBooking(
      code: '#TRX-1010',
      orderedLabel: 'Kamis, 15 Okt 2026',
      tutorName: 'Kak Dimas',
      subjectLine: 'Bahasa Inggris • SMA • Tatap Muka',
      scheduleLabel: 'Minggu, 18 Okt 2026 | 10:00 – 11:30 WIB',
      address: 'Jl. Basuki Rahmat No. 4, Surabaya',
      total: 65000,
      status: BookingStatus.diterima,
    ),
    MockBooking(
      code: '#TRX-1004',
      orderedLabel: 'Senin, 5 Okt 2026',
      tutorName: 'Kak Rizky Amanda',
      subjectLine: 'Fisika • SMA • Online',
      scheduleLabel: 'Rabu, 7 Okt 2026 | 19:00 – 20:30 WIB',
      address: 'Online via Google Meet',
      total: 70000,
      status: BookingStatus.selesai,
    ),
    MockBooking(
      code: '#TRX-0998',
      orderedLabel: 'Sabtu, 26 Sep 2026',
      tutorName: 'Ibu Sari',
      subjectLine: 'Fisika • SMA • Tatap Muka',
      scheduleLabel: 'Selasa, 29 Sep 2026 | 16:00 – 17:30 WIB',
      address: 'Jl. Basuki Rahmat No. 4, Surabaya',
      total: 90000,
      status: BookingStatus.dibatalkanGuru,
      paidLabel: 'Refund penuh',
    ),
  ];

  static const List<MockVoucher> vouchers = [
    MockVoucher(
      category: 'PAKET KELAS GABUNGAN (MULTI-SUBJECT)',
      title: 'DISKON 25%',
      description:
          'Hemat biaya dengan menggabungkan kelas Matematika dan Fisika. Minimal 3 siswa per sesi gabungan.',
      validity: 'Valid hingga 31 Des 2026',
      code: 'GABUNG25',
      action: 'Gunakan',
      tag: 'Hemat s/d 50rb/sesi',
    ),
    MockVoucher(
      category: 'PAKET SAMBUTAN PENGGUNA BARU',
      title: 'Cashback Rp50rb',
      description:
          'Hanya untuk 5 sesi belajar pertama Anda di platform bersama pengajar pilihan.',
      validity: 'Hingga 30 Nov 2026',
      code: 'BARU50K',
      action: 'Klaim',
      tag: 'Pengguna Baru',
      highlight: true,
    ),
    MockVoucher(
      category: 'PAKET KURSUS PREMIUM',
      title: 'Potongan Rp100rb',
      description:
          'Berlaku untuk kursus persiapan intensif 3 bulan SBMPTN / UTBK SNBT lengkap.',
      validity: 'Hingga 15 Des 2026',
      code: 'PREMIUM100',
      action: 'Daftar',
      tag: 'Persiapan Ujian',
    ),
    MockVoucher(
      category: 'PAKET REFERAL TEMAN ANDA',
      title: 'DISKON 30%',
      description:
          'Setiap pengguna baru yang mendaftar dan les menggunakan kode undangan Anda.',
      validity: 'Berlaku Selamanya (S&K)',
      code: 'REF30%',
      action: 'Undang',
      tag: 'Hampir Habis',
    ),
  ];

  static const List<MockConversation> studentChats = [
    MockConversation(
      name: 'Kak Nadiya',
      roleLabel: 'Matematika SMA',
      lastMessage: 'Baik Budi, untuk materi trigonometri besok',
      time: '09:41',
      rating: 4.9,
      unread: 2,
      online: true,
      verified: true,
    ),
    MockConversation(
      name: 'Kak Dimas',
      roleLabel: 'Bahasa Inggris',
      lastMessage: 'Terima kasih atas pembayarannya, kita keter',
      time: 'Kemarin',
      rating: 4.8,
      online: true,
      verified: true,
    ),
    MockConversation(
      name: 'Kak Rizky Amanda',
      roleLabel: 'Fisika & IPA',
      lastMessage: 'Apakah PR fisika nomor 4 sudah sempat dicoba?',
      time: '14 Okt',
      rating: 5.0,
      verified: true,
    ),
  ];

  static const List<MockConversation> tutorChats = [
    MockConversation(
      name: 'Budi Santoso',
      roleLabel: 'Siswa Aktif',
      lastMessage: 'Sama-sama Budi! Semangat ya, sampai ketemu nanti sore 👍',
      time: '09.22 WIB',
      online: true,
      footnote: 'Sesi Hari Ini: 16.00 WIB (Tatap Muka di Rumah Siswa)',
    ),
    MockConversation(
      name: 'Dimas Arya',
      roleLabel: 'Calon Murid Baru',
      lastMessage: 'Halo Kak Nadiya, apakah slot hari…',
      time: '09.05 WIB',
      unread: 1,
      online: true,
      footnote: 'Permintaan Baru • Paket 8 Sesi Matematika SMP',
    ),
    MockConversation(
      name: 'Alya Zahra',
      roleLabel: 'Siswa Aktif',
      lastMessage: 'Kak, modul fisika yang bab hukum newton sudah saya download…',
      time: '08.40 WIB',
      online: true,
      footnote: 'Sesi Hari Ini: 19.00 WIB (Online Zoom)',
    ),
    MockConversation(
      name: 'Ibu Ratna Dewi',
      roleLabel: 'Wali Murid',
      lastMessage: 'Terima kasih banyak Kak Nadiya, nilai try out UTBK Budi ada peningkatan yang sangat signifikan.',
      time: 'Kemarin',
      footnote: 'Konfirmasi Pembayaran Paket Lanjutan (12 Pertemuan)',
    ),
    MockConversation(
      name: 'Siti Nurhaliza',
      roleLabel: 'Inquiry Les',
      lastMessage: 'Apakah bimbingan online fisika bisa',
      time: 'Kemarin',
      unread: 1,
      footnote: 'Tanya Tarif & Jadwal Bimbingan Persiapan Kuis',
    ),
  ];

  static const List<MockMessage> chatMessages = [
    MockMessage(
        text:
            'Halo Budi! Untuk persiapan sesi les trigonometri besok sore, apakah modul latihan bab sudut ganda sudah sempat dibaca?',
        time: '09:15',
        mine: false),
    MockMessage(
        text:
            'Halo Kak Nadiya! Sudah Kak, tapi saya masih agak bingung di soal tipe pembuktian identitas nomor 4 dan 7.',
        time: '09:22',
        mine: true,
        read: true),
    MockMessage(
        text: 'Ini soal yang kemarin sempat saya coba kerjakan Kak ✍️',
        time: '09:23',
        mine: true,
        imageLabel: 'Foto Catatan',
        read: true),
    MockMessage(
        text: '',
        time: '09:37',
        mine: false,
        voiceTitle: 'Penjelasan singkat rumus sin(2α)'),
    MockMessage(
        text:
            'Wah terima kasih banyak Kak! Sangat membantu, sampai ketemu besok jam 4 sore ya Kak. 🙏',
        time: '09:39',
        mine: true,
        read: true),
    MockMessage(
        text:
            'Sama-sama Budi! Semangat ya, istirahat yang cukup. Sampai ketemu besok 👍',
        time: '09:41',
        mine: false),
  ];

  static const List<MockRequest> requests = [
    MockRequest(
      studentName: 'Budi Pratama',
      level: 'Kelas 12 IPA • SMAN 5 Surabaya',
      price: 650000,
      subject: 'Matematika Saintek (Matriks & Vektor)',
      method: 'Tatap Muka',
      schedule: 'Selasa & Kamis, 16.00 - 17.30 WIB',
      packageLabel: 'Paket 8 Sesi (Rp 81.250 / pertemuan) • Mulai 24 Okt',
      waitingLabel: 'Masuk 2 jam lalu',
      target: 'Target: UTBK Saintek 2025',
      note:
          'Halo Kak Nadiya, ingin fokus pembahasan soal matriks dan trigonometri UTBK. Mohon kesediaannya kak, saya siap tes diagnostik awal.',
      deadlineLabel: 'Sisa 5 jam untuk merespons',
      distanceLabel: 'Jl. Kertajaya Indah No. 14 (2.1 km dari lokasimu)',
    ),
    MockRequest(
      studentName: 'Siti Nurhaliza',
      level: 'Kelas 11 SMA • SMA Al-Hikmah',
      price: 320000,
      subject: 'Fisika - Dinamika Gerak',
      method: 'Online (Zoom Pro)',
      schedule: 'Sabtu, 09.00 - 10.30 WIB',
      packageLabel: '4 Pertemuan (Rp 80.000/sesi)',
      waitingLabel: 'Masuk 5 jam lalu',
      target: 'Murid Baru',
    ),
    MockRequest(
      studentName: 'Kevin Jonathan',
      level: 'Kelas 9 SMP • Persiapan Ujian Sekolah',
      price: 500000,
      subject: 'Matematika Dasar & Bangun Ruang',
      method: 'Tatap Muka (3.5 km)',
      schedule: 'Senin & Rabu, 15.30 - 17.00 WIB',
      packageLabel: '6 Sesi Intensif',
      waitingLabel: 'Masuk kemarin',
    ),
  ];
}
