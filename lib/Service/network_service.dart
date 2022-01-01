import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkHandler{

  static Future<http.Response?> getMethodCall({String? url,Map<String, String>? headers}) async {
    try {


      final response = await http.get(Uri.tryParse(url!,)!, headers: headers,



      );
      return response;
    }on SocketException{
      Get.snackbar('Error', 'Network Error',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (error) {
      Get.snackbar('Error', '$error',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }



}