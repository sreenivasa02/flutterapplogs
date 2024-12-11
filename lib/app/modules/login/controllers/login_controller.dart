import 'package:get/get.dart';

import '../../utils/app_logger.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<void> login(String username, String password) async {
    AppLogger.info('Login attempt with username: $username');

    if (username.isEmpty || password.isEmpty) {
      AppLogger.warning('Username or password cannot be empty');
      Get.snackbar('Error', 'Username or password cannot be empty');
      return;
    }

    try {
      isLoading.value = true;

      // Simulate API call
      await Future.delayed(Duration(seconds: 2));

      if (username == 'admin' && password == '1234') {
        AppLogger.info('Login successful for username: $username');
        Get.snackbar('Success', 'Login successful');
        // Navigate to another page
        Get.offNamed('/home');
      } else {
        throw Exception('Invalid credentials');
      }
    } catch (error) {
      AppLogger.error('Login failed', error);
      Get.snackbar('Error', 'Login failed: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
