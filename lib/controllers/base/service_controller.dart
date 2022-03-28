// ignore_for_file: unused_field, unused_local_variable

import 'package:get/get.dart';
import 'package:seov_app/services/service_exception.dart';

class ServiceController {
  void handleError(error) {
    if (error is BadRequestException) {
      Get.back();

      var message = error.message;
      var url = error.url;

      if (url == '/v1/auth/password/change') {
      } 
    } else if (error is ApiNotRespondingException) {
      var message = error.message;
    } else if (error is UnauthorizedException) {
      var message = error.message;
     
    } else if (error is FetchDataException) {
      var message = error.message;
    }
  }

  static final _errorMessages = {
    '/v1/auth/login': {
      'title': 'Login Gagal',
      'description':
          'Waduh sepertinya email atau password yang anda masukkan salah. Silahkan masukkan email dan password lagi dengan benar.',
    },
  };
}
