import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/core/utils/progress_dialog_utils.dart';
import 'package:sample_test/data/models/forgotPasswordPost/post_forgot_password_post_resp.dart';
import 'package:sample_test/data/models/registerDeviceAuth/post_register_device_auth_resp.dart';
import 'package:sample_test/data/models/resetPassword/post_reset_password_resp.dart';
import 'package:sample_test/data/models/verifyOtp/post_verify_otp_resp.dart';

class ApiClient extends GetConnect {
  var url = "https://sowlab.pw";

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = const Duration(seconds: 60);
  }

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    return response.isOk;
  }

  /// Performs API call for https://sowlab.pw/assignment/user/reset-password
  ///
  /// Sends a POST request to the server's 'https://sowlab.pw/assignment/user/reset-password' endpoint
  /// with the provided headers and request data
  /// Returns a [PostResetPasswordResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostResetPasswordResp> resetPassword(
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/assignment/user/reset-password',
        body: requestData,
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostResetPasswordResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostResetPasswordResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://sowlab.pw/assignment/user/verify-otp
  ///
  /// Sends a POST request to the server's 'https://sowlab.pw/assignment/user/verify-otp' endpoint
  /// with the provided headers and request data
  /// Returns a [PostVerifyOtpResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostVerifyOtpResp> verifyOtp({Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/assignment/user/verify-otp',
        body: requestData,
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostVerifyOtpResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostVerifyOtpResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://sowlab.pw/assignment/user/forgot-password
  ///
  /// Sends a POST request to the server's 'https://sowlab.pw/assignment/user/forgot-password' endpoint
  /// with the provided headers and request data
  /// Returns a [PostForgotPasswordPostResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostForgotPasswordPostResp> forgotPasswordPost(
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/assignment/user/forgot-password',
        body: requestData,
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostForgotPasswordPostResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostForgotPasswordPostResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://sowlab.pw/assignment/user/register
  ///
  /// Sends a POST request to the server's 'https://sowlab.pw/assignment/user/register' endpoint
  /// with the provided headers and request data
  /// Returns a [PostRegisterDeviceAuthResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostRegisterDeviceAuthResp> registerDeviceAuth({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/assignment/user/register',
        headers: headers,
        body: requestData,
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostRegisterDeviceAuthResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostRegisterDeviceAuthResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
