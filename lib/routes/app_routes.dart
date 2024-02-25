import 'package:get/get.dart';
import '../presentation/onboarding_screen/onboarding_screen.dart';
import '../presentation/onboarding_screen/binding/onboarding_binding.dart';
import '../presentation/onboarding_one_screen/onboarding_one_screen.dart';
import '../presentation/onboarding_one_screen/binding/onboarding_one_binding.dart';
import '../presentation/onboarding_two_screen/onboarding_two_screen.dart';
import '../presentation/onboarding_two_screen/binding/onboarding_two_binding.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/login_screen/binding/login_binding.dart';
import '../presentation/login_forgot_password_screen/login_forgot_password_screen.dart';
import '../presentation/login_forgot_password_screen/binding/login_forgot_password_binding.dart';
import '../presentation/login_otp_screen/login_otp_screen.dart';
import '../presentation/login_otp_screen/binding/login_otp_binding.dart';
import '../presentation/login_reset_password_screen/login_reset_password_screen.dart';
import '../presentation/login_reset_password_screen/binding/login_reset_password_binding.dart';
import '../presentation/signup_screen/signup_screen.dart';
import '../presentation/signup_screen/binding/signup_binding.dart';
import '../presentation/signup_farm_info_screen/signup_farm_info_screen.dart';
import '../presentation/signup_farm_info_screen/binding/signup_farm_info_binding.dart';
import '../presentation/signup_verification_screen/signup_verification_screen.dart';
import '../presentation/signup_verification_screen/binding/signup_verification_binding.dart';
import '../presentation/signup_hours_screen/signup_hours_screen.dart';
import '../presentation/signup_hours_screen/binding/signup_hours_binding.dart';
import '../presentation/signup_verification_one_screen/signup_verification_one_screen.dart';
import '../presentation/signup_verification_one_screen/binding/signup_verification_one_binding.dart';
import '../presentation/signup_confirmation_screen/signup_confirmation_screen.dart';
import '../presentation/signup_confirmation_screen/binding/signup_confirmation_binding.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String loginScreen = '/login_screen';

  static const String loginForgotPasswordScreen =
      '/login_forgot_password_screen';

  static const String loginOtpScreen = '/login_otp_screen';

  static const String loginResetPasswordScreen = '/login_reset_password_screen';

  static const String signupScreen = '/signup_screen';

  static const String signupFarmInfoScreen = '/signup_farm_info_screen';

  static const String signupVerificationScreen = '/signup_verification_screen';

  static const String signupHoursScreen = '/signup_hours_screen';

  static const String signupVerificationOneScreen =
      '/signup_verification_one_screen';

  static const String signupConfirmationScreen = '/signup_confirmation_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: onboardingScreen,
      page: () => OnboardingScreen(),
      bindings: [
        OnboardingBinding(),
      ],
    ),
    GetPage(
      name: onboardingOneScreen,
      page: () => OnboardingOneScreen(),
      bindings: [
        OnboardingOneBinding(),
      ],
    ),
    GetPage(
      name: onboardingTwoScreen,
      page: () => OnboardingTwoScreen(),
      bindings: [
        OnboardingTwoBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: loginForgotPasswordScreen,
      page: () => LoginForgotPasswordScreen(),
      bindings: [
        LoginForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: loginOtpScreen,
      page: () => LoginOtpScreen(),
      bindings: [
        LoginOtpBinding(),
      ],
    ),
    GetPage(
      name: loginResetPasswordScreen,
      page: () => LoginResetPasswordScreen(),
      bindings: [
        LoginResetPasswordBinding(),
      ],
    ),
    GetPage(
      name: signupScreen,
      page: () => SignupScreen(),
      bindings: [
        SignupBinding(),
      ],
    ),
    GetPage(
      name: signupFarmInfoScreen,
      page: () => SignupFarmInfoScreen(),
      bindings: [
        SignupFarmInfoBinding(),
      ],
    ),
    GetPage(
      name: signupVerificationScreen,
      page: () => SignupVerificationScreen(),
      bindings: [
        SignupVerificationBinding(),
      ],
    ),
    GetPage(
      name: signupHoursScreen,
      page: () => SignupHoursScreen(),
      bindings: [
        SignupHoursBinding(),
      ],
    ),
    GetPage(
      name: signupVerificationOneScreen,
      page: () => SignupVerificationOneScreen(),
      bindings: [
        SignupVerificationOneBinding(),
      ],
    ),
    GetPage(
      name: signupConfirmationScreen,
      page: () => SignupConfirmationScreen(),
      bindings: [
        SignupConfirmationBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => OnboardingScreen(),
      bindings: [
        OnboardingBinding(),
      ],
    )
  ];
}
