import 'package:go_router/go_router.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/password_settings_view.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/profile_view.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/setting_profile_view.dart';

abstract class AppRouter {
  static const kSettingProfileView = "/SettingProfileView";
  static const kProfileView = '/';
  static const kPasswordSettingsView = '/PasswordSettingsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSettingProfileView,
        builder: (context, state) => const SettingProfileView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kPasswordSettingsView,
        builder: (context, state) => const PasswordSettingsView(),
      ),
    ],
  );
}
