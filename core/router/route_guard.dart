import '../../providers/auth_provider.dart';
import '../constants/enums.dart';
import 'route_names.dart';

/// Routing berdasarkan peran dan status (US-01, flowchart 4.1).
/// Belum login = pengunjung: langsung ke beranda, tanpa dipaksa login.
class RouteGuard {
  RouteGuard._();

  static String initialRoute(AuthProvider auth) {
    if (!auth.signedIn) return RouteNames.mainShellMurid;
    if (auth.isBlocked) return RouteNames.blocked;
    switch (auth.role) {
      case null:
        return RouteNames.roleSelection;
      case UserRole.student:
        return RouteNames.mainShellMurid;
      case UserRole.tutor:
        return auth.tutorStatus == VerificationStatus.approved
            ? RouteNames.mainShellTutor
            : RouteNames.verificationStatus;
      case UserRole.admin:
        return RouteNames.mainShellAdmin;
      case UserRole.visitor:
        return RouteNames.mainShellMurid;
    }
  }
}
