import 'package:flutter/material.dart';

import '../../features/chat/screens/chat_room_screen.dart';
import '../../features/auth/screens/splash_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/role_selection_screen.dart';
import '../../features/auth/screens/complete_profile_screen.dart';
import '../../features/auth/screens/blocked_screen.dart';
import '../../features/auth/screens/verification_status_screen.dart';
import '../../features/home/screens/main_shell_murid.dart';
import '../../features/home/screens/home_murid_screen.dart';
import '../../features/home/screens/home_visitor_screen.dart';
import '../../features/search/screens/search_screen.dart';
import '../../features/search/screens/search_result_screen.dart';
import '../../features/tutor_profile/screens/tutor_detail_screen.dart';
import '../../features/tutor_profile/screens/tutor_reviews_screen.dart';
import '../../features/tutor_profile/screens/tutor_packages_screen.dart';
import '../../features/favorites/screens/favorites_screen.dart';
import '../../features/address/screens/address_list_screen.dart';
import '../../features/address/screens/address_form_screen.dart';
import '../../features/address/screens/map_picker_screen.dart';
import '../../features/booking/screens/booking_form_screen.dart';
import '../../features/booking/screens/slot_picker_screen.dart';
import '../../features/booking/screens/voucher_screen.dart';
import '../../features/booking/screens/booking_summary_screen.dart';
import '../../features/booking/screens/booking_list_screen.dart';
import '../../features/booking/screens/booking_detail_screen.dart';
import '../../features/booking/screens/cancel_booking_screen.dart';
import '../../features/payment/screens/payment_screen.dart';
import '../../features/payment/screens/payment_result_screen.dart';
import '../../features/payment/screens/payment_history_screen.dart';
import '../../features/session/screens/session_detail_screen.dart';
import '../../features/session/screens/checkin_screen.dart';
import '../../features/session/screens/attendance_screen.dart';
import '../../features/session/screens/student_confirm_screen.dart';
import '../../features/session/screens/report_absence_screen.dart';
import '../../features/session/screens/session_change_screen.dart';
import '../../features/session/screens/session_change_response_screen.dart';
import '../../features/session/screens/dispute_screen.dart';
import '../../features/schedule/screens/schedule_calendar_screen.dart';
import '../../features/schedule/screens/tutor_calendar_screen.dart';
import '../../features/review/screens/write_review_screen.dart';
import '../../features/chat/screens/conversation_list_screen.dart';
import '../../features/chat/screens/tutor_conversation_list_screen.dart';
import '../../features/notification/screens/notification_screen.dart';
import '../../features/help_report/screens/help_center_screen.dart';
import '../../features/help_report/screens/report_user_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/profile/screens/edit_profile_screen.dart';
import '../../features/profile/screens/settings_screen.dart';
import '../../features/tutor/screens/main_shell_tutor.dart';
import '../../features/tutor/screens/tutor_dashboard_screen.dart';
import '../../features/tutor/screens/tutor_profile_screen.dart';
import '../../features/tutor/screens/verification_upload_screen.dart';
import '../../features/tutor/screens/education_form_screen.dart';
import '../../features/tutor/screens/subject_rate_screen.dart';
import '../../features/tutor/screens/package_form_screen.dart';
import '../../features/tutor/screens/availability_screen.dart';
import '../../features/tutor/screens/booking_request_list_screen.dart';
import '../../features/tutor/screens/booking_request_detail_screen.dart';
import '../../features/tutor/screens/materials_screen.dart';
import '../../features/tutor/screens/announcement_screen.dart';
import '../../features/tutor/screens/performance_screen.dart';
import '../../features/materials_student/screens/materials_download_screen.dart';
import '../../features/wallet/screens/wallet_screen.dart';
import '../../features/wallet/screens/wallet_history_screen.dart';
import '../../features/wallet/screens/payout_request_screen.dart';
import '../../features/admin/screens/main_shell_admin.dart';
import '../../features/admin/screens/admin_dashboard_screen.dart';
import '../../features/admin/screens/verification_queue_screen.dart';
import '../../features/admin/screens/verification_review_screen.dart';
import '../../features/admin/screens/anomaly_log_screen.dart';
import '../../features/admin/screens/report_list_screen.dart';
import '../../features/admin/screens/report_detail_screen.dart';
import '../../features/admin/screens/user_management_screen.dart';
import '../../features/admin/screens/voucher_management_screen.dart';
import '../../features/admin/screens/voucher_form_screen.dart';
import '../../features/admin/screens/master_subject_screen.dart';
import '../../features/admin/screens/app_settings_screen.dart';
import '../../features/admin/screens/dispute_list_screen.dart';
import '../../features/admin/screens/dispute_decision_screen.dart';
import '../../features/admin/screens/manual_refund_screen.dart';
import '../../features/admin/screens/payout_queue_screen.dart';
import '../../features/admin/screens/transaction_recap_screen.dart';
import 'route_names.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return _page(settings, const SplashScreen());
      case RouteNames.login:
        return _page(settings, const LoginScreen());
      case RouteNames.roleSelection:
        return _page(settings, const RoleSelectionScreen());
      case RouteNames.completeProfile:
        return _page(settings, const CompleteProfileScreen());
      case RouteNames.blocked:
        return _page(settings, const BlockedScreen());
      case RouteNames.verificationStatus:
        return _page(settings, const VerificationStatusScreen());
      case RouteNames.mainShellMurid:
        return _page(settings, const MainShellMurid());
      case RouteNames.homeMurid:
        return _page(settings, const HomeMuridScreen());
      case RouteNames.homeVisitor:
        return _page(settings, const HomeVisitorScreen());
      case RouteNames.search:
        return _page(settings, const SearchScreen());
      case RouteNames.searchResult:
        return _page(settings, const SearchResultScreen());
      case RouteNames.tutorDetail:
        return _page(settings, const TutorDetailScreen());
      case RouteNames.tutorReviews:
        return _page(settings, const TutorReviewsScreen());
      case RouteNames.tutorPackages:
        return _page(settings, const TutorPackagesScreen());
      case RouteNames.favorites:
        return _page(settings, const FavoritesScreen());
      case RouteNames.addressList:
        return _page(settings, const AddressListScreen());
      case RouteNames.addressForm:
        return _page(settings, const AddressFormScreen());
      case RouteNames.mapPicker:
        return _page(settings, const MapPickerScreen());
      case RouteNames.bookingForm:
        return _page(settings, const BookingFormScreen());
      case RouteNames.slotPicker:
        return _page(settings, const SlotPickerScreen());
      case RouteNames.voucher:
        return _page(settings, const VoucherScreen());
      case RouteNames.bookingSummary:
        return _page(settings, const BookingSummaryScreen());
      case RouteNames.bookingList:
        return _page(settings, const BookingListScreen());
      case RouteNames.bookingDetail:
        return _page(settings, const BookingDetailScreen());
      case RouteNames.cancelBooking:
        return _page(settings, const CancelBookingScreen());
      case RouteNames.payment:
        return _page(settings, const PaymentScreen());
      case RouteNames.paymentResult:
        return _page(settings, const PaymentResultScreen());
      case RouteNames.paymentHistory:
        return _page(settings, const PaymentHistoryScreen());
      case RouteNames.sessionDetail:
        return _page(settings, const SessionDetailScreen());
      case RouteNames.checkin:
        return _page(settings, const CheckinScreen());
      case RouteNames.attendance:
        return _page(settings, const AttendanceScreen());
      case RouteNames.studentConfirm:
        return _page(settings, const StudentConfirmScreen());
      case RouteNames.reportAbsence:
        return _page(settings, const ReportAbsenceScreen());
      case RouteNames.sessionChange:
        return _page(settings, const SessionChangeScreen());
      case RouteNames.sessionChangeResponse:
        return _page(settings, const SessionChangeResponseScreen());
      case RouteNames.dispute:
        return _page(settings, const DisputeScreen());
      case RouteNames.scheduleCalendar:
        return _page(settings, const ScheduleCalendarScreen());
      case RouteNames.tutorCalendar:
        return _page(settings, const TutorCalendarScreen());
      case RouteNames.writeReview:
        return _page(settings, const WriteReviewScreen());
      case RouteNames.conversationList:
        return _page(settings, const ConversationListScreen());
      case RouteNames.tutorConversationList:
        return _page(settings, const TutorConversationListScreen());
      case RouteNames.chatRoom:
        return _page(settings, ChatRoomScreen(isTutorView: settings.arguments == true));
      case RouteNames.notification:
        return _page(settings, const NotificationScreen());
      case RouteNames.helpCenter:
        return _page(settings, const HelpCenterScreen());
      case RouteNames.reportUser:
        return _page(settings, const ReportUserScreen());
      case RouteNames.profile:
        return _page(settings, const ProfileScreen());
      case RouteNames.editProfile:
        return _page(settings, const EditProfileScreen());
      case RouteNames.settings:
        return _page(settings, const SettingsScreen());
      case RouteNames.mainShellTutor:
        return _page(settings, const MainShellTutor());
      case RouteNames.tutorDashboard:
        return _page(settings, const TutorDashboardScreen());
      case RouteNames.tutorProfile:
        return _page(settings, const TutorProfileScreen());
      case RouteNames.verificationUpload:
        return _page(settings, const VerificationUploadScreen());
      case RouteNames.educationForm:
        return _page(settings, const EducationFormScreen());
      case RouteNames.subjectRate:
        return _page(settings, const SubjectRateScreen());
      case RouteNames.packageForm:
        return _page(settings, const PackageFormScreen());
      case RouteNames.availability:
        return _page(settings, const AvailabilityScreen());
      case RouteNames.bookingRequestList:
        return _page(settings, const BookingRequestListScreen());
      case RouteNames.bookingRequestDetail:
        return _page(settings, const BookingRequestDetailScreen());
      case RouteNames.materials:
        return _page(settings, const MaterialsScreen());
      case RouteNames.announcement:
        return _page(settings, const AnnouncementScreen());
      case RouteNames.performance:
        return _page(settings, const PerformanceScreen());
      case RouteNames.materialsDownload:
        return _page(settings, const MaterialsDownloadScreen());
      case RouteNames.wallet:
        return _page(settings, const WalletScreen());
      case RouteNames.walletHistory:
        return _page(settings, const WalletHistoryScreen());
      case RouteNames.payoutRequest:
        return _page(settings, const PayoutRequestScreen());
      case RouteNames.mainShellAdmin:
        return _page(settings, const MainShellAdmin());
      case RouteNames.adminDashboard:
        return _page(settings, const AdminDashboardScreen());
      case RouteNames.verificationQueue:
        return _page(settings, const VerificationQueueScreen());
      case RouteNames.verificationReview:
        return _page(settings, const VerificationReviewScreen());
      case RouteNames.anomalyLog:
        return _page(settings, const AnomalyLogScreen());
      case RouteNames.reportList:
        return _page(settings, const ReportListScreen());
      case RouteNames.reportDetail:
        return _page(settings, const ReportDetailScreen());
      case RouteNames.userManagement:
        return _page(settings, const UserManagementScreen());
      case RouteNames.voucherManagement:
        return _page(settings, const VoucherManagementScreen());
      case RouteNames.voucherForm:
        return _page(settings, const VoucherFormScreen());
      case RouteNames.masterSubject:
        return _page(settings, const MasterSubjectScreen());
      case RouteNames.appSettings:
        return _page(settings, const AppSettingsScreen());
      case RouteNames.disputeList:
        return _page(settings, const DisputeListScreen());
      case RouteNames.disputeDecision:
        return _page(settings, const DisputeDecisionScreen());
      case RouteNames.manualRefund:
        return _page(settings, const ManualRefundScreen());
      case RouteNames.payoutQueue:
        return _page(settings, const PayoutQueueScreen());
      case RouteNames.transactionRecap:
        return _page(settings, const TransactionRecapScreen());
      default:
        return _page(
          settings,
          Scaffold(
            appBar: AppBar(title: const Text('Halaman tidak ditemukan')),
            body: Center(child: Text('Rute tidak dikenal: ${settings.name}')),
          ),
        );
    }
  }

  static MaterialPageRoute<dynamic> _page(RouteSettings s, Widget w) =>
      MaterialPageRoute<dynamic>(settings: s, builder: (_) => w);
}
